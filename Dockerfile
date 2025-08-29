# syntax=docker/dockerfile:1

FROM kopia/kopia:0.21.1


# hadolint ignore=DL3008
RUN set -o errexit -o nounset -o xtrace \
	&& apt-get update \
	&& apt-get install --yes --no-install-recommends \
		jq \
	&& apt-get clean autoclean --yes \
	&& apt-get autoremove --yes \
	&& rm --recursive --force \
		/var/lib/apt/lists/* \
		/var/lib/cache/* \
		/var/lib/log/* \
		/var/tmp/* \
		/usr/share/doc/ \
		/usr/share/man/ \
		/usr/share/locale/ \
		/root/.cache \
		/root/.local \
		/root/.gnupg \
		/root/.config \
		/tmp/*

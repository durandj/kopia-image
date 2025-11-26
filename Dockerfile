# syntax=docker/dockerfile:1

FROM kopia/kopia:0.22.2

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# hadolint ignore=DL3008
RUN set -o errexit -o nounset -o xtrace \
	&& apt-get update \
	&& apt-get install --yes --no-install-recommends \
		gnupg \
	&& curl -fsSL https://repo.charm.sh/apt/gpg.key | gpg --dearmor -o /etc/apt/keyrings/charm.gpg \
	&& echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | tee /etc/apt/sources.list.d/charm.list \
	&& apt-get update \
	&& apt-get install --yes --no-install-recommends \
		gum \
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

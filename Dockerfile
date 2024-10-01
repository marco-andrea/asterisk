# Use Alpine as the base image for a lightweight container
FROM alpine:3.18

# Install the required packages, including Asterisk, PJSIP, and necessary codecs
RUN apk add --no-cache \
    asterisk \
    asterisk-curl \
    asterisk-opus \
    asterisk-chan-dongle \
    asterisk-sounds-en \
    asterisk-sample-config \
    curl

# Switch to the asterisk user
USER asterisk

# Start Asterisk with the required flags
CMD ["/usr/sbin/asterisk", "-T", "-W", "-U", "asterisk", "-p", "-vvvdddf"]

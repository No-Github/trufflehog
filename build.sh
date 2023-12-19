# goreleaser --snapshot --skip-publish --rm-dist

rm -rf trufflehog-amd64 trufflehog-arm64

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o trufflehog main.go
upx -9 trufflehog
mv trufflehog trufflehog-amd64

CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -ldflags="-s -w" -o trufflehog main.go
upx -9 trufflehog
mv trufflehog trufflehog-arm64
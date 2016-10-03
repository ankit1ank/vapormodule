import Vapor
import HTTP

final class VersionMiddleware: Middleware {
    func respond(to request: Request, chainingTo next: Responder) throws -> Response {
        let response = try next.respond(to: request)

        response.headers["Version"] = "API v1.0"
        print(response)

        return response
    }
}

let drop = Droplet(availableMiddleware: [
    "version": VersionMiddleware()
])

drop.get("hello") {
	req in 
	return "Hello world"
} 

drop.run()



import Foundation
import Tape

public class TapeServer
{
    var server: StreamServer?
    var controllers: Set<StreamController> = Set()

    init?()
    {
        let port = 1234
        guard let server = StreamServer(port: port, callback: self.handleMessage) else {return nil}
        self.server = server
    }

    public func handleMessage(controller: StreamController, message: Tape)
    {
        controllers.insert(controller)

        switch message
        {
            case .play(_):
                broadcast(message: message)
            default:
                print("Unhandled message: \(message)")
        }
    }

    public func broadcast(message: Tape)
    {
        for controller in controllers
        {
            controller.send(tape: message)
        }
    }
}

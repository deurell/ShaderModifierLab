import Cocoa
import SceneKit

class ViewController: NSViewController {
    
    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scnView = self.view as? SCNView
        scnView.showsStatistics = false
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = false
        
        scnScene = SCNScene()
        scnScene.background.contents = NSColor.gray
        scnView.scene = scnScene
        
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x:0, y:0, z:12)
        scnScene.rootNode.addChildNode(cameraNode)
        
        let geo = SCNBox(width: 6, height: 6, length: 6, chamferRadius: 1.0)
        
        guard let shaderURL = Bundle.main.url(forResource: "frag", withExtension: "shader"),
            let modifier = try? String(contentsOf: shaderURL)
            else { fatalError("Can't load shader from bundle.") }
        
        geo.shaderModifiers = [.fragment: modifier]
        
        let node = SCNNode(geometry: geo)
        geo.firstMaterial?.diffuse.contents = NSImage(named: "skull")
        geo.firstMaterial?.diffuse.wrapS = SCNWrapMode.repeat;
        geo.firstMaterial?.diffuse.wrapT = SCNWrapMode.repeat;
        scnScene.rootNode.addChildNode(node)
        scnView.isPlaying = true
    }
}

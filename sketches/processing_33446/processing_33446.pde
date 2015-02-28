
package daily

/**
 * Created by IntelliJ IDEA.
 * User: hellochar
 * Date: 7/8/11
 * Time: 8:00 PM
 */
import processing.core._
import toxi.color.{TColor, ColorGradient}
import remixlab.proscene._
import org.zhang.lib.misc.{TravList, Vec2}
import java.awt.event.KeyEvent
import zhang.MultiKeyListener

class Jul08b extends PApplet {
  import PApplet._; import PConstants._;
  implicit def d2f(d:Double) = d.asInstanceOf[Float]

  val operatorList = new TravList(Seq(((x:Float, y:Float) => x * y) -> "Mult",
                ((x:Float, y:Float) => x + y) -> "Add",
                ((x:Float, y:Float) => max(x, y)) -> "Max",
                ((x:Float, y:Float) => min(x, y)) -> "Min", //using -> notation here because it looks nice; not actually creating a Map
                ((x:Float, y:Float) => x-y) -> "Sub"
  ));
  //A TravList is a class from my own library that points at a specific item in a Seq; it has methods for moving to the left/right and retrieving the current item

  def varOperator:(Float, Float) => Float = operatorList.item._1 //the current operator that DOCs use

  val tgList = new TravList(Seq(PerlinNoiseTG, TwoSinsTG, SimplexNoiseTG,
                                new DOC(TwoSinsTG, PerlinNoiseTG),
                                new DOC(TwoSinsTG, SimplexNoiseTG),
                                new DOC(SimplexNoiseTG, PerlinNoiseTG),
                                new DOC(SimplexNoiseTG, PerlinNoiseTG, TwoSinsTG))) //the list of TGs
  def myTG:TerrainGenerator = tgList.item //the current TG


  def getZParameter = map(millis(), 0, 1000, 0, 1)
  object SimplexNoiseTG extends TerrainGenerator {
    var mapScl = .05f;
    def apply(v1: Int, v2: Int) = (toxi.math.noise.SimplexNoise.noise(v1*mapScl, v2*mapScl, getZParameter * mapScl) + 1) / 2
    override def toString = "Simplex Noise"
  }
  object PerlinNoiseTG extends TerrainGenerator {
    var mapScl = .1f;
    override def apply(x:Int, y:Int) = Jul08b.this.noise(x*mapScl, y*mapScl, getZParameter * mapScl);
    override def toString = "Perlin Noise"
  }
  object TwoSinsTG extends OperatorCombiner(new F2XTG(x => .5*(1 + sin(.025+12*radians(x*sin(x/225f))))),
                                     new F2YTG(y => .5*(1 + sin(.56+17*radians(y*cos(y/225f)))))) {
    def op = _ * _
    override def toString = "Two sins"
  }

    /**
  * Default operator combiner
  */
  class DOC(tgss:TerrainGenerator*) extends OperatorCombiner(tgss:_*) {
    override def op = varOperator
    override def toString = operatorList.item._2+"("+tgss.mkString(", ")+")"
  }

  abstract class OperatorCombiner(tgss:TerrainGenerator*) extends TGCombiner(tgss:_*) {

    def op:(Float, Float) => Float

    override def apply(tgs:TerrainGenerator*) = new TerrainGenerator {
      override def apply(x:Int, y:Int) = tgs.map(_.apply(x, y)).reduceLeft(op)
    }

  }

  abstract class TGCombiner(tgs:TerrainGenerator*) extends ((TerrainGenerator*) => TerrainGenerator) with TerrainGenerator {
    override def apply(x:Int, y:Int) = apply(tgs:_*)(x, y)
  }

  class F2XTG(f:(Float) => Float) extends TerrainGenerator { def apply(x: Int, y: Int) = f(x) }
  class F2YTG(f:(Float) => Float) extends TerrainGenerator { def apply(x: Int, y: Int) = f(y) }

  sealed trait TerrainGenerator extends ((Int, Int) => Float) {
    override def toString:String = getClass.getSimpleName
  }

  var heights:Array[Array[Float]] = _ //holds height data
  val zScl = 125 //a height value of 1 will be 125 pixels high

  val cGradient = new ColorGradient()
  cGradient.addColorAt(0*zScl, TColor.BLACK)
  cGradient.addColorAt(.1f*zScl, TColor.newHex("000C3B"))
  cGradient.addColorAt(.2f*zScl, TColor.newHex("0827A1"))
  cGradient.addColorAt(.201f*zScl, TColor.newHex("FBFFB3"))
  cGradient.addColorAt(.31f*zScl, TColor.newHex("75C90E"))
  cGradient.addColorAt(.45f*zScl, TColor.newHex("197500"))
  cGradient.addColorAt(.65f*zScl, TColor.newHex("785400"))
  cGradient.addColorAt(.75f*zScl, TColor.newHex("8F3700"))
  cGradient.addColorAt(.95f*zScl, TColor.newHex("DBA786"))
  cGradient.addColorAt(1.25f*zScl, TColor.newHex("F2E9E9"))
  cGradient.addColorAt(1.6*zScl, TColor.WHITE)
  val cList = cGradient.calcGradient(); //call calcGradient to get a ColorList object that you can actually get intermediate colors from

  def getColor(z:Float) = //returns the color for the given height
    if(z > 0 && z < cList.size()) cList.get(z.asInstanceOf[Int])
    else if(z < 0) TColor.BLACK
    else TColor.WHITE

  var scene:Scene = _
  var cam:Camera = _
  val mkl = new MultiKeyListener() //class from my own library that holds a set of currently pressed keys

  var arial25:PFont = createFont("Arial", 25)
  //IntelliJ's run mechanism screws up user.dir and makes it point towards where idea.exe lives which screws up Processing's sketch path,
  //so loadFont won't work correctly.

  override def setup() {
    size(800, 600, P3D)
    addKeyListener(mkl)
    scene = new Scene(this)
    scene.setGridIsDrawn(false); scene.setAxisIsDrawn(false);
    scene.disableKeyboardHandling() //the scene's keys interfere with my keys

    cam = scene.camera()
    cam.setPosition(new PVector(0, 0, zScl * 10 + 50))
    makeHeights(50, 50)
//    cam.setOrientation(0, PI/2)
  }

  var offset:PVector = new PVector()

  def boxSize = 25 //one height cell will be rendered as 25x25 pixels

  def portionWidth = heights.length * boxSize //width of the render
  def portionHeight = heights(0).length * boxSize //"height" of the render


  def makeHeights(x:Int, y:Int) {
    heights = Array.ofDim(x, y)
    updateHeights()
    scene.setCenter(new PVector(portionWidth/2, portionHeight/2, zScl/2))
    cam.setPosition(new PVector(portionWidth/2, portionHeight/2, cam.position().z));
    cam.setOrientation(0, 0)
  }

  def updateHeights(tg:TerrainGenerator = myTG) {
    for(x <- 0 until heights.length)
      for(y <- 0 until heights(x).length)
        heights(x)(y) = tg(x+offset.x.asInstanceOf[Int], y+offset.y.asInstanceOf[Int])*zScl
  }

  import KeyEvent._

  def addDir(o:PVector):() => Unit = { return (() => if(mkl.isPressed(VK_SHIFT)) offset.add(PVector.mult(o, 10)) else offset.add(o)) }
  val actionMap:Map[Int, () => Any] = Map(
                    VK_A -> addDir(new PVector(-1, 0)),
                    VK_D -> addDir(new PVector(1, 0)),
                    VK_W -> addDir(new PVector(0, -1)),
                    VK_S -> addDir(new PVector(0, 1)),
                    VK_Z -> makeSmaller _,
                    VK_X -> makeBigger _
  ) //Maps key codes to thunks; these actions will be smooth

  def makeSmaller() {
    makeHeights(heights.length + 5, heights(0).length + 5)
  }

  def makeBigger() {
    if(heights.length > 5)
      makeHeights(heights.length - 5, heights(0).length - 5)
  }

  override def draw() {
    background(255)
    lights()
    noStroke()

    //this line goes through each pair in the map and does the action if the key is pressed.
    actionMap.foreach{ case (keyCode, action) => if(mkl.isPressed(keyCode)) action() }

    updateHeights()

    //render the heights
    for(x <- 0 until heights.length) {
      for(y <- 0 until heights(x).length) {
        val z = heights(x)(y)
        val color = getColor(z)
//        println(z+"("+z.asInstanceOf[Int]+"): "+color.toARGB.toHexString)
        pushMatrix
        translate(x*boxSize, y*boxSize, z)
        fill(color.toARGB, 255)
        box(boxSize, boxSize, boxSize)
//        textAlign(CENTER, CENTER)
//        text(""+z, boxSize/2, boxSize/2, z*boxSize/2+30);
        popMatrix
      }
    }


    textAlign(LEFT, TOP)
    stroke(0); fill(0);
    textMode(SCREEN)
    textFont(arial25)
    text(myTG.toString+" ("+(tgList.index+1)+"/"+tgList.length+")", 0, 0, 0)

  }

  override def keyPressed() {
    tgList.move(key, 'q', 'e'); //when q is pressed, the tgList's index will decrement (with wrapping). e increases the index (with wrapping)
    operatorList.move(key, '1', '3')
  }
}

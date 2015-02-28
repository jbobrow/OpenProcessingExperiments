
// samuel bravo silva, santiago, chile. 2008. terreno.wordpress.com
// this code is the addition of superkrut's "processing tree" (http://blog.superkrut.se/?p=5) and
// "Vertices" by Simon Greenwold on processing.org/learning/3d/vertices.html

int nr=0;
BodyPart root;

float rootAngleX=1500;
float rootAngleY=0;
float px, py;

void setup() { 
  size(500, 500,P3D);
  colorMode(RGB, 1);
  root = new BodyPart(0, 0);
  
} 

void draw() { 

  //   println("frame");
  background(.98);
  lights();
  if(mousePressed){
    rootAngleY -= (mouseX-px);
    rootAngleX -= (mouseY-py);
    //println(rootAngleX);

  }
  translate(width/2, height, -30);
  rotateX(rootAngleX/1000);
  rotateZ(rootAngleY/1000);
  root.grow();
  root._angPosX = 0;
  // println(root._width);
} 

void mousePressed() 
{ 
  px=mouseX;
  py=mouseY;
} 

class BodyPart {
  BodyPart[] children = new BodyPart[3];
  private int child_nr=0;
  private float _width = 0;
  private float _height = 0;
  private float _widthspeed;
  private float _heightspeed;
  private float _angleX;
  private float _angleY;
  public float _angPosX;
  private float newangle;
  private float nextchild;

  public BodyPart(float angleX, float angleY){
    _angleX = angleX;
    _angleY = angleY;
    _angPosX = 0;
    _widthspeed=.05;
    _heightspeed=.3;
    nextchild = 2;
  }

  public void grow(){
    if(keyPressed == true){
      _height+=_heightspeed;
      _width+=_widthspeed;
      //if(child_nr<3 && random(0,_width*10)/((child_nr+1)*(child_nr+1))>15){
      if(_width>nextchild && child_nr<3){
        nextchild+=random(1,10)*(child_nr+1);
        _heightspeed*=.4;
        newangle = random(.2,.8);
        children[child_nr++] = new BodyPart(random(-newangle,newangle), random(-newangle,newangle));
      }
    }  

    paint();

    for(int i = 0;i<child_nr;i++){
      pushMatrix();
      children[i].grow();  
      popMatrix();
    }
  }
void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {

  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  noStroke ();
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  rotateX(-PI/2);
}
  private void paint(){
    rotateX(_angleX+sin(_angPosX+=.1/_width)/10+PI/2);
    rotateY(_angleY+sin(_angPosX+=.1/_width)/10);
    fill(_width/20,.5,.5,.4);
    drawCylinder(_width/2, _width/2.3, _height, 16);
    translate(0,0,_height);
  }
 }







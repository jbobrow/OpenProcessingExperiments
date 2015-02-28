

/*****************header notes****************/
/*
ideas:
use this to teach sine and cos
have students run test equations to see what kind of wave is generated
connect the waves to sound/light etc.

need to get a text box working here... why isn't it?
*/
/*****************import libraries****************/
import controlP5.*;
/*****************set variables****************/
ControlP5 controlP5;
Slider2D s;



/*****************initialize program****************/
void setup() {
  size(800,600);
  controlP5 = new ControlP5(this);
  //Slider2D s = controlP5.addSlider2D("slider",0,10,0,10,5,5, 20,100,100,100);
  s = controlP5.addSlider2D("wave",30,40,100,100);//this changes the size of the box on the left
  s.setArrayValue(new float[] {50, 50});  
  smooth();
}
/*****************functions****************/
float cnt;
PFont font;

void draw() {
  font = loadFont("AbyssinicaSIL-48.vlw"); 
//fill (255);
textFont(font); 

  text("word", width/2, height*.30); 
  background(0);
  pushMatrix();
  translate(360,340);//moves the wave around in the frame
  strokeWeight(1);
  stroke(255,100);
  rect(-100,-100, 600,400);//changes size of frame of rectangle
  line(0,0,400, 0);//the i value below and the line length should be the same for continuity
  stroke(255);
  
  strokeWeight(2);
  for(int i=1;i<400;i++) {
    float y0 = cos(map(i-1,0,s.arrayValue()[0],-PI,PI)) * s.arrayValue()[1]; 
    float y1 = cos(map(i,0,s.arrayValue()[0],-PI,PI)) * s.arrayValue()[1];
    line((i-1),y0,i,y1);
  }
  
  popMatrix();
}


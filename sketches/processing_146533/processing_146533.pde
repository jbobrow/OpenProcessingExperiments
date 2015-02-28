
import ddf.minim.*; 

Minim minim;
AudioInput in; 

float xPos;
float yPos;
float xEnd;
float yEnd;
float ran;
float numl;
int num ;
float[] lines = new float[num];
float wide;

void setup() {
  size(1200, 800, P3D);
   num = int(numl);
  float ran = random(1);
  frameRate(60);
  smooth();  
  minim = new Minim(this);
  in = minim.getLineIn();
  wide = random(4,10);
}

void draw() { 
  background(0);
  numl =- (10/in.left.get(1000)+in.right.get(1000));
  xPos = 0;
  yPos = random(0, 800);
  xEnd = 1200;
  yEnd = random(0, 800);

  for (float i = 0; i < numl; i++) {
    line(xPos, yPos, random(50), xEnd, yEnd,random(100,-100));   }
  
    strokeWeight(wide);
    float ran = random(10.);
    if(ran <= 2) stroke(#40FFA6);
    else if(ran > 0 && ran < 3) stroke(#00AFD6);
    else if(ran > 4 && ran < 6) stroke(#D28BE0);
    else if(ran > 6 && ran < 8) stroke(#FF8800);
    else if(ran > 8 && ran < 10) stroke(#FFEE51);
    
  }   



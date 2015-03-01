
 PFont myFont;

float noiseScale=0.02f;
void setup(){
 size(1200,300);
 background(0);
 smooth();
}
float n=0.00f;
float d=0.3f;
void draw() {
  myFont = createFont("HelveticaNeue-Light-48", 22);
  textFont(myFont);
   textAlign(CENTER, CENTER);
  fill(255);
  text("E x p l o r e F l u i d i t y", 100*6,140);

  
  // by drawing rect :test to underastan where the button is
//  rect(100*5,90,90,10);
     if (mouseX>100*5 && mouseX<100*6 || mouseY>90 && mouseY<100){
      drawingGraph();
     }
}
void fullScreen(){
  
  
}

void   drawingGraph(){
n=n+d;
  background(0);
  for (int y=0; y<40; y++) {
   for(int x=0; x<300; x++) {
    float noiseVal = noise((n+x)*noiseScale,(n+y)*noiseScale,y*noiseScale);
    stroke(0,(noiseVal*mouseY),(noiseVal*400));
//   noFill();
//    line(x*3.5,0,x*3.5,(noiseVal*300));
// 
    point(x*4,noiseVal*300);


    }
  }
}


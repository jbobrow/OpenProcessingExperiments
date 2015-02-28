

//Syphon 0.4 by Andres Colubri 
//http://interfaze.info/


import codeanticode.syphon.*;

PGraphics canvas;
SyphonServer server;

void setup() {
  size(400,400, P3D);
  canvas = createGraphics(400, 400, P3D);
  smooth();
  noStroke();

  
  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
}

int R=100;
char G=100;
int B=0;

void draw() {
  canvas.beginDraw();
  canvas.background(0);
  //canvas.lights();
  //canvas.translate(width/2, height/2);
  //canvas.rotateX(frameCount * 0.01);
  //canvas.rotateY(frameCount * 0.01); 

 for (int x=40; x<400; x+=100){
   B=B+50;
   for (int y=40; y<400; y+=100){
     R=R+50;  
     fill(R,G,B);
     ellipse(x, y, 40, 40);
  }
 } 
 B=0;
  //canvas.box(150);
  canvas.endDraw();
  //image(canvas, 0, 0);
  server.sendImage(canvas);
}


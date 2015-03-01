
import processing.serial.*;
Serial myPort;
float aPos;
float bPos;
float cPos;

float pointAx = 244.09;
float pointAy = 244.09;
float pointBx = 400;
float pointBy = 179.51;
float pointCx = 555.91;
float pointCy = 244.09;
float pointDx = 620.49;
float pointDy = 400;
float pointEx = 555.91;
float pointEy = 555.91;
float pointFx = 400;
float pointFy = 620.49;
float pointGx = 244.09;
float pointGy = 555.91;
float pointHx = 179.51;
float pointHy = 400;
float pointIx = 244.09;
float pointIy = 244.09;
float pointJx = 400;
float pointJy = 179.51;
//float pointKx = 555.91;
float pointKx = 244.09;
float pointKy = 244.09;
PImage stage;



void setup() {
  size(800, 800);
  stage = loadImage("Background_stage.jpg");
  String portName ="/dev/tty.usbmodem1411";
  // myPort = new Serial(this, portName, 9600);
  // myPort.bufferUntil('\n');


}

void draw() {
  
  
  image(stage, 0, 0, width, height);
  
  Orb();
  
  
}
// pointIx

void serialEvent(Serial myPort) {
 String input = myPort.readString();
 String[] numbers= split(input, ',');
 float[] values = float(numbers);
 aPos = values[0];
 bPos = values[1];
 cPos = values[2];

 myPort.write('x');
}

void Orb(){
  fill(30,200,150);
  fill(random(100,150)*.05+map(cos(frameCount*0.05), -1, 1, -50, 50), random(100,200)*0.05, map(cos(frameCount*0.03), -1, 1, -50, 50));
  noStroke();
  // curveTightness(1);
  beginShape();
  curveVertex(pointAx+aPos+map(cos(frameCount*0.01), -1, 1, -50, 50), pointAy+aPos*2+map(cos(frameCount*0.01), -1, 1, -50, 50));
  curveVertex(pointBx+map(sin(frameCount*0.02), -1, 1, -50, 50), pointBy+map(cos(frameCount*0.02), -1, 1, -50, 50));
  curveVertex(pointCx+map(cos(frameCount*0.01), -1, 1, -50, 50),  pointCy+map(cos(frameCount*0.01), -1, 1, -50, 50));
  curveVertex(pointDx+bPos+map(cos(frameCount*0.2), -1, 1, -50, 50), pointDy+-bPos+map(cos(frameCount*0.2), -1, 1, -50, 50));
  curveVertex(pointEx+map(sin(frameCount*0.01), -1, 1, -50, 50), pointEy+map(cos(frameCount*0.01), -1, 1, -50, 50));
  curveVertex(pointFx+map(cos(frameCount*0.02), -1, 1, -50, 50), pointFy+map(cos(frameCount*0.02), -1, 1, -50, 50));
  curveVertex(pointGx+cPos+map(sin(frameCount*0.01), -1, 1, -50, 50), pointGy+cPos+map(sin(frameCount*0.01), -1, 1, -50, 50));
  curveVertex(pointHx+map(cos(frameCount*0.02), -1, 1, -50, 50), pointHy+map(cos(frameCount*0.02), -1, 1, -50, 50));
  curveVertex(pointIx+map(sin(frameCount*0.01), -1, 1, -50, 50), pointIy+map(cos(frameCount*0.01), -1, 1, -50, 50));
  curveVertex(pointJx+cPos+map(cos(frameCount*0.02), -1, 1, -50, 50), pointJy+cPos+map(cos(frameCount*0.02), -1, 1, -50, 50));
  curveVertex(pointKx-map(sin(frameCount*0.01), -1, 1, -50, 50), pointKy+map(cos(frameCount*0.01), -1, 1, -50, 50));

  //curveVertex(pointAx+aPos+map(cos(frameCount*0.03), -1, 1, -50, 50), pointAy+aPos+map(cos(frameCount*0.03), -1, 1, -50, 50));
  // curveVertex(pointAx+aPos+map(cos(frameCount*0.03), -1, 1, -50, 50), pointAy+aPos*2);
  endShape(CLOSE);
  
  if(pointAx<=pointBx){
  pointAx = pointBx;
  dist(pointAx,pointAy,pointBx,pointBy);
  }
}





/**
 *terrain/worm generation
 *
 *
*/
//import processing.pdf.*;

int formPoints = 2; //generates points for the shape
int pointVariation = 15; //generates the distance and variation between points
float shapeSize = 1200; //initial shape size
float posX, posY; //center point of the form
float[] x = new float[formPoints];
float[] y = new float[formPoints];

void setup(){
  size(1200, 600);
//  beginRecord(PDF, "something.pdf");
  background(250);
  smooth();
  stroke(0, 3);
 // noStroke();
  frameRate(60);

  // init pos
 if(posX != 80 + shapeSize){
  posX = width/2;
  posY = height/1.3;
 }
 //init form
  float angle = radians(360/float(formPoints));
  for (int i = 0; i < formPoints; i++){
   x[i] = cos(angle*i) * shapeSize;
   y[i] = sin(angle*i) * shapeSize; 
  }
}

void draw(){
  //draws ouline
  strokeWeight(300);
 
  //random colour fill, add more values to generate colour, or use no fill
// fill(0, random(2));
  noFill();
 
/* //returns worm to x
  if(posX < width + shapeSize){
    posX += random(-1, +1); //distance between each shape
    posY += random(-1, +1); //random height
  }else{
    posX = 0;
    posY = random(height);
  }
  */
 
  //draws shape
   for (int i = 0; i < formPoints; i++){
    x[i] += random(-pointVariation, pointVariation)*.15;
    y[i] += random(-pointVariation, pointVariation)*.15;
  }
 
  beginShape(); //defines shape
    // start controlpoint
    curveVertex(x[0]+posX, y[0]+posY);

    for (int i=0; i < formPoints; i++){
      curveVertex(x[i] + posX, y[i] + posY);
    }

    // end controlpoint
    curveVertex(x[1] + posX, y[1] + posY);
    endShape(CLOSE);

}

//void keyPressed() {
//  if (key == 'q') {
//    endRecord();
//    exit();
//  }
//}


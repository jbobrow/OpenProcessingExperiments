
/**
 *terrain/worm generation
 *
 *
*/

int formPoints = 15; //generates points for the shape
int pointVariation = 1; //generates the distance and variation between points
float shapeSize = 50; //initial shape size
float posX, posY; //center point of the form
float[] x = new float[formPoints];
float[] y = new float[formPoints];

void setup(){
  size(1000, 300);
  background(250);
  smooth();
  stroke(0, 50);
  frameRate(60);

  // init pos
 if(posX != 80 + shapeSize){
  posX = 0; 
  posY = random(height);
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
  strokeWeight(.75);
  
  //random colour fill, add more values to generate colour, or use no fill
 fill(random(255), random(205), 200);
  //noFill();
  
  //returns worm to x 
  if(posX < width + shapeSize){
    posX += random(5)+1; //distance between each shape
    posY += random(-10, +10); //random height
  }else{
    posX = 0;
    posY = random(height);
  }
  
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
    curveVertex(x[formPoints-1] + posX, y[formPoints-1] + posY);
    endShape();

}


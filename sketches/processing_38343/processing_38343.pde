
int rectX = 250;
int rectY = 250;
int w = 100;
int h = 100;

float oddgear = 0;
float evengear = 0;
float dangle = 0;

void setup(){
  size(200,200); //P3D parameter enables multiple rotations
  background(255,0);
  rectMode(CENTER);
  smooth();
  frameRate(100);
}

void draw(){
  //transformations reset each loop through draw
  background(0);
  stroke(0);
  fill(207,183,70);
  
  //gear 1
  pushMatrix(); //pushmatrix/popmatrix allow for simultaneous transformations (around a given translated point)
  translate(50, 50); //each push/pop allows the individual image to be moved frame by frame,
  rotate(radians(oddgear));
  //creates the gear shape
  for(float gearangle = 0; gearangle <360; gearangle +=45)
  {
    rect(0, 0 , 10, -62);
    rotate(radians(gearangle));
  }
  ellipse(0,0, 50,50);
  fill(0);
  ellipse(0,0,10,10);
  popMatrix();
  
  //gear 2
   pushMatrix();
  translate(48, 107); 
  rotate(radians(evengear));
  fill(207,183,70);
  rotate(22.5);
  for(float gearangle = 0; gearangle <360; gearangle +=45)
  {
    rect(0, 0 , 10, -62);
    rotate(radians(gearangle));
  }
  ellipse(0,0, 50,50);
  fill(0);
  ellipse(0,0,10,10);
  popMatrix();
  
  //gear 3
  pushMatrix();
  translate(105, 110); 
  rotate(radians(oddgear));
  fill(207,183,70);
  for(float gearangle = 0; gearangle <360; gearangle +=45)
  {
    rect(0, 0 , 10, -62);
    rotate(radians(gearangle));
  }
  ellipse(0,0, 50,50);
  fill(0);
  ellipse(0,0,10,10);
  popMatrix();
  
    //gear 4
   pushMatrix();
  translate(101, 166); 
  rotate(radians(evengear));
  fill(207,183,70);
  rotate(22.5);
  for(float gearangle = 0; gearangle <360; gearangle +=45)
  {
    rect(0, 0 , 10, -62);
    rotate(radians(gearangle));
  }
  ellipse(0,0, 50,50);
  fill(0);
  ellipse(0,0,10,10);
  popMatrix();
  
   //gear 5
  pushMatrix();
  translate(157, 170); 
  rotate(radians(oddgear));
  fill(207,183,70);
  for(float gearangle = 0; gearangle <360; gearangle +=45)
  {
    rect(0, 0 , 10, -62);
    rotate(radians(gearangle));
  }
  ellipse(0,0, 50,50);
  fill(0);
  ellipse(0,0,10,10);
  popMatrix();
  
  
  //increments the angles: odd numbered gears spin clockwise, vice versa
  oddgear += 1;
  evengear += -1;
}




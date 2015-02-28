
float x1pos ;
float  y1pos ;

float  a = 45;
float redprogress = 0;
float greyprogress = 0;
float sphereX=0;


void setup() {
  size(600,600);
 x1pos = width/2;
  y1pos = height/2;

 
}

void draw() {

  fill(0,15);
  rect(0,0,600,600);
  
  //grey bar
  fill(50);
  stroke(50);
  rect(0,570,600,30);
  //red bar
  fill(255,0,0);
  rect(0,560,redprogress,15);
  //light grey bar
  fill(80);
  rect(greyprogress,560,600,15);
  //loading circle
 fill(255);
  ellipse((x1pos+10),(y1pos-25) ,15,15);
  //progress circle
  fill(255);
  ellipse(sphereX,568,20,20);
  fill(80);
  ellipse(sphereX,568,6,6);
  //play button
  fill(100);
  triangle(10,579,10,599,30,589);

  
  
  
 /*
  rotate(radians(a));
  fill(255);
 ellipse((xpos+10),(ypos-25) ,15,15);
 
 fill(255, 230);
 ellipse((xpos+30),(ypos-10) ,15,15);
  
 fill(255,205);
 ellipse((xpos+30),(ypos+10) ,15,15);
  
 fill(255,180);
  ellipse((xpos+10),(ypos+25) ,15,15);
 
   fill(255, 160);
 ellipse((xpos-10),(ypos-10) ,15,15);
  
 fill(255,120);
 ellipse((xpos-10),(ypos+10) ,15,15);
 
  */
  
 a=a+2;
 redprogress++;
 greyprogress++;
 if (sphereX<590) {
 sphereX++;
 }
  float x1change =cos(radians(a));
  float y1change =sin(radians(a));
  
 

  
  x1pos += x1change;
  y1pos += y1change;


  
  
 
  
}
  



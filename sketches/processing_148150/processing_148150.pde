
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
 float grade = random(0,100); 
 if (grade==100 || grade>=90) { 
 println( "RANKED A. "); 
 } else if (grade==89 || grade>=70) { 
 println ("RANKED B"); 
 } 
 else if (grade==69 || grade>=50) { 
 println("RANKED C"); 
 }
  else if (grade==49 || grade>=45) { 
 println("RANKED D "); 
 }
  else { 
 println("LOSER"_); 
 } 


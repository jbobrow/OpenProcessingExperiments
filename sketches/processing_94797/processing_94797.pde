
void setup(){
 size(900,500); //Size of window
 frameRate(8);  //8 frames per second
 noStroke(); //no lines around shape
 ellipseMode(CENTER); //x, y position is the center of circles
 
}

void draw(){
 background(random(255), random(255), random(255)); //random background color
 float x= random(0,900); //sets random x between 0-900
 float y= random(0,500); //sets random y between 0-500
 fill( random(0,178), random(107,255), random(0,175), 100);  //fill in color of ellipse with random color with 39% transparancy
 ellipse(x, y, random(0,100), random(0,100)); //ellipses
 if(x<=450){ //happens only of x is equal to or less than 450
   float a= random(0, 100); //sets random a between 0-100
   float b= random(0, 100); //sets random b between 0-100
   fill(239,245,161); //yellow color of squares
   rect(random(0, 900), random(0,500), a, b); //rectangles
 } else { //if x is greater than this happens
   float d= random(0, 900); //sets random d between 0-900
   float e= random(0, 900); //sets random e between 0-900
   float f= random(0, 900); //sets random f between 0-900
   float g= random(0, 900); //sets random g between 0-900
   float h= random(0, 900); //sets random h between 0-900
   float i= random(0, 900); //sets random i between 0-900
   float j= random(0, 900); //sets random j between 0-900
   float k= random(0, 900); //sets random k between 0-900
   fill(random(255), random(255), random(255), 120); //random curve color with 47% transparancy
   curve(d, e, f, g, h, i, j, k); //makes curve with random set points
   
  
 }
  
  
}


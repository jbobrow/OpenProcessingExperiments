
// Kimberlee Botha
// I.D 300230429

PImage a;
PImage destination;
int pointillize = 60;
int smallPoint = 5;
int largePoint;
int top, left;


void setup() {

  size(500,1000);
  a = loadImage("beehive4purpleglow.jpg");
   destination = createImage(a.width, a.height, RGB);
  noStroke();
  background(40);
  smooth();
largePoint = min(width, height) / 10;
//center the image on the screen
left = (width - a.width) / 2;
top = (height - a.height) /2;
  for(int i = 0; i < 1000; i=i+20);
  for(int t = 0; t < 500; t=t+20);}

void draw() {




  for(int b = 0; b < 1000; b=b+20);
  for(int m = 0; m < 500; m=m+20);
 

  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  float fill = map(mouseY, 500, width, smallPoint, largePoint);
  int d = int(random(a.width));
  int g = int(random(a.height));
  int h = int(random(a.height/3));
  color pix = a.get(d, g);
  noStroke();
  fill (pix, random(1,80));
  ellipse(left + d, top + g, pointillize, pointillize);
  fill (pix, random(1,80));

  stroke(pix, random(10,20));
  line (0,0,random(0,500), random(0,1000));
  fill(10,10,20,50);


  noStroke();
  fill(pix, random(1,100));
  rect(left + d,top + g, pointillize, pointillize);
  rect (d, g, pointillize, pointillize);  
 

  
  }






void keyPressed() {
 
//Takes PNG screenshots when you push S 
 
//Careful - doesn't prompt when overwriting files! 
 

 
 if(key == 's' || key == 'S') 
 
{ 
 
   String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser 
 
   if(filePath != null) 
 
   { 
 
     save(filePath + ".png"); 
 
  } 
 
 } 
 
} 





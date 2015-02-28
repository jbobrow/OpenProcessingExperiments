
// Kimberlee Botha

PImage a;
PImage destination;
int pointillize = 60;
int smallPoint = 5;
int largePoint;
int top, left;


void setup() {

  size(500,1000);
  a = loadImage("tepapaorange.jpg");
   destination = createImage(a.width, a.height, RGB);
  noStroke();
  background(40);
  smooth();
largePoint = min(width, height) / 10;
//center the image on the screen
left = (width - a.width) / 2;
top = (height - a.height) /2;
}

void draw() {


{
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  float fill = map(mouseY, 500, width, smallPoint, largePoint);
  int x = int(random(a.width));
  int y = int(random(a.height));
  int z = int(random(a.height/3));
  color pix = a.get(x, y);
  noStroke();
  fill (pix, random(1,80));
  ellipse(left + x, top + y, pointillize, pointillize);
  fill (pix, random(1,80));
  stroke(pix, random(10,20));
  line (0,0,random(0,500), random(0,1000));
  fill(10,10,20,50);


  noStroke();
 fill(pix, random(1,100));
  rect(left + x,top + y, pointillize, pointillize);
rect (left + x, top + y, pointillize, pointillize);  

  }

}

//void keyPressed() 
 
//Takes PNG screenshots when you push S 
 
//Careful - doesn't prompt when overwriting files! 
 
//{ 
 
  //if(key == 's' || key == 'S') 
 
  //{ 
 
   // String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser 
 
    //if(filePath != null) 
 
  //  { 
 
    //  save(filePath + ".png"); 
 
    //} 
 
  //} 
 
//} 






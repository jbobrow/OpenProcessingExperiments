

void setup() {
  //sets up background to be random shades of blue
  background(random(0,30),random(0,120),random(0,600),random(30,50));
  size(600, 600);
  smooth();
  stroke(30,30,30,30);
}
//setting up the initial order of the composition
//provides the information needed to draw the grid of circles
int marginX = 0; 
int marginY=0;
int distance = 600;
int spacing = 50;

//sets up the variables for the transformation
int a = 1000;
int b = 500; 


void draw() {
  //the for loop must be within the void draw in order to work
  //the for loop is drawing the grid of ellipses
   for (int x=marginX; x<=distance; x+=spacing) {
    for (int y=marginY; y<=distance; y+=spacing) {
      fill(30,50,30,5);
      ellipse(x, y, 50, 50);
    }}
 noFill();

 //this creates the pulsing effect of the background
  strokeWeight(random(1,2));
  stroke(random(0,30),random(0,120),random(0,600),random(30,50));
  
  //transforming information to accomodate the rotating ellipses
  pushMatrix();
    translate(spacing+50,spacing+50); 
    rotate(radians(a));        
    translate(0,0);           
    rotate(radians(b + 100));   
  //(epicenter) draws the one set of ellipses that is going crazy in the top left  
    ellipse(random(0,0),random(0,0),random(0,45),random(0,45));         
   //(waves)draws the set of ellipses that rotate around the epicenter
    ellipse(300,300,random(0,45),random(0,45));
    ellipse(175,175,random(0,45),random(0,45));
    ellipse(100,100,random(0,45),random(0,45));
    ellipse(50,50,random(0,45),random(0,45));
  popMatrix();

  b+=300;
  a++;  
  
}



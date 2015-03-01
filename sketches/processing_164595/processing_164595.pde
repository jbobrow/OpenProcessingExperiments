
//runs code only once line by line 
//global floats 
float x, y;
float dim = 80.0;
float angle;
float wiggle;
float j= 100;

void setup () {
  //sets sketch size to 500px by 500 px
  size (500,500);
}

//runs code as a loop at default frame rate 
void draw () {
  //if key 'q' is pressed, it will show "eyemovement" sketch
  if (key == 'q' || key == 'Q') {
   eyemovement (); }
  
  //if key 'w' is pressed it will switch to colorsaturation sketch
    else if (key == 'w' || key == 'W') {
    Colorsaturation (); }
  
  //if key 'e' is pressed it will show motion detection
    else if (key == 'e' || key == 'E') {
    motiondetection (); } 

}
//Motion detection code- will show when key e is pressed 
void motiondetection () {

//sets background color 
background (0);

  //determines where on the screen the rectangle moves 
   j= j -1; 
  if (j < 0) {
    j = height; }
    
  //creates a line 
  line (0, j, width, j); 
  //sets fill to rectangle
  fill (255);
  //creates a rectangle
  rect (0, j, height, j);
 
 //sets the fill of the ellipse
   fill (255);
   //sets no stroke to the ellipse
   noStroke ();
  //ellipses will appear at x,y coordinates at the dimensions set here
  ellipse (17,17, 30, 30);
  ellipse (475, 477, 30, 30);
  ellipse (20, 475, 30, 30);
  ellipse (476,20, 30, 30);
  
  //sets fill to ellipse
  fill (#5D1913);
  //sets no stroke on ellipse
  noStroke ();
  //ellipse will appear at coordinate 250,250 and will be 100 by 100.
  ellipse (250, 250, 100, 100);
  
}

//color saturation sketch will appear when key 'w' is pressed    
void Colorsaturation (){
 
//sets no stroke around shapes 
noStroke();
//sets background of sketch
background (#FFFBA5);

//sets the color of each circle 
 color inside = color (#C54CEA);
 color middle = color (#AB42CB);
 color outside = color (#7F3098);

//makes the first rectangle move across the screen 
pushMatrix();
translate (80,80);
//sets the fill to the ellipses 
fill(outside);
//sets the coordinates of the ellipse and the dimensions 
ellipse (40,40, 200, 200);
fill (middle);
ellipse (40,  45, 150, 150);
fill (inside);
ellipse (40, 50, 85, 85);
popMatrix();

//pushes the current transformation and stacks it on the other transformation
pushMatrix();
//specifies an amount to displace objects within the display window
translate (80,80);
//sets fill to ellipse 
fill(outside);
//ellipse will appear at 300,300 (x,y) coordinates and dimensions of 200 by 200
ellipse (300,300, 200, 200);
//sets fill to middle ellipse 
fill (middle);
//ellipse will appear at 300, 305 coordinates with dimenions of 150 by 150
ellipse (300,  305, 150, 150);
//sets fill to inside ellipse 
fill (inside);
//ellipse will appear at 300,300 coordinate with dimensions of 85 by 85
ellipse (300, 300, 85, 85);
//pops the current transformation matrix off the matrix stack 
popMatrix();

x = x + 0.8;
  
  if (x > width + dim) {
    x = -dim;
  } 
  
  translate(x, height/2-dim/2);
  fill(#47085A);
  rect(-dim/2, -dim/2, dim, dim);
  
  translate (x, dim);
  fill (#47085A);
  rect (-dim/2, -dim/2, dim, dim);
 
  
}

//3rd sketch will appear when key 'q' is pressed 
void eyemovement (){
//decimal values 

//sets background color of sketch 
 background(mouseX, mouseY,#5AFF7F);
 //no stroke on rectangle 
 noStroke();
  //sets fill color 
  fill(#A234A2);
  //where rectangle appears on the screen 
  rectMode(RIGHT);
  
// sets how fast the rectangle will rotate 
  if (second() % 2 == 0) {  
    //makes the rectangle move 
    wiggle = random(-.1, .1);
  }
//determines where the rectnagle will rotate on the screen 
  angle = angle + wiggle;
  float c = cos(angle);
//where rectangle will rotate to
  translate(width/4, height/4);
  rotate(c);
//creates rectangle at 0x,0y with dimensions 180 by 180
  rect(0, 0, 180, 180);   

//sets fill to ellipse
  fill (#A234A2);
//ellipse will appear at coordinates 275,275 with dimensions of 75 by 75
  ellipse (275, 275, 75,75);
 //sets fill to ellipse 
  fill (#A234A2);
//ellipse will appear at coordinate 400x,100y with dimensions of 75 by 75
  ellipse (400, 100, 75,75);
//sets fill to ellipse 
  fill (#A234A2);
//ellipse appeard at coordinates x300, y155 with dimensions of 75 by 75
  ellipse (300, 155, 75, 75);
  
  
}

  





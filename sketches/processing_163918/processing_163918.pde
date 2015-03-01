
//void setup: runs code only once line by line 
void setup () {
//size: sets sketch size to 400px by 400px 
  size (400,400);

}
//void draw: runs the code as a loop at default frame rate   
void draw () {

  
//if key 'q or 'Q' is pressed, repeition sketch will play
  if (key == 'q' || key == 'Q') {
    Repetition () ;
  }
//if key 'w' or 'W' is pressed, Proximity will play 
  else if (key == 'w' || key == 'W') {
    Proximity (); }
//if key 'e' or 'E' is pressed, figure/ground will play 
  else if (key == 'e' || key =='E') {
    figureground (); }
  
  }

    
    
//sets new function called (repetition)     
void Repetition (){
//sets background of sketch 
background(242,255,149);
//sets no stroke around rectangle
noStroke();
//sets the fill to rectangle
fill(137,222,255);
//draws a rectangle to x,y, then dimensions of it x,y
rect (0, 100, 50, 50);
rect (50,150,50,50);
rect(100,200,50,50);
rect (150, 250, 50,50);
rect (200, 300, 50, 50);
rect (250, 350, 50, 50);

//rect appears at 0,0 on the sketch and has a width/height of 50
rect (0, 0, 50, 50);
rect (50,50, 50, 50);
rect (100, 100, 50, 50); 
rect (150, 150, 50, 50);
rect (200, 200, 50, 50);
rect (250, 250, 50, 50);
rect (300, 300, 50, 50);
rect (350, 350, 50, 50);
rect (400, 400, 50, 50);

rect (150, 50, 50, 50);
rect (100, 0, 50, 50); 
rect (200, 100, 50, 50);
rect (250, 150, 50, 50);
rect (300, 200, 50, 50);
rect (350, 350, 50, 50);
rect (350, 250, 50, 50);

rect (0, 200, 50, 50); 
rect (50, 250, 50, 50);
rect (100, 300,50, 50);
rect (150, 350, 50, 50);

rect (0, 300, 50, 50);
rect (50, 350, 50, 50);

rect (200, 0, 50, 50);
rect (250, 50, 50, 50);
rect (300, 100, 50, 50); 
rect (350, 150, 50, 50);

rect( 300, 0, 50, 50);
rect (350, 50, 50, 50);

}

//new function called (proximity)
void Proximity (){
//background color is set to white 
  background (250); 

//stroke: gives the ellipse a stroke of red
stroke (255, 78, 62);
//strokeWeight: sets the stroke of the ellipse to a 10 weight
strokeWeight(10);
//fill: sets the fill to the ellipse to red color 
fill(250);
//ellipse: 50,50 is where ellipse appears on screen. 85,85 are the dimensions of the ellipse
ellipse ( 50, 50, 85, 85); 
ellipse (150, 50, 85, 85); 
ellipse (250, 50, 85, 85);
ellipse (350, 50, 85, 85);

//sets the color that the ellipse will have 
fill (255, 78, 62); 
//ellipse appears at x,y (50,150) on the sketch
//75, 75 are the dimensions of the ellipse 
ellipse (50, 150, 75, 75);
ellipse (150, 150, 75, 75);
ellipse (250, 150, 75, 75);
ellipse (350, 150, 75, 75);

//stroke: gives the ellipse a stroke
stroke (255, 78, 62);
//strokeWeight: makes the stroke on the ellipse thicker  
strokeWeight(10);
fill(250);
ellipse (50, 250, 85, 85); 
ellipse (150, 250, 85, 85); 
ellipse (250, 250, 85, 85);
ellipse (350, 250, 85, 85);

fill (255, 78, 62); 
ellipse (50, 350, 75, 75);
ellipse (150, 350, 75, 75);
ellipse (250, 350, 75, 75);
ellipse (350, 350, 75, 75);

}

//void sets a new function which is called figureground
void figureground (){
//sets background color of sketch 
  background (#B01FDE);
//float: decimal point nunber can be entered as a float 
float x = mouseX;
float y = mouseY;


//sets the fill of the ellipse to orange 
fill (#FFA646);
//gives no stroke to the ellipse
noStroke();
//(mouseX,mouse Y is where the ellipse will be on the sketch)
//135 by 135 is how big the ellipse is
ellipse (mouseX, mouseY, 135, 135);
//sets the fill to the first rectangle green
fill (#81F022);
//(189,189 is where the rect appears on the screen. (100,100) is the width and height of the rectangle
rect (189,189, 100, 100);
fill (#2291F0);
rect  (200, 200, 75, 75);
fill (#81F022);
rect(215, 215, 45, 45); 


 
}
  



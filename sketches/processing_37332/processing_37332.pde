
void setup() {
    //Set the size of the window
  size(320, 240) ;
}
 
 void draw() {
    //Draw a white background 
background(255) ; 
smooth() ; 

  //Set CENTER mode
ellipseMode(CENTER) ;
rectMode(CENTER) ; 

//Draw Shelby's head//
stroke(0) ; 
fill(10, 0, 255) ; 
ellipse(mouseX, mouseY, 100, 100) ; 

//Dray Shelby's body//
stroke(0) ;
fill(155, 0, 155) ; 
rect(100, 60, 60, 170) ;

//Draw Shelby's Legs//
stroke(0, 191, 191) ;
line(70, 145, 70, 200) ; 
line(90, 145, 90, 200) ; 
line(110, 145, 110, 200) ;
line(130, 145, 130, 200) ;

stroke(0) ;
println("Shelby Likes Personal Digital Space") ;
 }




void setup () {
size (650,500); // Set the size of the window

}

void draw () {
  if(mousePressed) {
 stroke(4);
  fill(175);
  rectMode(CENTER);
  rect(mouseX,mouseY,100,50);
}
  
background (255) ; // Draws a white background
smooth (); //Anti-Alias


//set ellipses and rects to CENTER mode
ellipseMode (CENTER) ;
rectMode (CENTER) ;

//Primary_Bottom Rect

stroke (0) ;
strokeWeight(abs(mouseX-pmouseX));
fill(0);
rect (100,450,900,15) ;

//Bottom Rect 1
rect (100,375,700,15) ;

//Bottom Rect 2
rect (100,300,500,15) ;


//Bottom_Vertical Rect
rect (50,450,50,500) ;

//Top_Primary_Rect
rect (100,50,1100,15) ;

//Top_Rect_2
rect (60,50,20,80) ;

//Top_Rect_3
rect (150,50,50,200) ;

//Top_Rect_4
rect (350,50,100,75) ;

//Top_Rect_5
rect (550,50,20,250) ;

//Top_Rect_6
rect (625,50,20,150) ;

//Bottom Right Rect
rect (650,375,115,90) ;

//Center Rect
rect (350,150,275,75) ;

}

void keyPressed() {
  background (200,37,37);
}






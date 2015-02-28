
//set the size of screen, the background color
void setup (){
size (250, 250);
background (255);
}  
void draw (){ 
 noFill();
 //the y start at 130 and as long y is less/equal 240, y will add up 5 every time.
for (int y = 130; y <= 240; y += 5) {
 //centered circle
  ellipse (127, 125, y, 250); 
}
}

                
                

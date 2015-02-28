
void setup(){
  background(255);
  size(300,300);
  
}


//resets the background color to white 
void mousePressed(){
 
  background(255);

}


void draw(){
  
  stroke(240,175,126,50);
 
  fill(width,mouseY,25,5);
  
  /*keeps ellipse in the center of the window despite size
  and allows the ellipse to always be up to the size of the window.*/
  ellipseMode(CENTER);
  ellipse(width/2,height/2,mouseX,mouseY);
  
}




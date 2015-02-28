
	
void setup(){
size(600,600);
background(255); 
}

void draw() 

{ 
  
  
   if (mousePressed) {
    stroke(second(), mouseX,255 );
    strokeWeight(30);
    line(mouseX+0, mouseY, mouseX+100, mouseY );
  println(second());

}
 


}


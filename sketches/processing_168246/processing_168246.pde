
//colorfull crack
void setup(){
size(230,230);
}
void draw() {
 
  background(200,0,100); 
  
  triangle(mouseX,mouseY,mouseX-80,mouseY-80,mouseX+120,mouseY+145);
  fill(random(250),random(250),random(250));
}


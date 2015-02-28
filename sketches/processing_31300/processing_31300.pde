
float x;
float y;
float dia = 50;
float radius = dia/2;
color col = color(200);
 
 
void setup() {
  size(500,500);
  background(255);
   
}
 
void draw() {  
  x = width/2;
  y = height/2;
  fill(0,0,0);
  ellipse(x,y,dia,dia);
   
  
  if(mousePressed == true) {
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    fill(random(255),random(255),random(255));
    ellipse(x,y,dia,dia);
    }
    }
    }


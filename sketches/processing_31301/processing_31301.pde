

float x;
float y;
float dia = 200;
float radius = dia/2;
color col = color(200);
 
 
void setup() {  
  size(500,500);
  background(255);  
   
}
 
void draw() {  
   x = width/2;
   y = height/2;
  fill(col);
  ellipse(x,y,dia,dia);
  
  if(mousePressed == true) { //add some interaction
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    col = (color(random(225),random(255),random(255)));
      ellipse(x,y,400,dia);
      ellipse(x,y,random(500),random(500));

  
  }
    }
    }

  
  

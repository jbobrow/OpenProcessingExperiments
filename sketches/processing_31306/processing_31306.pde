
float x;
float y ;
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
  fill(col);
  ellipse(x,y,dia,dia);
  textSize(30);
  
  if(mousePressed == true) { 
    if(mouseX > x-radius && mouseY< x+radius && mouseY > y-radius && mouseY < y+radius){
    background(255);
    ellipse(100,100,100,100);
      col = color(random(255), random(255), random(255));
    }
  }
if(mousePressed == true){
 if(mouseX > 50 && mouseX< 150 && mouseY > 50 && mouseY < 150){
   background(255);
   ellipse(x,y,dia,dia);
   ellipse(100,100,100,100);
    ellipse(400, 400, 40, 40);
    col = color(random(255), random(255), random(255));
 
    }
    }
}


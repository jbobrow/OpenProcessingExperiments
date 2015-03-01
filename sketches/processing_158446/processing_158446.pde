
int perro=10;

void setup(){
  size(1600,1400);
  
}
void draw(){
  perro=perro-10;
  noStroke();
  background(150,mouseY,240);
  fill(mouseX,mouseY,100);
  //ellipse(mouseX,10,80,mouseY);
//fill(perro);
 perro=perro+20;
 //ellipse(700,2,10,10);

  
  if (mousePressed== false) {
    ellipse(mouseX, 100, mouseY,100);
    ellipse(500, mouseX, 50, 50);
    
  }else{
    fill(mouseY, 11, mouseX);
    rect(50,50,50,mouseY);
  }
}

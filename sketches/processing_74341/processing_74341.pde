
void setup(){
  size(400, 400, P2D);
  smooth();
}

void draw(){
  if(mousePressed){
    background(0);
    fill(255);
    stroke(255);
    triangle(mouseX +20, mouseY +70, mouseX +10, mouseY +70, mouseX, mouseY +100);
  triangle(mouseX -50, mouseY +100, mouseX -40, mouseY +100, mouseX -90, mouseY +160);
  triangle(mouseX -250, mouseY +130, mouseX -240, mouseY +130, mouseX -290, mouseY +190);
  triangle(mouseX -210, mouseY +170, mouseX -200, mouseY +170, mouseX -220, mouseY +190);
   ellipse(mouseX, mouseY, 150, 100);
  ellipse(mouseX +50, mouseY +30, 80, 30); 
  ellipse(mouseX -20, mouseY +30, 100, 70);
  ellipse(mouseX -40, mouseY, 100, 70);
  ellipse(mouseX -60, mouseY -10, 80, 30);
  ellipse(mouseX -40, mouseY -30, 80, 80);
  
  
  ellipse(mouseX -220, mouseY +70, 200, 120);
  ellipse(mouseX -200, mouseY +30, 80, 80);
  ellipse(mouseX -250, mouseY +10, 80, 80);
  ellipse(mouseX -170, mouseY +80, 200, 130);
  ellipse(mouseX -220, mouseY +110, 80, 80);
  ellipse(mouseX -160, mouseY +120, 100, 100);
  ellipse(mouseX -280, mouseY +120, 80, 30);
  }else{
    background(255);
    stroke(0);
    line(200, 200, mouseX, mouseY);
    line(200, 200, 50, mouseY);
    line(200, 200, mouseX, 50);
    line(200, 200, mouseX, 90);
    line(200, 200, 100, mouseY);
    line(200, 200, 120, mouseY);
    line(200, 200, mouseX, 20);
    line(200, 200, 110, mouseY);
    line(200, 200, -110, mouseY);
    line(200, 200, -50, mouseY);
    line(200, 200, mouseX, 30);
    line(200, 200, mouseX, -30);
    line(200, 200, mouseX, -120);
    line(200, 200, mouseX, 120);
    line(200, 200, -30, mouseY);
    line(200, 200, 80, mouseY);
    
    fill(220);
    ellipse(200, 200, 220, 220);    
    
   
   stroke(200, 200, 200);
  fill(200, 200, 200);
  }
}

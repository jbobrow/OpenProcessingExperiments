
void setup(){
  
  //joel's magic rainbow pyramid
  
 size(900, 900);
}

void draw(){
  colorMode(RGB, 255);
  //fading
  fill(10, 10, 40, 1);
  rect(0, 0, 900, 900);
  
  //draw pyramid
  fill(255);
  
  pushMatrix();
  translate(mouseX, mouseY);
  rect(0, 0, 50, 50);
    pushMatrix();
     translate(0, 50);
     rotate(PI/4);
     rect(0, 0, 50, 50);
    popMatrix();
    pushMatrix();
     translate(50, 50);
     rotate(PI/4);
     rect(0, 0, 50, 50);
    popMatrix();
    pushMatrix();
     translate(25, 25);
     triangle(0, -25, -50, 100, 50, 100);
     triangle(0, -25, -25, -70, 25, -70);
    popMatrix();
    pushMatrix();
     translate(25, -25);
     triangle(0, 0, -20, -100, 20, -100);
    popMatrix();
    
    colorMode(HSB, 100);
    pushMatrix();
     translate(25, 50);
     pushMatrix();
      rotate(PI/4);
      fill((mouseY + 20)%100, 100, mouseX%50 + 50);
      triangle(0, 10, -20, 150, 20, 150);
     popMatrix();
     pushMatrix();
      rotate(PI/-4);
      fill((mouseY + 40)%100, 100, mouseX%50 + 50);
      triangle(0, 10, -20, 150, 20, 150);
     popMatrix();
     pushMatrix();
      rotate(PI/7);
      fill((mouseY + 60)%100, 100, mouseX%50 + 50);
      triangle(0, 10, -20, 150, 20, 150);
     popMatrix();
     pushMatrix();
      rotate(PI/-7);
      fill((mouseY + 80)%100, 100, mouseX%50 + 50);
      triangle(0, 10, -20, 150, 20, 150);
     popMatrix();
     fill(mouseY%100, 100, mouseX%50 + 50);
     triangle(0, 10, -20, 150, 20, 150);
    popMatrix();
  
  popMatrix();
  
  
  
  
}

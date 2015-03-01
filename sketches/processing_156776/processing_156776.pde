
float posX = 0;
float posY = 0;
float easing = 0.1;
int scale = 100;

void setup(){
  size(900, 900);
  background(255);
  noStroke();
}

void draw(){
  //draw the cover transparent rect
  fill(255, 100);
  rect(0,0,width,height);
  background(255);
  
  posX += (mouseX - posX) * easing;
  posY += (mouseY - posY) * easing;
  
  //posX = posX + (mouseX - posX) * 1;
  //posX = posX + (mouseX - posX) * 0.5;
  //noFill();
//stroke(255, 102, 0);
//line(85, 20, 10, 10);
//line(90, 90, 15, 80);
//stroke(0, 0, 0);
//bezier(85, 20, 10, 10, 90, 90, 15, 80);
  fill(0);
  for (int i = 0; i < 20; i++) {
    if(i%3 == 0){
    bezier(posX + i * 10, posY + i * 20, 20, 20, 10, 90, 15, 80);
    }
    else if(i%3 == 1){
      bezier(posX + i * 20, posY + i * 20, 30, 30, 90, 90, 15, 80);
    }
  else{
  ellipse(posX + i * 20, posY + i * 20, 20, 20);  
  }
  }
}




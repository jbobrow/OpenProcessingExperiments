
void setup() {
size(800,800);
frameRate(30);
background(115,150,90);
}

void draw(){


  stroke(225,225,225, 20);
  if (mousePressed) {

  if (mouseY < 400){

    fill(mouseY*0.8, mouseX, mouseX+100,190);
    ellipse(mouseX, mouseY, mouseX-400,200);
  }
  else if (mouseY > 400 && mouseY <500){

    fill(mouseY*0.3, mouseX*0.5, mouseX-200,190);
    ellipse(mouseX, mouseY, mouseX-400,200*0.8);
  }
  else if (mouseY > 500 && mouseY <600){
  
    fill(mouseX*0.8, mouseY*0.7-200, mouseX-100, 190);
    rect(mouseX, mouseY, mouseX-400,mouseX-400,1000);
  } 
    else if (mouseY >600 && mouseY <700){
    fill(mouseY*0.8, mouseY*0.7-100, mouseX-100, 190);
    rect(mouseX, mouseY, mouseX-400,200,1000);
  } 
  else if (mouseY < 800 && mouseY > 700){
    fill(mouseY*0.8, mouseX*0.9-400, mouseX*0.9-400,90);
    ellipse(mouseX, mouseY, mouseX-400,200);
  } 
  
  }
  if(!mousePressed) {
   rectMode(CENTER);
  translate(width/2,height/2);
  rotate(TWO_PI/random(2));
  stroke(random(150,225),random(100,150),random(100,150),70);
  fill(random(120,150),random(150,225),random(150,225),15);
  rect(0,0,random(0,900),random(0,1200),random(0,50));

  }
}

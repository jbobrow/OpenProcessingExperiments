
  float centerX = 0;
  float centerY = 250;
  int dir = 1;
  float centerXa = 250;
  float centerYa = 0;

void setup () {
  size(500,500);
  smooth();
}
/*
void draw(){
  background(0,0,50);
  
  float centerX = random(0,500);
  float centerY = random(0,500);
  
  fill(255,50,50);
  ellipse(random(0,500), random(0,500), random(75,100), random(75,100));
  
  noStroke();
  fill(245);
  beginShape();
  vertex(centerX-10,centerY-(40+mouseX/25));
  bezierVertex(centerX-10,centerY-(70+mouseX/25), centerX+10,centerY-(70+mouseX/25), centerX+10,centerY-(40+mouseX/25));//north curve
  bezierVertex(centerX+10,centerY-20, centerX+20,centerY-10, centerX+(40+mouseX/25),centerY-10);//northwest curve
  bezierVertex(centerX+(70+mouseX/25),centerY-10, centerX+(70+mouseX/25),centerY+10, centerX+(40+mouseX/25),centerY+10);//west curve
  bezierVertex(centerX+20,centerY+10, centerX+10,centerY+20, centerX+10,centerY+(40+mouseX/25));//southwest curve
  bezierVertex(centerX+10,centerY+(70+mouseX/25), centerX-10,centerY+(70+mouseX/25), centerX-10,centerY+(40+mouseX/25));//south curve
  bezierVertex(centerX-10,centerY+20, centerX-20,centerY+10, centerX-(40+mouseX/25),centerY+10);//southeast curve
  bezierVertex(centerX-(70+mouseX/25),centerY+10, centerX-(70+mouseX/25),centerY-10, centerX-(40+mouseX/25),centerY-10);//east curve
  bezierVertex(centerX-20,centerY-10, centerX-10,centerY-20, centerX-10,centerY-(40+mouseX/25));//northeast curve
  endShape();
  
}

void mousePressed() {
  if (mouseButton == LEFT) {
    ellipse(mouseX,mouseY,200,200);
  } else if (mouseButton == RIGHT) {
    ellipse(mouseX,mouseY,150,150);
  } else {
    ellipse(mouseX,mouseY,75,75);
  }
}

*/

void draw(){
  background(0,0,50);
  
  /*
  fill(255,50,50);
  ellipse(random(0,500), random(0,500), random(75,100), random(75,100));
  */
  
  noStroke();
  fill(245);
  beginShape();
  vertex(centerX-10,centerY-(40+mouseX/25));
  bezierVertex(centerX-10,centerY-(70+mouseX/25), centerX+10,centerY-(70+mouseX/25), centerX+10,centerY-(40+mouseX/25));//north curve
  bezierVertex(centerX+10,centerY-20, centerX+20,centerY-10, centerX+(40+mouseX/25),centerY-10);//northwest curve
  bezierVertex(centerX+(70+mouseX/25),centerY-10, centerX+(70+mouseX/25),centerY+10, centerX+(40+mouseX/25),centerY+10);//west curve
  bezierVertex(centerX+20,centerY+10, centerX+10,centerY+20, centerX+10,centerY+(40+mouseX/25));//southwest curve
  bezierVertex(centerX+10,centerY+(70+mouseX/25), centerX-10,centerY+(70+mouseX/25), centerX-10,centerY+(40+mouseX/25));//south curve
  bezierVertex(centerX-10,centerY+20, centerX-20,centerY+10, centerX-(40+mouseX/25),centerY+10);//southeast curve
  bezierVertex(centerX-(70+mouseX/25),centerY+10, centerX-(70+mouseX/25),centerY-10, centerX-(40+mouseX/25),centerY-10);//east curve
  bezierVertex(centerX-20,centerY-10, centerX-10,centerY-20, centerX-10,centerY-(40+mouseX/25));//northeast curve
  endShape();

centerX = centerX+4;
  if(centerX>width){
  dir=dir*-1;
  }

  noStroke();
  fill(245);
  beginShape();
  vertex(centerXa-10,centerYa-(40+mouseX/25));
  bezierVertex(centerXa-10,centerYa-(70+mouseX/25), centerXa+10,centerYa-(70+mouseX/25), centerXa+10,centerYa-(40+mouseX/25));//north curve
  bezierVertex(centerXa+10,centerYa-20, centerXa+20,centerYa-10, centerXa+(40+mouseX/25),centerYa-10);//northwest curve
  bezierVertex(centerXa+(70+mouseX/25),centerYa-10, centerXa+(70+mouseX/25),centerYa+10, centerXa+(40+mouseX/25),centerYa+10);//west curve
  bezierVertex(centerXa+20,centerYa+10, centerXa+10,centerYa+20, centerXa+10,centerYa+(40+mouseX/25));//southwest curve
  bezierVertex(centerXa+10,centerYa+(70+mouseX/25), centerXa-10,centerYa+(70+mouseX/25), centerXa-10,centerYa+(40+mouseX/25));//south curve
  bezierVertex(centerXa-10,centerYa+20, centerXa-20,centerYa+10, centerXa-(40+mouseX/25),centerYa+10);//southeast curve
  bezierVertex(centerXa-(70+mouseX/25),centerYa+10, centerXa-(70+mouseX/25),centerYa-10, centerXa-(40+mouseX/25),centerYa-10);//east curve
  bezierVertex(centerXa-20,centerYa-10, centerXa-10,centerYa-20, centerXa-10,centerYa-(40+mouseX/25));//northeast curve
  endShape();

centerYa = centerYa+4;
  if(centerYa>width){
  dir=dir*-1;
  }

}




int counter;

void setup() {  //setup function called initially, only once

  size(500, 500);
  background(255, 255, 0);  //set background yellow
  var faceX = 200;
  var faceY = 200;
  fill(random(176),random(160),random(54));
  ellipse(faceX,faceY +10,220,250);
  fill(255, 251, 189);
  ellipse(faceX,faceY,200,200);
  var eyes= 15;
  fill(72, 48, 255);
  ellipse(faceX-40,faceY-30,eyes,eyes);
  ellipse(faceX +35,faceY -30,eyes,eyes);
  noFill();
  stroke(230, 92, 202);
  var glasses=39;
  ellipse(faceX - 40,faceY -30,glasses,glasses);
  ellipse(faceX +35,faceY - 30,glasses,glasses);
  line(faceX-20,faceY-30,faceX+15,faceY-30);
  fill(242, 111, 211);
  ellipse(faceX,faceY + 50,50,50);
  fill(255, 251, 199);
  noStroke();
  ellipse(faceX,faceY +33,50,50);
}



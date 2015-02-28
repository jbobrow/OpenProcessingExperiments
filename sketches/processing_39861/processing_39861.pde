
float beesX;
float beesY;
float moving= 0.09;
float flowerX = mouseX;
float flowerY = mouseY;
float cloudX; 
float cloudX2;

void setup () {

  //sky
  size (500, 500);
  smooth();
  background(46, 219, 240);
  stroke(77, 250, 46);
  fill(77, 240, 46);
  rect(0, 300, 500, 200);
  frameRate(25);
}

void draw() {
  background(46, 219, 240);
  stroke(77, 250, 46);
  fill(77, 240, 46);
  rect(0, 300, 500, 200);

  //flower

  stroke(230, 36, 42);
  fill(222, 36, 42);
  ellipse(mouseX+10, mouseY, 16, 13);
  ellipse(mouseX-10, mouseY, 16, 13);
  ellipse(mouseX, mouseY+10, 13, 16);
  ellipse(mouseX, mouseY-10, 13, 16);
  stroke(255, 250, 95);
  fill(255, 247, 95);
  ellipse(mouseX, mouseY, 10, 10);
  mouseX++;
  mouseY++;
  /*if (flowerX>width || flowerX<0) {
    speedX*=-1;
  }
  if (flowerY>height || flowerY<0) {
    speedY*=-1;
  } */
  //swarm of bees

  stroke(255, 250, 95);
  fill(13, 13, 6);
  float targetX = mouseX;
  float targetY = mouseY;
  beesX+= (targetX - beesX) * moving;
  beesY+= (targetY - beesY) * moving;

  ellipse(beesX, beesY, 15, 5);
  ellipse(beesX+10, beesY+10, 15, 5);
  ellipse(beesX-10, beesY-10, 15, 5);
  ellipse(beesX+15, beesY+20, 15, 5);
  ellipse(beesX-15, beesY-10, 15, 5);
  ellipse(beesX-40, beesY+30, 15, 5);
  ellipse(beesX-30, beesY-5, 15, 5);


  //sun
  noStroke();
  fill(252, 255, 106);
  ellipse(0, 0, 70, 70);



  if (mousePressed) {

    fill(254, 255, 219);
    ellipse(0, 0, 150, 150); 
    fill(254, 255, 196); 
    ellipse(0, 0, 100, 100);
    fill(252, 255, 106);
    ellipse(0, 0, 70, 70);
  } 
  else {
    background(104, 189, 240);
    fill(54, 152, 84);
    rect(0, 300, 500, 200);
    fill(171, 215, 242);
    ellipse(cloudX, 50, 40, 40);
    ellipse(cloudX+15, 60, 40, 40);
    ellipse(cloudX+20, 40, 40, 40);
    ellipse(cloudX+30, 60, 40, 40);
    ellipse(cloudX2, 100, 50, 40);
    ellipse(cloudX2+15, 120, 50, 40);
    ellipse(cloudX2+20, 100, 50, 40);
    ellipse(cloudX2+30, 120, 50, 40);
    cloudX=cloudX+10;
    cloudX2=cloudX2-5;
    if(cloudX>500) {
      cloudX=0; }
      if (cloudX2<0) {
        cloudX2=500; }
  }



  //bees
  fill(13, 13, 6);
  rotate(mouseX);
  ellipse(mouseX+50, mouseY+20, 15, 5);
  rotate(mouseY);
  ellipse(mouseX+20, mouseY-30, 15, 5);
  rotate(mouseX-10);
  ellipse(mouseX, mouseY, 15, 5);
}


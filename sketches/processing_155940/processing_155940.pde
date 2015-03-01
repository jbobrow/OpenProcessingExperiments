
float spaceshipX;
boolean m = false;
float dis;



void setup() {
  background(0);
  size(600, 600);


  spaceshipX = -5;
}

void draw() {

  dis = height-mouseY+frameRate;
  background(0);
  randomSeed(0);
  for (int i=0; i<1000; i++) { 
    noStroke();
    fill(random(mouseX-10 ), random(mouseY-10), 100);
    ellipse(random(width), random(height), 3, 3);
    smooth();
  }
  spaceshipX = spaceshipX + sin(frameCount * 0.1);
  if (m ==true) {
    spaceshipX = (spaceshipX +1) % (width+spaceshipX/4);
    //alienshipX = (alienshipX+1) % (width+alienshipX/4);
    fill(mouseX,mouseY,100);
    noStroke();
    rect(spaceshipX, dis, 80, 10);

    //triangle(spaceshipX-2, height/2, spaceshipX-1,height/2+2, spaceshipX, height/2);
    
  }
 if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }

}

void mousePressed() {
    m = true;
}









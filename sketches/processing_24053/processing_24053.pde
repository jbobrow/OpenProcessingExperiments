

int catX = 225;
int catY = 150;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  background(255);
  stroke(0);
  size(500,500);
  fill(150,80,120);
}

void draw () {
  background(50);
  catX= mouseX;
  catY= mouseY;
  
  
  //face
  strokeWeight (3);
  fill(150,15,130);
  ellipse (catX,catY,80,80);

  fill (250,50,160);
  ellipse(catX-20,catY-45,15,15);
  ellipse(catX+15,catY-45,15,15);

  fill(100,50,0,50);
  ellipse(catX-15,catY-60,10,10);
  ellipse(catX+15,catY-60,10,10);
  
  //eye
  strokeWeight (1);
  eyeR = random(255); 
  eyeG = random(255);
  eyeB = random(255);
  fill (eyeR,eyeG,eyeB);
  
  ellipse (catX-15,catY-10,10,10);
  ellipse(catX+15,catY-10,10,10);
  
  //mouth
  ellipse (catX,catY+20,40,20);
  
  //first circle
  strokeWeight(3);
  fill(250,0,250,160);
  ellipse(catX+45,catY+40,50,50);

  fill (280,0,60,120);
  ellipse(catX+55,catY+75,40,40);

  fill (280,0,60,120);
  ellipse(catX+95,catY+70,40,40);

  fill (300,0,10,180);
  ellipse(catX+125,catY+50,40,40);

  fill (280,0,180,150);
  ellipse(catX+155,catY+60,30,30);

  fill (250,0,250,160);
  ellipse(catX+165,catY+85,20,20);

  fill (280,0,60,120);
  ellipse(catX+185,catY+95,20,20);

  fill (380,0,180,150);
  ellipse(catX+200,catY+85,10,10);
}



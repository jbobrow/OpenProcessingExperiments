
int xSq;
int ySq;
int SqMovement;
float weirdShit;
float n;


void setup (){
  size (700, 500);
  background (50);
  smooth ();  
  xSq = 5;
  ySq = 5;
  SqMovement = 5;
}

void draw (){
  background (50); 
  noFill ();
  stroke (random(0), random(255), random(210));
  strokeWeight(15);
  rectMode (CENTER);
  rect (350, 250, xSq, ySq);
  
  xSq += SqMovement;
  ySq += SqMovement;
  
  if (xSq > 550){
      xSq = 10;
      ySq = 10;
  }
  
}

void keyPressed (){

  if (key == 'a'){
  strokeWeight (5);
  stroke (random(255), random (255), random(255));
  rect (300, 200, 70, 70); 
  }
  if (key == 's'){
  strokeWeight (10);
  stroke (0, 0, random(255));
  rect (150, 300, 30, 30);
  }
  if (key == 'd'){
  strokeWeight (6);
  stroke (random(225), 0, random(255)); 
  rect (330, 125, 150, 150);
  }
  if (key == 'f'){
  strokeWeight (40);
  stroke (random(255), random (255), random(255));
  rect (50, 180, 120, 70); 
  }
  if (key == 'q'){
  strokeWeight (20);
  stroke (0, 0, random(255));
  rect (150, 300, 200, 40);
  }
  if (key == 'w'){
  strokeWeight (6);
  stroke (random(225), 0, random(255)); 
  rect (330, 125, 135, 250);
  }
  if (key == 'r'){
  strokeWeight (7);
  stroke (random(255), random (255), random(255));
  rect (600, 350, 70, 70); 
  }
  if (key == 'q'){
  strokeWeight (20);
  stroke (0, 0, random(255));
  rect (600, 350, 100, 100);
  }
  if (key == 'w'){
  strokeWeight (6);
  stroke (random(225), 0, random(255)); 
  rect (600, 350, 130, 130);
  }
}

void mouseDragged (){
  if (mouseX <=width){
    weirdShit = dist (mouseX, mouseY, pmouseX, pmouseY);
    n = weirdShit*5.0;
    fill (255, 0, 153);
    rect (pmouseX, pmouseY, n, n);  
}

 
}



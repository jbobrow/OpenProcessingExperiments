
int r = 255;
int g = 255;
int b = 255;
int value = 255;


void setup() {
  size (420, 420);
  background(255);
}

void draw() {

  noStroke();
  fill(255, 0, 0);
  rect(0, 390, 30, 30); 

  fill(255, 106, 6);
  rect(0, 360, 30, 30);

  fill(0);
  rect(0, 300, 30, 30);

  fill(7, 240, 240);
  rect(30, 390, 30, 30); 

  fill(0, 255, 0);
  rect(30, 360, 30, 30);

  fill(0, 0, 140);
  rect(30, 330, 30, 30);


  fill(153, 0, 191);
  rect(60, 360, 30, 30);

  fill(255, 0, 255);
  rect(60, 390, 30, 30);


  fill(255, 255, 0);
  rect(90, 390, 30, 30);

  fill(value);
  rect(0, 330, 30, 30);

  /*strokeWeight(1);*/



  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 0 
    && mouseX <= 30 
    && mouseY >= 390
    && mouseY <= 420
    )
  {  
    r = 255; 
    g = 0; 
    b = 0;
  }

  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 0 
    && mouseX <= 30 
    && mouseY >= 360
    && mouseY <= 390
    )
  {
    r = 255; 
    g = 106; 
    b = 6;
  }

  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 0 
    && mouseX <= 30 
    && mouseY >= 330
    && mouseY <= 360
    )
  {
    r = 255; 
    g = 0; 
    b = 0;
  }

  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 0 
    && mouseX <= 30 
    && mouseY >= 300
    && mouseY <= 330
    )
  {
    r = 0; 
    g = 0; 
    b = 0;
  }


  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 30 
    && mouseX <= 60 
    && mouseY >= 390
    && mouseY <= 420
    )
  { 
    r = 7; 
    g = 240; 
    b = 240;
  }

  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 30 
    && mouseX <= 60 
    && mouseY >= 360
    && mouseY <= 390
    )
  {
    r = 0; 
    g = 255; 
    b = 0;
  }

  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 30 
    && mouseX <= 60 
    && mouseY >= 330
    && mouseY <= 360
    )
  {
    r = 0; 
    g = 0; 
    b = 140;
  }


  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 60 
    && mouseX <= 90 
    && mouseY >= 390
    && mouseY <= 420
    )
  {
    r = 255; 
    g = 0; 
    b = 0;
  }

  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 60 
    && mouseX <= 90 
    && mouseY >= 360
    && mouseY <= 390
    )
  {
    r = 153; 
    g = 0; 
    b = 191;
  }



  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 90 
    && mouseX <= 120 
    && mouseY >= 390
    && mouseY <= 420
    )
  { 
    r = 255; 
    g = 255; 
    b = 0;
  }


  if (mousePressed && pmouseX > 0) {
    noStroke();
    stroke(r, g, b);
    strokeWeight(4);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }


  if (pmouseX >0 
    && mousePressed 
    && mouseX >= 0 
    && mouseX <= 30 
    && mouseY >= 330
    && mouseY <= 360
    )
  {
    background(255);
  }
}

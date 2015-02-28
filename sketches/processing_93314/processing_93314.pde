
float x;
float y;
float diam;
float opac;

void setup(){
  smooth();
  size(640, 480);
  background(0);
  frameRate(60);
}

void draw(){
  fill(0,25);
  rect(-1,-1,641,481);
  if (mousePressed) {
 //Cursor
    cursor(CROSS);
 //ellipse01
    x = random (-50,50);
    y = random (-50,50);
    diam = random (5, 30);
    opac = random (0,255);
    stroke(255);
    noFill();
    ellipse(x+mouseX,y+mouseY,diam,diam);
 //ellipse02
    x = random (-100,100);
    y = random (-100,100);
    diam = random (50, 120);
    opac = random (0,255);
    stroke(255);
    noFill();
    ellipse(x+pmouseX,y+pmouseY,diam,diam);
 //ellipse03
    x = random (-150,150);
    y = random (-150,150);
    diam = random (30,50);
    opac = random (0,255);
    stroke(255);
    noFill();
    ellipse(x+mouseX,y+mouseY,diam,diam);
  }
  else{
    cursor(HAND);  
  }  
}

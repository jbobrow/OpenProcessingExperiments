
int col = 0;
int bkg = 255;
int xu = 0;
int xd = 0;
void setup() {
  size(400, 400);
}
void draw() {

  smooth();
  background(bkg);
  
  noStroke();

  fill(col);
  rect(0, 250, 400, 200);

  fill(col);
  ellipse(50+xu, 70, 40, 40);

  fill(col);
  ellipse(350+xd, 70, 40, 40);

  fill(col);
  rect(30+xu, 95, 40, 80, 10);

  fill(col);
  rect(330+xd, 95, 40, 60, 10);

  fill(col);
  rect(35+xu, 180, 25, 70, 10);

  fill(col);
  rect(335+xd, 210, 25, 40, 10);
  
  fill(col);
  ellipse(350+xd, 180, 70, 60);

  if (mousePressed) {
    col=255; 
    bkg=0;
    xu=120+mouseX;
    xd=-120+mouseX;
    
   

  } 
  else {
    col=0; 
    bkg=255;
    xu=0;
    xd=0;
    
  }
}

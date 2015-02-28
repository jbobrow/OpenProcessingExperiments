

PShape iris;
PShape pupil;
PShape eye1;
PShape eye2;
float lx=169, ly=131,
rx=329, ry=131, easing=.05;
float RXX=constrain(mouseX,330,360);
float RXY=constrain(mouseY,123,140);
float XX=constrain(mouseX,169,185);
float XY=constrain(mouseY,123,140);

void setup()
{
  size(640,480);
  background(255,123,172);
  smooth();
  iris =loadShape ("iris.svg");
  pupil=loadShape("pupil.svg");
  eye1=loadShape("eyeshape.svg");
  eye2=loadShape("eyeshape2.svg");
}

void draw() {
  background(255,123,172);
  smooth();
  shape (eye1,90,125);
  shape (eye2,327,125);
  shape (iris, 169,131);
  shape (iris, 329,131);
  shape (pupil, lx,ly);
  shape (pupil, rx,ry);
  float XX=constrain(mouseX,169,185);
  float XY=constrain(mouseY,123,140);
  lx+=(XX-lx)*easing;
  ly+=(XY-ly)*easing;
  shape(pupil,lx,ly);

  float RXX=constrain(mouseX,330,360);
  float RXY=constrain(mouseY,127,140);
  rx+=(RXX-rx)*easing;
  ry+=(RXY-ry)*easing;
  shape(pupil,rx,ry);


  if(mousePressed) {

    background(255,123,172);
    smooth();
    shape (eye1,90,125);
    shape (eye2,327,125);
    shape (iris, 169,131);
    shape (iris, 329,131);
    fill(0);
    ellipse(246,210,130,130);
    ellipse(408,210,130,130);
    if (mouseX>0)
    {
      for(int i=130; i<10;) {
        frameRate(200); 
        shape (iris, 169,131);
        shape (iris, 329,131);
        ellipse(246,210,i,i);
        ellipse(408,210,i,i);
        i--;
      }
    }
  }
}



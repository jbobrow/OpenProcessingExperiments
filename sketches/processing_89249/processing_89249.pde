
/* @pjs globalKeyEvents=true; 
 */

color [] colsV;
color [] colsH;
check [][] checks;
int step=20 ;
int empty=1;
int nbeColorsV;
int nbeColorsH;
boolean gradient=true;
void setup() {
  size(800, 800);
  smooth();
  background(255);
  strokeWeight(step-empty);
  strokeCap(SQUARE);
  strokeJoin(SQUARE);
  initiate();
  knit();
}
void draw() {
  //if(frameCount%30==0)restart();
}
void initiate() {
  nbeColorsV=2*int(random(1, 6));
  nbeColorsH=2*int(random(1, 6));
  colsV=new color[nbeColorsV];
  colsH=new color[nbeColorsH];
  checks=new check[nbeColorsH+int(nbeColorsH==1)][nbeColorsV+int(nbeColorsV==1)];
  for (int i=0;i<checks.length;i++) {
    for (int j=0;j<checks[0].length;j++) {
      checks[i][j]=new check(i, j, boolean((i+j)%2));
    }
  }
  chooseColors();
}
void chooseColors() {
  if (gradient) {
    colsV[0]=color(random(255), random(255), random(255));
    colsV[(int)colsV.length/2]=color(random(255), random(255), random(255));
    if (colsV.length!=2) {
      for (int i=1;i<(int)colsV.length/2;i++) {
        colsV[i]=lerpColor(colsV[0], colsV[(int)colsV.length/2], (float)2*i/colsV.length);
        colsV[colsV.length-i-int(colsV.length%2==1)]=colsV[i];
      }
    }
    colsH[0]=color(random(255), random(255), random(255));
    colsH[(int)colsH.length/2]=color(random(255), random(255), random(255));
    if (colsH.length!=2) {
      for (int i=1;i<(int)colsH.length/2;i++) {
        colsH[i]=lerpColor(colsH[0], colsH[(int)colsH.length/2], (float)2*i/colsH.length);
        colsH[colsH.length-i-int(colsH.length%2==1)]=colsH[i];
      }
    }
  }
  else {
    for (int i=0;i<colsV.length;i++) {
      colsV[i]=color(random(255), random(255), random(255));
    }
    for (int i=0;i<colsH.length;i++) {
      colsH[i]=color(random(255), random(255), random(255));
    }
  }
}
void knit() {
  background(200);
  strokeWeight(step-empty);
  for (int i=(int)step/2;i<width-3*step;i+=step) {
    stroke(colsV[(int)(i/step)%colsV.length]);
    line(i+3*step, 0, i+3*step, height);
  }
  for (int i=(int)(step/2);i<height-3*step;i+=step) {
    stroke(colsH[(int)(i/step)%colsH.length]);
    line(-(int)(empty/2), i+3*step, 3*step+(int)(empty/2), i+3*step);
    for (int j=0;j<width+1-step;j+=step) {       

      if (checks[(int)(i/step)%checks.length][((j)/step)%checks[0].length].value )line(j+3*step-(empty/2), i+3*step, j+4*step+(empty/2), i+3*step);
      else {
        line(j+3*step-(empty/2), i+3*step, j+3*step+(empty/2), i+3*step);
      }
    }
  }
  for (int i=0;i<checks.length;i++) {
    for (int j=0;j<checks[0].length;j++) {
      checks[i][j].display();
    }
  }
}
void keyPressed() {
  switch (keyCode) {
  case 32:
    initiate();
    break;
  case 67:
    chooseColors();
    break;
  case 40:
    if (step>empty+2)step-=2;
    strokeWeight(step-empty);
    break;
  case 38:
    step+=2;
    strokeWeight(step-empty);
    break;
  case 86:
    for (int i=0;i<checks.length;i++) {
      for (int j=0;j<checks[0].length;j++) {
        checks[i][j].value=false;
        rect ((3+checks[i][j].index)*step, (checks[i][j].rang+3)*step, step, step);
      }
    }
    break;
  case 71:
    gradient=!gradient;
    chooseColors();
  }
  knit();
}
void mouseReleased() {
  for (int i=0;i<checks.length;i++) {
    for (int j=0;j<checks[0].length;j++) {
      checks[i][j].mouseReleased();
    }
  }
}
class check {
  int index, rang;
  boolean value;
  check(int Rang, int I, boolean Value) {
    index=I;  
    rang=Rang;
    value=Value;
  }
  void display() {
    fill(#FFFFFF, 200);
    stroke(0);
    strokeWeight(2);
    rect ((3+index)*step, (rang+3)*step, step, step);
    if (value) {
      line((3+index)*step, (rang+3)*step, (4+index)*step, (rang+4)*step);
      line((4+index)*step, (rang+3)*step, (3+index)*step, (rang+4)*step);
    }
  }
  boolean isMouseOver() {
    return (mouseX>(3+index)*step && mouseX<(4+index)*step&& mouseY>(rang+3)*step && mouseY<(4+rang)*step);
  }
  void mouseReleased() {
    if (isMouseOver()) { 
      value=!value;
      if (value) {
        line((3+index)*step, (rang+3)*step, (4+index)*step, (rang+4)*step);
        line((4+index)*step, (rang+3)*step, (3+index)*step, (rang+4)*step);
      }
      else rect ((3+index)*step, (rang+3)*step, step, step);
      knit();
    }
  }
}




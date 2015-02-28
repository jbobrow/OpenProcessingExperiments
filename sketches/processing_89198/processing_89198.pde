
color [] colsV;
color [] colsH;
check [][] checks;
int step=20 ;
int empty=1;
int nbeColorsV;
int nbeColorsH;
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
void initiate(){
    nbeColorsV=int(random(1, 6));
    nbeColorsH=int(random(1, 12));
    colsV=new color[nbeColorsV];
    colsH=new color[nbeColorsH];
    checks=new check[nbeColorsH+int(nbeColorsH==1)][nbeColorsV+int(nbeColorsV==1)];
    for(int i=0;i<checks.length;i++){
      for(int j=0;j<checks[0].length;j++){
        checks[i][j]=new check(i,j,boolean((i+j)%2));
      }      
    }
    chooseColors();
}
void chooseColors(){
  for (int i=0;i<colsV.length;i++) {
      colsV[i]=color(random(255), random(255), random(255));
    }
    for (int i=0;i<colsH.length;i++) {
      colsH[i]=color(random(255), random(255), random(255));
    }
}
void knit(){
  background(200);
    strokeWeight(step-empty);
    for (int i=3*step+step/2;i<width;i+=step) {
      stroke(colsV[(i/step)%colsV.length]);
      line(i, 0, i, height);
    }
    for (int i=3*step+step/2;i<height;i+=step) {
      stroke(colsH[(i/step)%colsH.length]);
      for (int j=0;j<width+1-step;j+=step) {
        if (checks[((i-3*step)/step)%checks.length][((j+3*step)/step)%checks[0].length].value || j< 3*step)line(j-empty/2, i, j+step+empty/2, i);
        else {
          line(j-empty/2, i, j+empty/2, i);
        }
      }
    }
    for(int i=0;i<checks.length;i++){
      for(int j=0;j<checks[0].length;j++){
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
  }
  knit();
}
void mouseReleased(){
  for(int i=0;i<checks.length;i++){
      for(int j=0;j<checks[0].length;j++){
        checks[i][j].mouseReleased();
      }      
    }
}
class check{
  int index,rang;
  boolean value;
  check(int Rang,int I,boolean Value){
    index=I;  
    rang=Rang;
    value=Value;  
  }
void display(){
  fill(#FFFFFF,200);
  stroke(0);
  strokeWeight(2);
  rect ((3+index)*step,(rang+3)*step,step,step);
  if(value){
    line((3+index)*step,(rang+3)*step,(4+index)*step,(rang+4)*step);
    line((4+index)*step,(rang+3)*step,(3+index)*step,(rang+4)*step);
  }
}
boolean isMouseOver(){
  return (mouseX>(3+index)*step && mouseX<(4+index)*step&& mouseY>(rang+3)*step && mouseY<(4+rang)*step);
}
void mouseReleased(){
 if(isMouseOver()){ value=!value;
  if(value){
    line((3+index)*step,(rang+3)*step,(4+index)*step,(rang+4)*step);
    line((4+index)*step,(rang+3)*step,(3+index)*step,(rang+4)*step);
  }
  else rect ((3+index)*step,(rang+3)*step,step,step);
  knit();
 }
}
}


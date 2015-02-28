
void setup(){
  size(600,600);
  colorMode(HSB, 100);
  strokeWeight(3);
  smooth();
  noCursor();
}

float mainx,mainy;
float cx1,cy1,cx2,cy2;
int x2,y2;

void draw(){
  background(0);

  mainx = (mouseX);
  mainy = (mouseY); 
  cx1 = mainx-100;
  cy1 = height-mainy;
  cx2 = 0;
  cy2 = height;
  x2 = 0;
  y2 = height;


  noFill();
  int strokecolor = constrain (mouseX, 0,100);
  stroke(int (mouseX/6),int(mouseY/3),90);
  bezier(mainx,mainy,cx1,cy1,cx2,y2,x2,y2);
  bezier(mainx,mainy,cx1+50,cy1,cx2+200,y2,x2+200,y2);
  bezier(mainx,mainy,cx1+100,cy1,cx2+300,y2,x2+300,y2);
  bezier(mainx,mainy,cx1+150,cy1,cx2+400,y2,x2+400,y2);
  bezier(mainx,mainy,cx1+200,cy1,cx2+600,y2,x2+600,y2);


}




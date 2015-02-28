
void setup(){
  size(700,700);
  colorMode(RGB);
  strokeWeight(10);
 smooth();
}

float mainx,mainy;
float cx1,cy1,cx2,cy2;
int x2,y2;

void draw(){
  background(255);

  mainx = (mouseX);
  mainy = (mouseY); 
  cx1 = mainx-300;
  cy1 = height-mainy;
  cx2 = 30;
  cy2 = height;
  x2 = 40;
  y2 = height;


  noFill();
  int strokecolor = constrain (mouseX, 0,100);
  stroke(int (mouseX/2),int(mouseY/9),100);
  ellipse(mainx,mainy,cx1-200,cy1-30);
     ellipse(mainx,mainy,cx1-150,cy1-20);
  ellipse(mainx,mainy,cx1-100,cy1-10);
   ellipse(mainx,mainy,cx1-50,cy1);
  ellipse(mainx,mainy,cx1,cy1+10);
  ellipse(mainx,mainy,cx1+50,cy1+20);
  ellipse(mainx,mainy,cx1+100,cy1+30);
  ellipse(mainx,mainy,cx1+150,cy1+40);
  ellipse(mainx,mainy,cx1+200,cy1+50);
   ellipse(mainx,mainy,cx1+250,cy1+60);


}



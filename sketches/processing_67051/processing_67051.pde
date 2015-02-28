
void setup(){
  size(400,400);
  background(240);
  smooth();
  noStroke();
}

void draw(){
  for (int i=0;i<height;i++){
    drawRect(i*i,i*i,i*i);
  }
  for (int i=0;i<height;i++){
    drawEllipseNo1(i*i,i*i);
}
 for (int i=0;i<width;i++){
   drawEllipseNo2(i*i,i*i,i*i);

 }
}

void drawRect(int posX, int posY,int aa){
  noStroke();
  fill(250,random(150),aa);
  rect(posX,posY,width,height);
}


void drawEllipseNo1(int aposX,int aposY){
  noStroke();
  fill(100,250,100);
  ellipse(aposX,aposY,mouseX,mouseY);
}
void drawEllipseNo2(int bposX,int bposY,int aa){
  noStroke();
  fill(aa);
  ellipse(bposX,bposY,mouseX,mouseY);
}

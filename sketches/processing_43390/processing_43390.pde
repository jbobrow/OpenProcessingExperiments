
//my reset button on my computer

int[][] shape;
int offX = 188;
int offY = 186;

void setup(){
  size(400,400,P3D);
  background(0);
  fill(255);
  stroke(255);
  shape = new int[25][2];
  loadData();
  strokeWeight(2);
  smooth();

}
void draw(){
 //unchanged
 placeRubberStamp(50,200);
  
  pushMatrix();
  scale(3.0);
  placeRubberStamp(30,30);
  popMatrix();
  
  pushMatrix();
  translate(0,100);
  placeRubberStamp(250,200);
  popMatrix();
  
  pushMatrix();
  rotateZ(PI/4.0);
  placeRubberStamp(200,150);
  popMatrix();
  
}

void mouseReleased(){
  //placeRubberStamp(mouseX,mouseY);

}
void placeRubberStamp(int px, int py){
  noFill();
  beginShape();
  for(int i=0; i< 19; i++){
    vertex(shape[i][0] -offX + px, shape[i][1] - offY + py);
  }
  endShape();
  beginShape();
  for(int i=19; i< 25; i++){
    vertex(shape[i][0] -offX + px, shape[i][1] - offY + py);
  }
  endShape();

}

void loadData(){
  shape[0][0]=188; shape[0][1]=186;
  shape[1][0]=185; shape[1][1]=188;
  shape[2][0]=182; shape[2][1]=191;
  shape[3][0]=180; shape[3][1]=198;
  shape[4][0]=181; shape[4][1]=205;
  shape[5][0]=183; shape[5][1]=210;
  shape[6][0]=186; shape[6][1]=214;
  shape[7][0]=190; shape[7][1]=217;
  shape[8][0]=196; shape[8][1]=220;
  shape[9][0]=202; shape[9][1]=221;
  shape[10][0]=209; shape[10][1]=220;
  shape[11][0]=214; shape[11][1]=215;
  shape[12][0]=218; shape[12][1]=211;
  shape[13][0]=220; shape[13][1]=207;
  shape[14][0]=221; shape[14][1]=203;
  shape[15][0]=222; shape[15][1]=199;
  shape[16][0]=218; shape[16][1]=193;
  shape[17][0]=215; shape[17][1]=189;
  shape[18][0]=211; shape[18][1]=185;
  shape[19][0]=201; shape[19][1]=176;
  shape[20][0]=201; shape[20][1]=181;
  shape[21][0]=201; shape[21][1]=186;
  shape[22][0]=201; shape[22][1]=191;
  shape[23][0]=200; shape[23][1]=197;
  shape[24][0]=200; shape[24][1]=204;
}


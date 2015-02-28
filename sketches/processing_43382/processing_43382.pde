
//winter is coming and that means so is orion...

int[] spotX = new int[14];
int[] spotY = new int[14];

void setup(){
  size(400,400);
  background (0);

  spotX[0]=24;  spotY[0]=-11;
  spotX[1]=0;   spotY[1]=0;
  spotX[2]=35;  spotY[2]=3;
  spotX[3]=14;  spotY[3]=52;
  spotX[4]=22;  spotY[4]=47;
  spotX[5]=28;  spotY[5]=42;
  spotX[6]=7;   spotY[6]=83;
  spotX[7]=45;  spotY[7]=76;
  spotX[8]=51;  spotY[8]=-4;
  spotX[9]=67;  spotY[9]=-11;
  spotX[10]=70;  spotY[10]=-5;
  spotX[11]=71;  spotY[11]=4;
  spotX[12]=68;  spotY[12]=21;
  spotX[13]=62;  spotY[13]=26;

  strokeWeight(1);
  noFill();
}

void placeRubberStamp(int px, int py){

  smooth();

  ellipseMode(CENTER);
  stroke(255);
  fill(255);
  noStroke();
  ellipse(spotX[0]+px,spotY[0]+py,3,3);
  ellipse(spotX[1]+px,spotY[1]+py,3,3);
  ellipse(spotX[2]+px,spotY[2]+py,3,3);
  ellipse(spotX[3]+px,spotY[3]+py,3,3);
  ellipse(spotX[4]+px,spotY[4]+py,3,3);
  ellipse(spotX[5]+px,spotY[5]+py,3,3);
  ellipse(spotX[6]+px,spotY[6]+py,3,3);
  ellipse(spotX[7]+px,spotY[7]+py,3,3);
  ellipse(spotX[8]+px,spotY[8]+py,3,3);
  ellipse(spotX[9]+px,spotY[9]+py,3,3);
  ellipse(spotX[10]+px,spotY[10]+py,3,3);
  ellipse(spotX[11]+px,spotY[11]+py,3,3);
  ellipse(spotX[12]+px,spotY[12]+py,3,3);
  ellipse(spotX[13]+px,spotY[13]+py,3,3);

  noFill();
  beginShape();
  stroke(247,239,178);
  strokeWeight(.25);
  vertex(spotX[1]+px,spotY[1]+py);
  vertex(spotX[0]+px,spotY[0]+py);

  vertex(spotX[2]+px,spotY[2]+py);
  vertex(spotX[8]+px,spotY[8]+py);
  vertex(spotX[9]+px,spotY[9]+py);
  vertex(spotX[10]+px,spotY[10]+py);
  vertex(spotX[11]+px,spotY[11]+py);
  vertex(spotX[12]+px,spotY[12]+py);
  vertex(spotX[13]+px,spotY[13]+py);

  endShape();

  beginShape();
  strokeWeight(.25);
  vertex(spotX[1]+px,spotY[1]+py);
  vertex(spotX[2]+px,spotY[2]+py);
  vertex(spotX[5]+px,spotY[5]+py);
  vertex(spotX[4]+px,spotY[4]+py);
  vertex(spotX[3]+px,spotY[3]+py);
  endShape(CLOSE);

  beginShape();
  strokeWeight(.25);
  vertex(spotX[5]+px,spotY[5]+py);
  vertex(spotX[7]+px,spotY[7]+py);
  vertex(spotX[6]+px,spotY[6]+py);
  vertex(spotX[3]+px,spotY[3]+py);
  endShape();

}

void draw(){
  if (mousePressed) {
    placeRubberStamp(mouseX,mouseY);
  }
}

void keyPressed(){
  background(0);
}


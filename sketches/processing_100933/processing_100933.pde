
int hanten=second()%4;
PFont font;
// 左目を描く
void drawLeftEye(float x,float y){
  noStroke();
  fill(255);
  ellipse(95,45,35,35);
  fill(0);
  ellipse(95,45,8,8);
  if(hanten==0){
    noStroke();
    fill(255,255,255);
    ellipse(95,45,35,35);
    stroke(0,0,0);
    line(90,45,100,45);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }else if(hanten==1){
    noStroke();
    fill(255);
    ellipse(128,45,35,35);
    stroke(0,0,0);
    line(124,45,132,45);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }else if(hanten==2){
    noStroke();
    fill(255,255,255);
    ellipse(95,45,35,35);
    stroke(0,0,0);
    line(90,45,100,45);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }else if(hanten==3){
    noStroke();
    fill(255);
    ellipse(95,45,35,35);
    fill(0);
    ellipse(95,45,8,8);
    noStroke();
    fill(255);
    ellipse(128,45,35,35);
    fill(0);
    ellipse(128,45,8,8);
     fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }
}
// 右目を描く
void drawRightEye(float x,float y){
  noStroke();
  fill(255);
  ellipse(128,45,35,35);
  fill(0);
  ellipse(128,45,8,8);
  if(hanten==0){
    noStroke();
    fill(255,255,255);
    ellipse(95,45,35,35);
    stroke(0,0,0);
    line(90,45,100,45);
    noStroke();
    fill(255);
    ellipse(128,45,35,35);
    stroke(0,0,0);
    line(124,45,132,45);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }else if(hanten==1){
    noStroke();
    fill(255);
    ellipse(128,45,35,35);
    stroke(0,0,0);
    line(124,45,132,45);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }else if(hanten==2){
    noStroke();
    fill(255,255,255);
    ellipse(95,45,35,35);
    stroke(0,0,0);
    line(90,45,100,45);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }else if(hanten==3){
    noStroke();
    fill(255);
    ellipse(95,45,35,35);
    fill(0);
    ellipse(95,45,8,8);
    noStroke();
    fill(255);
    ellipse(128,45,35,35);
    fill(0);
    ellipse(128,45,8,8);
    fill(0);
    quad(110, 52, 114, 59, 110, 66, 106, 59);
  }
}
void setup(){
  size(400,400);
  font=createFont("Monaco",30);
  textFont(font);
  smooth();
}
void draw() {
  background(230);
  // 胴体
  fill(255,255,255);
  rect(0,0,width,height);
  fill(0);
  textSize(24);
  text(nf(hour(),2)+":"+nf(minute(),2)+":"+nf(second(),2),160,100);
  translate(100,100);
  stroke(0);
  fill(0);
  ellipse(110, 45, 70, 70);
  ellipse(110, 70, 70, 70);
  rect( 75, 45, 70, 30);
  noStroke();
  fill(255);
  arc(110,45, 70, 70, 0, PI); // あご
  // 左目
  drawLeftEye(96,45);
  // 右目
  drawRightEye(124,45);
  stroke(0,0,0);
  quad(110, 52, 114, 59, 110, 66, 106, 59); // くちばし
}

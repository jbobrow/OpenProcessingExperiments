
float angle = 0.0;
PImage bg;
PFont font;
void setup() {
  bg = loadImage("gradient.png");
  font = loadFont("BookAntiqua-48.vlw");
  textFont(font);
  size(640,480);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  image(bg,0,0);
  translate(width/2, height/2);
  int s = second();
  int s1 = 0;
  int s10 = 0;
  int m = minute();
  int m1 = 0;
  int m10 = 0;
  int h = hour();
  int hN=0;
  int h1 = 0;
  int h10 = 0;
  angle +=.01;
  //COMMENT OUT THE THE NEXT PART FOR MILITARY TIME
  if(h>=13){
    hN = h-12;
  }
  else if(h ==0){
    hN =12;
  }
  else{
    hN=h;
  }
  
//ONE SECOND DIGIT
  if(s >= 10 && (s<=19)) {
    s1 = s-10;
  }
  else if(s >= 20 && (s<=29)) {
    s1 = s-20;
  }
  else if(s >= 30 && (s<=39)) {
    s1 = s-30;
  }
  else if(s >= 40 && (s<=49)) {
    s1 = s-40;
  }
  else if(s >= 50 && (s<=59)) {
    s1 = s-50;
  }
  else if(s >= 0 && (s<=9)) {
    s1 = s;
  }
//TEN SECOND DIGIT
  s10 = (s-s1)/10;
//ONE MINUTE DIGIT
if(m >= 10 && (m<=19)) {
    m1 = m-10;
  }
  else if(m >= 20 && (m<=29)) {
    m1 = m-20;
  }
  else if(m >= 30 && (m<=39)) {
    m1 = m-30;
  }
  else if(m >= 40 && (m<=49)) {
    m1 = m-40;
  }
  else if(m >= 50 && (m<=59)) {
    m1 = m-50;
  }
  else if(m >= 0 && (m<=9)) {
    m1 = m;
  }
//TEN MINUTE DIGIT
  m10 = (m-m1)/10;
//ONE HOUR DIGIT
  if(hN >= 10 && (hN<=19)) {
    h1 = hN-10;
  }
  else if(hN >= 20 && (hN<=29)) {
    h1 = hN-20;
  }
  else if(hN >= 0 && (hN<=9)){
    h1 = hN;
  }
//TEN HOUR DIGIT
  h10 = (hN-h1)/10;
  //1ST SECONDS ROW
  pushMatrix();
  if(mousePressed){
    rotate(angle*0);
  }
  else{
   rotate(angle*2.6);
  }
  if (s1%2 == 0) {
    fill(100);
  }
  else{
    fill(230);
  }
  ellipse(230,0,20,20);
    rotate(radians(-15));
  if (s1 == 2 || (s1 == 3) || (s1 == 6) || (s1 == 7)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(230,0,20,20);
     rotate(radians(-15));
   if (s1 == 4 || (s1 == 5) || (s1 == 6) || (s1 == 7)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(230,0,20,20);
     rotate(radians(-15));
   if (s1 == 8 || (s1 == 9)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(230,0,20,20);
   popMatrix();
   //2ND SECONDS ROW
     pushMatrix();
   if(mousePressed){
    rotate(angle*0);
  }
  else{
   rotate(angle*4.3);
  }
   if (s10 == 1 || (s10 == 3) || (s10 == 5)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(202,00,20,20);
     rotate(radians(-15));
   if (s10 == 2 || (s10 == 3) || (s10 == 6)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(202,0,20,20);
     rotate(radians(-15));
   if (s10 == 4 || (s10 == 5) || (s10 == 6)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(202,0,20,20);
   popMatrix();
    //1ST MINTUE ROW
  pushMatrix();
   if(mousePressed){
    rotate(angle*0);
  }
  else{
   rotate(angle*3.72);
  }
  if (m1%2 == 0) {
    fill(100);
  }
  else{
    fill(230);
  }
  ellipse(174,0,20,20);
    rotate(radians(-15));
  if (m1 == 2 || (m1 == 3) || (m1 == 6) || (m1 == 7)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(174,0,20,20);
     rotate(radians(-15));
   if (m1 == 4 || (m1 == 5) || (m1 == 6) || (m1 == 7)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(174,0,20,20);
     rotate(radians(-15));
   if (m1 == 8 || (m1 == 9)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(174,0,20,20);
   popMatrix();
   //2ND MINUTES ROW
   pushMatrix();
   if(mousePressed){
    rotate(angle*0);
  }
  else{
   rotate(angle*5.45);
  }
   if (m10 == 1 || (m10 == 3) || (m10 == 5)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(146,0,20,20);
     rotate(radians(-15));
   if (m10 == 2 || (m10 == 3) || (m10 == 6)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(146,0,20,20);
     rotate(radians(-15));
   if (m10 == 4 || (m10 == 5)|| (m10 == 6)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(146,0,20,20);
   popMatrix();
    //1ST HOURS ROW
    pushMatrix();
  if(mousePressed){
    rotate(angle*0);
  }
  else{
   rotate(angle*4.12);
  }
  if (h1%2 == 0) {
    fill(100);
  }
  else{
    fill(230);
  }
  ellipse(118,0,20,20);
  rotate(radians(-15));
  if (h1 == 2 || (h1 == 3) || (h1 == 6) || (h1 == 7)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(118,0,20,20);
     rotate(radians(-15));
   if (h1 == 4 || (h1 == 5) || (h1 == 6) || (h1 == 7)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(118,0,20,20);
     rotate(radians(-15));
   if (h1 == 8 || (h1 == 9)){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(118,0,20,20);
   popMatrix();
   //2ND HOURS ROW
   pushMatrix();
   if(mousePressed){
    rotate(angle*0);
  }
  else{
   rotate(angle);
  }
   if (h10 == 1){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(90,00,20,20);
   rotate(radians(-15));
   if (h10 == 2){
    fill(230);
   }
   else{
     fill(100);
   }
   ellipse(90,00,20,20);
   popMatrix();
     //DIGITAL CLOCK
   pushMatrix();
   translate(-85,0);
   scale(.9);
   text(h10+""+h1+":"+m10+""+m1+":"+s10+""+s1,10,19);
   popMatrix();
}



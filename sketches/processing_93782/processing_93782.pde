
void setup() {
  size (500, 750);
  smooth();
  frameRate(60);
}

int a = 250; // X Position of Petals
float b = 575; // Y Position of Petals
float c = 40; // Diameter of Pink Circle
float d = 1.077; // the proportion
float e = 6; // stem size
float r1 = -1365;
float r2 = -1000;
float r3 = -969;
float r4 = -1500;
float r5 = -4;
float r6 = -20;
float r7 = -558;
float r8 = -2000;
float r9 = -467;
float r10 = -700;

void draw() {
  noStroke();
  background(#5761C4);

  //rain1
  if (r1<750) {
    r1 = r1 + 2;
  }
  else {
    r1 = -200;
  }
  fill(255, 255, 255, 100);
  rect(10, r1, 5, 40);
  
  //rain2
  if (r2<750) {
    r2 = r2 + 2;
  }
  else {
    r2 = -300;
  }
  fill(255, 255, 255, 100);
  rect(49, r2, 5, 40);
  
  //rain3
  if (r3<b-1.5*c) {
    r3 = r3 + 2;
  }
  else {
    r3 = -400;
  }
  fill(255, 255, 255, 100);
  rect(152, r3, 5, 40);
  
  //rain4
  if (r4<b-1.5*c) {
    r4 = r4 + 2;
  }
  else {
    r4 = -500;
  }
  fill(255, 255, 255, 100);
  rect(404, r4, 5, 40);
  
  //rain5
  if (r5<b-1.5*c) {
    r5 = r5 + 2;
  }
  else {
    r5 = -600;
  }
  fill(255, 255, 255, 100);
  rect(241, r5, 5, 40);
  
  //rain6
  if (r6<750) {
    r6 = r6 + 2;
  }
  else {
    r6 = -700;
  }
  fill(255, 255, 255, 100);
  rect(66, r6, 5, 40);
  
  //rain7
  if (r7<700) {
    r7 = r7 + 2;
  }
  else {
    r7 = -800;
  }
  fill(255, 255, 255, 100);
  rect(480, r7, 5, 40);
  
  //rain8
  if (r8<b-1.5*c) {
    r8 = r8 + 2;
  }
  else {
    r8 = -900;
  }
  fill(255, 255, 255, 100);
  rect(338, r8, 5, 40);
  
  //rain9
  if (r9<b-1.5*c) {
    r9 = r9 + 2;
  }
  else {
    r9 = -1000;
  }
  fill(255, 255, 255, 100);
  rect(219, r9, 5, 40);
  
  //rain10
  if (r10<750) {
    r10 = r10 + 2;
  }
  else {
    r10 = -100;
  }
  fill(255, 255, 255, 100);
  rect(470, r10, 5, 40);
  

  //stem
  strokeWeight(e);
  stroke(#d1e87f);
  line(a, b, 250, 680);

  noStroke();
  //petals
  //petal 1
  fill(255, 247, 201);
  ellipse(a-c/2, b-c/2, d*c, d*c);

  //petal 3
  fill(255, 247, 201);
  ellipse(a+c/2, b+c/2, d*c, d*c);

  //petal 2
  fill(255, 247, 201);
  ellipse(a-c/2, b+c/2, d*c, d*c);

  //petal 4
  fill(255, 247, 201);
  ellipse(a+c/2, b-c/2, d*c, d*c);

  //flower center
  fill(#FFC6F3);
  ellipseMode(CENTER);
  ellipse(a, b, c, c);

  //flowerpot
  fill(#C17700);
  quad(250-50, 575+85, 250+50, 575+85, 250+40, 740, 250-40, 740);
  fill(#5c3333);
  quad(250-50, 575+85, 250+50, 575+85, 250+47.5, 680, 250-47.5, 680);
  
  //growth
  if(b>200){
    b=b-0.4;
    c=c+0.12;
    e=e+0.042;
  }
  else{
    b=575;
    c=40;
    e=8;
  }
  
}

void mouseClicked(){
  b=575;
  c=40;
  e=8;
  
}

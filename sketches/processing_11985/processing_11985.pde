
void setup(){
  size (1000,500);
}
void draw(){
  //background(255,255,60);
  float cores=random(0,255);
  float cores2=random(0,255);
  float cores3=random(0,255);
  fill (cores,cores2,cores3,150);
  noStroke();
  smooth();
float crescer=mouseX*random(3);
int local1=mouseX;
int local2=mouseY;
int a=100+mouseY;

  ellipse(a+600,200,crescer,crescer);
  ellipse(a+200,a*1.5,crescer,crescer);
  ellipse(a,600,crescer,crescer);
  stroke(2);
  line(500,250,local1,local2);
println ("x"+mouseX+"y"+mouseY);
fill (170,170,170,50);
textSize(300);
text("X"+mouseX, 130, 250);
text("Y"+mouseY, 130, 450);
}



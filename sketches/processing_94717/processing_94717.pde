
PFont f;
String[] sentence = {"","A te ho deciso di dedicare questo primo 'sketch'", "Che hai sempre creduto in me e nelle mie capacità", "Che mi hai amato anche per questo.", "Che mi hai insegnato il concetto di bellezza, tenerezza,","platonismo puro."};
int l = 0;
color[] tone = {#F2F2F2, #C6E070, #6DC49A, #287D7D, #1C344C};
int m1 = 200;
int n1 = 2;
int o1= 800;
int m3= 800;

int wide = 1000;
int high = 400;
int d = 20;
float x1 = random(wide);
float y1 = random(high);
float easing1 = .025;
float x2 = random(wide);
float y2 = random(high);
float easing2 = .04;
float x3 = random(wide);
float y3 = random(high);
float easing3 = .06;

void setup() {
  size(1000, 400);
  smooth();
  noStroke();
  noCursor();
  smooth();
  frameRate(40);
  f = createFont("Gill Sans", 38);
}
void draw(){
  background(tone[4]);
  ellipseMode(CENTER);
  fill(tone[1]);
  ellipse(width/2,200,300,300);
  fill(tone[2],200);
  ellipse(m1, 200, 300,300);
  m1+=n1;
  if(m1>802) {
    ellipse(m1, 200, 300,300);
    m1-= 2;
    n1= -2;  
  }
  if (m1< 198) {
  m1+= 2;
  n1 =  2;
  }
  fill(tone[3], 200);
  ellipse(m3,200,300,300);
  m3-= n1;
  if(m3<200){
    ellipse(m3,200,300,300);
    m3+= 2;
    n1= -2;
  }
  
  fill(tone[1]);
  ellipse(x1, y1, d+15, d+15);
  x1 += (mouseX - x1)*easing1;
  y1 += (mouseY - y1)*easing1;
  fill(tone[2]);
  ellipse(x2, y2, d+10, d+10);
  x2 += (mouseX - x2)*easing2;
  y2 += (mouseY - y2)*easing2;
  fill(tone[3]);
  ellipse(x3, y3, d+5, d+5);
  x3 += (mouseX - x3)*easing3;
  y3 += (mouseY - y3)*easing3;
  fill(tone[0]);
  ellipse(mouseX, mouseY, d, d);
  
  
  textFont(f);
  fill(255);
  textAlign(CENTER);
  text(sentence[l] ,width/2,((height/2)+8));
  }
  void mousePressed() {
    l++;
    if(l>5) {
      l=0;
    }
}

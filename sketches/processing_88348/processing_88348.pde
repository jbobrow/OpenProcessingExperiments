
float yypos = 300;
float sypos = 100;
float yvel = 0;
object square[];
float d;
float scroll = -150;
float v;
void setup() {
  size(400, 400);
square = new object[100];
   for(int i = 0; i < 100; i++) {
         yypos+=random(-50, 50);
             if(yypos>350){
      yypos-=40;
    }
    square[i] = new object(i, yypos);

  
    }
  }


void draw() {
  background(0);
  if(sypos>height) {
  scroll = -150;
  sypos=200;
  }
  textSize(40);
  fill(255, 0, 0);
  text(round(scroll/150)+2, 200, 100);
  fill(255);
  if(keyPressed && keyCode == LEFT) {
  v = -2;
}
if( keyPressed && keyCode == RIGHT) {
  v= 2;
}
if(keyPressed == false) {
  v*=0.9;
}
      beginShape() ;
      for(int i = 0; i<6; i++) {
vertex(200+sin(d-(TWO_PI/5)*i)*15, sypos + cos(d-(TWO_PI/5)*i)*15);
}
endShape();
d-=v/20;
scroll+=v;
fill(255, 0, 0);
rect(0 - scroll, 200, 50, 20);
triangle(50-scroll, 230, 50-scroll, 190, 75-scroll, 210);
fill(255);
for(int k=0; k<100; k++){
square[k].display();
}
}
class object {
  float xpos;
  float ypos = 200;
  int num;


  
  object(int numvar, float yposvar) {
num=numvar;
ypos = yposvar;

  }
  void display() {
    xpos=num*150-scroll;


rect(xpos, ypos, 100, 10);

fill(255, 0, 0);
textSize(20);
text(num+1, xpos+47, ypos+10);
fill(255);

if(sypos>ypos-15 && xpos<200+14 && xpos > 100-14 && sypos>ypos==false) {
  yvel = -0.01;
  }
  else {
    yvel+=0.00003;
    sypos+=yvel;
  }
  if(mousePressed && sypos>ypos-20 && xpos<200 && xpos > 100){
    if(sypos<ypos+10){
  yvel = -0.07;
    }
  }
  }
}





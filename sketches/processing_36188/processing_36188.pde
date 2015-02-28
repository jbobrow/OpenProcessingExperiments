
int a =60;
int b =20;

void setup() {
size(300,300);
smooth();

}

void draw () {
  if(mousePressed){
    background(240,245,10);
  } else {
    background(91,15,147); 
  }
noStroke();
fill(32,242,212);
ellipse(a+160,b+45,b+20,b+20);
fill(211,135,240);
ellipse(b+220,b+10,b+20,b+20);
fill(183,102,206);
ellipse(a+200,a+5,b+20,b+20);
fill(232,198,242);
ellipse(a+180,a+38,b+20,b+20);
fill(215,136,237);
ellipse(a+120,a,b+20,b+20);
fill(190,5,242);
ellipse(a+138,a+40,b+20,b+20);
fill(236,197,247);
ellipse(a+140,b+10,b+20,b+20);

strokeWeight(4);
stroke(153,227,133);
line(a+160,a+60,a+160,a+220);
fill(153,227,133);
ellipse(a+200,a+100,a+10,a-20);
}


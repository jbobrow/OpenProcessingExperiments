

float speed = 2;
float y=1;
int card = 0;
PFont font;
PImage minz;

void setup(){
size(600,600);
smooth();
font = loadFont("Bauhaus93-48.vlw");
textFont(font);
minz = loadImage("minji.png");
}

void draw(){
 if (card == 0){
   pushMatrix();
   background(255);
aaa();
pop1();
pop2();
pop3();
popMatrix();
}else if(card ==1){
  pushMatrix();
  background(255);
    y += random(-speed,speed);
translate(0,y-30);
aaa();
pop1();
pop2();
pop3();
popMatrix();
}else if(card ==2){
  pushMatrix();
  background(255);
    textSize(48);
    fill(157,214,249);
  text("pop",450,200);
y += random(-speed,speed);
translate(0,y-30);
  aaa();
  pop2();
  pop3();
  popMatrix();
}else if(card ==3){
  pushMatrix();
  background(255);
  textSize(48);
      fill(157,214,249);
  text("pop",450,200);
  fill(184,249,165);
  text("pop",160,120);
  y += random(-speed,speed);
translate(0,y-30);
  aaa();
  pop3();
  popMatrix();
}else if(card ==4){
  pushMatrix();
  background(255);
  textSize(48);
        fill(157,214,249);
  text("pop",450,200);
  fill(184,249,165);
  text("pop",160,120);
   fill(249,147,147);
   text("pop",380,150);
   fill(165,249,207);
    text("pop",260,180);
    fill(220,165,249);
text("pop",330,255);
fill(249,94,90);
text("pop",100,210);
fill(247,247,107);
text("pop",280,80);
fill(107,127,247);
text("pop",210,255);
     y += 2;
translate(0,y-30);
  aaa();
  popMatrix();
}else if(card ==5){
  pushMatrix();
  background(255);
  y += 2;
    translate(0,y-500);
  bbb();
  popMatrix();
}else if(card ==6){
  pushMatrix();
  background(0);
  y -=2;
  translate(0,y+300);
  image(minz,250,100);
  popMatrix();
}
}

void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}



void aaa(){
noStroke();
fill(0,154,45);
beginShape();
vertex(300,350);
vertex(280,350);
vertex(280,400);
vertex(240,440);
vertex(220,440);
vertex(220,410);
vertex(190,410);
vertex(190,440);
vertex(170,440);
vertex(137,490);
vertex(107,510);
vertex(118,530);
vertex(156,500);
vertex(176,468);
vertex(176,577);
vertex(158,577);
vertex(158,595);
vertex(196,595);
vertex(196,518);
vertex(220,518);
vertex(220,595);
vertex(255,595);
vertex(255,577);
vertex(239,577);
vertex(239,468);
vertex(300,410);
vertex(300,350);
endShape();}

void pop1(){
  noStroke();
fill(157,214,249);
ellipse(470,200,70,80);
stroke(0);
line(470,240,300,300);
}
void pop2(){
noStroke();
fill(184,249,165);
ellipse(200,120,70,80);
stroke(0);
line(200,160,300,300);

}
void pop3(){
fill(249,147,147);
noStroke();
ellipse(400,150,70,80);
fill(165,249,207);
ellipse(280,180,70,80);
fill(220,165,249);
ellipse(350,255,70,80);
fill(249,94,90);
ellipse(120,210,70,80);
fill(247,247,107);
ellipse(300,80,70,80);
fill(107,127,247);
ellipse(230,255,70,80);

stroke(0);
line(400,190,300,300);
line(290,220,300,300);
line(350,295,300,300);
line(120,250,300,300);
line(300,120,300,300);
line(230,295,300,300);
line(300,300,300,350);}


void bbb(){
  noStroke();
fill(0,154,45);
beginShape();
vertex(290,500);
vertex(290,440);
vertex(240,440);
vertex(220,440);
vertex(220,410);
vertex(190,410);
vertex(190,440);
vertex(140,440);
vertex(140,380);
vertex(120,380);
vertex(120,460);
vertex(140,460);
vertex(176,460);
vertex(176,577);
vertex(158,577);
vertex(158,595);
vertex(196,595);
vertex(196,518);
vertex(220,518);
vertex(220,595);
vertex(255,595);
vertex(255,577);
vertex(239,577);
vertex(239,460);
vertex(270,460);
vertex(270,500);
endShape();
}







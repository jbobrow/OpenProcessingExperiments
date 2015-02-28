
void chara(int a, int b) {
  pushMatrix() ;
  translate(a,b);
//asimaemigi
fill(#EA80C7);
quad(50,85,75,75,75,85,50,95);
//asimaehidari
quad(41,82,50,85,50,95,41,92);
//asiusiromigi
quad(19,73,44,63,44,73,19,83);
//asiusirohidari
quad(10,70,19,73,19,83,10,80);
//sitahidari
quad(10,40,50,55,50,85,10,70);
//sitamigi
quad(50,55,75,45,75,75,50,85);
//sitaue
quad(10,40,35,30,75,45,50,55);
//uehidari
quad(35,20,70,32.5,70,62.5,35,50);
//uemigi
quad(70,32.5,95,22.5,95,52.5,70,62.5);
//ueue
quad(35,20,60,10,95,22.5,70,32.5);
//migimimi
triangle(60,0,60,10,47.5,15);
//hidarimimi
triangle(35,10,35,20,47.5,15);
//kutimae
line(70,47.5,95,37.5);
//kutiyoko
line(55,42.5,70,47.5);
//me
fill(000000);
ellipse(45,30,5,5);

popMatrix() ;
}
void chara2(int a, int b) {
  pushMatrix();

  fill(#ffffff);
  noStroke();
  quad(10, 150, 10, 200, 210, 200, 210, 150); 
  quad(80, 200, 80, 250, 280, 250, 280, 200);
  quad(390, 300, 390, 350, 590, 350, 590, 300);
  popMatrix();
}
void chara3(int a, int b) {
  pushMatrix();
  stroke(0,0,0);
  fill(#FFDBA5);
  quad(20,470,20,590,140,590,140,470);
  fill(#FA3F3F);
  triangle(0,470,160,470,80,400);
  fill(#11BBED);
  quad(50,500,50,560,110,560,110,500);
  line(80,500,80,560);
  line(50,530,110,530);
  popMatrix();
}
void chara4(int a, int b) {
  pushMatrix();
  //asimaemigi
fill(#11BBED);
quad(50,85,75,75,75,85,50,95);
//asimaehidari
quad(41,82,50,85,50,95,41,92);
//asiusiromigi
quad(19,73,44,63,44,73,19,83);
//asiusirohidari
quad(10,70,19,73,19,83,10,80);
//sitahidari
quad(10,40,50,55,50,85,10,70);
//sitamigi
quad(50,55,75,45,75,75,50,85);
//sitaue
quad(10,40,35,30,75,45,50,55);
//uehidari
quad(35,20,70,32.5,70,62.5,35,50);
//uemigi
quad(70,32.5,95,22.5,95,52.5,70,62.5);
//ueue
quad(35,20,60,10,95,22.5,70,32.5);
//migimimi
triangle(60,0,60,10,47.5,15);
//hidarimimi
triangle(35,10,35,20,47.5,15);
//kutimae
line(70,47.5,95,37.5);
//kutiyoko
line(55,42.5,70,47.5);
//me
ellipse(45,30,5,5);

  popMatrix();
}

float x, y;
float vx, vy;
float ay;
float speed;
void setup() {
  size(600, 600);
  x=0;
  y=0;
  vx=5;
  vy=8;
  ay=0.7;
  speed=4.3;
}
void draw() {
  background(#11BBED);
  noStroke();
  fill(#7DFF3E);
  quad(0, 500, 0, 600, 600, 600, 600, 500);
  stroke(0, 0, 0);
  textSize(25);
  text("GO HOME!!!!",170,500);
  fill(000000);
  text("Different dog appear.",100,50);
  chara4(0,0);
  chara(int(x), int(y));
  chara2(100, 100);
  chara3(100, 100);

  x=x+vx;
  y=y+vy;

//ugoku
if(keyPressed) { 
    if (key == 'x' || key == 'X'){ 
      x=x+speed;
    }
  }
  if(keyPressed) { 
    if (key == 'z' || key == 'Z'){ 
      x=x-speed;
    }
  }
  //homehanntei
  
  if ((y>450)&&(x<120)) {
    x=0;
    y=0;
  }

  //kumohanntei
  if((x>-20)&&(x<190)&&(y>55)&&(y<150)){
    vy=-vy;
    y=55;
    vy=vy*0.9;
    vx=vx*0.9;
  }
  if((x>60)&&(x<260)&&(y>105)&&(y<155)){
    vy=-vy;
    y=105;
    vy=vy*0.9;
    vx=vx*0.9;
  }
  if((x>310)&&(x<570)&&(y>205)&&(y<305)){
    vy=-vy;
    y=205;
    vy=vy*0.9;
    vx=vx*0.9;
  }
    

  //baunndo
  if (x>510) {
    vx=-vx;
    x=510;
  }
  if (x<-10) {
    vx=-vx;
    x=-10;
  }
  if (y>505) {
    vy=-vy;
    y=505;
    vy=vy*0.9;
    vx=vx*0.9;
  }
  if (y<0)vy=-vy;
  vy=vy+ay;
  if (mousePressed) {
    if ((mouseX>x-10)&&(mouseX<x+100)&&(mouseY>y-80)&&(mouseY<y+80)) {
      x=mouseX-50;
      y=mouseY-50;
      vx=0;
      vy=0;
    }
  }
}
void mouseReleased() {
  vx=mouseX-pmouseX;
  vy=mouseY-pmouseY;
}

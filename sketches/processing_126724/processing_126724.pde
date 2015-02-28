
PImage bg;

int x, y;
int vx;
int vy;


      

void setup() {
  size(600, 600);
     bg = loadImage("processing.jpg");
 
  x=0;
  y=250;
  vx=3;
  vy=2;
}

void draw() { 
  

cursor(HAND);
background(bg);
 
  


  pushMatrix();
  scale(2);
  chara(160, 200);

  if (keyPressed) {  
    kuti(160, 200);
    
     PFont font;


    textSize(10);
    fill(#563EE3);
    text("I'm hungry!", 130, 230); 
    fill(#563EE3);
  }


  popMatrix();

  pushMatrix();
  scale(0.8);
  chara(80, 400);


  popMatrix();

  pushMatrix();
  scale(0.8);
  chara(150, 350);


  popMatrix();

  pushMatrix();
  scale(4);
  chara(60, 0);


  popMatrix();


  pushMatrix();
  chara(x, y);

  x=x+vx;
  y=y+vy;



  if (x>515)vx=-vx;
  if (y>510)vy=-vy;
  if (x<0)vx=-vx;
  if (y<0)vy=-vy;

  if (mousePressed) {
    atama(x, y);
    chara(x+50,y+50);
    chara(x-50,y-30);
  }


  popMatrix();
}


void atama(int a,int b){
   pushMatrix();
  translate(a,b);
  strokeWeight(1);
  fill(255);
  stroke(0);  
  
  stroke(a, b, 46);
  fill(a,b,0,150);
  ellipse(50, 10, 10, 10);
  ellipse(50, 90, 10, 10);
  ellipse(50, 80, 15, 15);
  ellipse(80, 30, 20, 20);
  ellipse(20, 20, 15, 15);
  ellipse(90, 70, 10, 10);
  ellipse(20, 90, 20, 20);
  ellipse(10, 80, 10, 10);
  ellipse(20, 30, 10, 10);
  ellipse(20, 20, 10, 10);
  
  popMatrix();
}
void chara(int a,int b) {
  pushMatrix();
  translate(a,b);
  strokeWeight(1);
  fill(255);
  stroke(0);

  //  outline
  stroke(96, 63, 30);
  fill(255, 248, 214);
  ellipse(50, 50, 50, 50);
  //  kazari
  stroke(a, b, 46);
  fill(a,b,0,150);
  ellipse(50, 20, 10, 10);
  ellipse(50, 80, 10, 10);
  ellipse(50, 87, 10, 10);
  ellipse(70, 30, 10, 10);
  ellipse(30, 30, 10, 10);
  // kazari naka
  stroke(227, 151, 80);
  noFill();
  ellipse(35, 60, a/50, a/50);
  ellipse(42, 67, a/100,a/100);
 pushMatrix();
translate(66,55);
rotate(map(b, 0, 600, 0, radians(3600)));
  line(-4, 0, 4, 0);
  line(0, -4, 0, 4);
popMatrix();
  line(64, 53, 66, 55);
  line(66, 55, 68, 57);
  line(68, 53, 66, 55);
  line(66, 55, 64, 57);
  //  hand
  stroke(96, 63, 30);
  pushMatrix();
translate(75,50);
rotate(map(b, 0, 600, 0, radians(-100)));
  line(0, 0, 8, -7);
popMatrix();
pushMatrix();
translate(25,50);
rotate(map(b, 0, 600, 0, radians(-80)));
  line(0, 0, -9, 7);
popMatrix();  
  //  mouth
  stroke(96, 63, 30);
  line(45, 43, 50, 45);
  line(50, 45, 55, 43);
  //  eyes
  stroke(96, 63, 30);
  strokeWeight(3);
  fill(255, 255, 255);
  ellipse(38, 40, a/50, b/50);
  strokeWeight(3);
  fill(255, 255, 255);
  ellipse(62, 40, a/50, b/50); 
  
 
  popMatrix();
}

 void kuti(int a,int b) {
  pushMatrix();
  translate(a,b);
  strokeWeight(1);
  fill(255);
  stroke(0);

 //  mouth
  stroke(96, 63, 30);
  line(45, 43, 50, 45);
  line(50, 45, 55, 43);
  
  line(45, 43,50,40);
  line(50,40, 55, 43);
  
  popMatrix();
  
 }



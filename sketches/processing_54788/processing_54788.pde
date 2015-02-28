
PFont myFont;
float ascent;
float r = 65;
float rcc = 100;
float r1x = 50;
float r1y = 300;
float r1c = 255;
float r2x = 50;
float r2y = 400;
float r3x = 50;
float r3y = 500;
float wx = 150;
float wy = 350;
float fx = 150;
float fy = 450;
float cx = 150;
float cy = 550;
float tc = 55;
float tcc = 28;
int m = 0;
int k = 0;

void setup(){
  size(400,700);
  background(240,255,249);
  myFont = loadFont("CenturyGothic-Bold-90.vlw");
  
}

void draw(){
  textFont(myFont);
  fill(255,237,188,10);
  textSize(100);
  textAlign(CENTER);
  text("TREAT",200,150);
  textAlign(CENTER);
  text("YOURSELF",200,236);
  
  fill(255,175,76,30);
  textSize(80);
  textAlign(CENTER);
  text("TREAT",200,150);
  textAlign(CENTER);
  text("YOURSELF",200,220);
  
  fill(255,133,3,50);
  textSize(65);
  textAlign(CENTER);
  text("TREAT",200,150);
  textAlign(CENTER);
  text("YOURSELF",200,210);
  
  fill(200,100,3);
  textSize(50);
  textAlign(CENTER);
  text("TREAT",200,150);
  textAlign(CENTER);
  text("YOURSELF",200,200);

  
  noStroke();
  fill(r1c,28,8,rcc);
  rect(r1x,r1y,r,r);
  rect(r2x,r2y,r,r);
  rect(r3x,r3y,r,r);
  
  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("RE",r1x+30,r1y+50);
  textSize(50);
  textAlign(CENTER);
  text("RE",r2x+30,r2y+50);
  textSize(50);
  textAlign(CENTER);
  text("RE",r3x+30,r3y+50);
  
  fill(tc,tcc,8);
  textSize(50);
  textAlign(LEFT);
  text("WARD",wx,wy); 
  textSize(50);
  textAlign(LEFT);
  text("FUEL",fx,fy);
  textSize(50);
  textAlign(LEFT);
  text("CHARGE",cx,cy);
}

void mousePressed(){
  r -= 1;
  rcc -= 5;
  r1x -= 5;
  r1y -= 5;
  r1c -= 10;
  r2x -=5;
  r2y += 5;
  r3x += 5;
  r3y +=5;
  if(m<18){
  wx -= 3;
  wy +=4;
  fx +=2;
  fy +=3;
  cx +=2;
  cy -=4;
  tc += 10;
  tcc += 5;
  } else if(m<21){
  fx +=2;
  fy +=3;
  cx +=2;
  cy -=4;
  tc += 10;
  tcc += 5;
  } else if(m<23){
  fx +=2;
  fy +=3;
  tc += 10;
  tcc += 5;
  }
  m++;
}

void keyPressed(){
  if(k<30){
  r += 1;
  rcc += 5;
  r1x += 5;
  r1y += 5;
  r1c += 10;
  r2x +=5;
  r2y -= 5;
  r3x -= 5;
  r3y -=5;
  wx += 3;
  wy -=4;
  fx -=2;
  fy -=3;
  cx -=2;
  cy +=4;
  tc -= 10;
  tcc -= 5;
  }
  k++; 
}


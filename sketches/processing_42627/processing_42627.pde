
PImage img;
PImage img2;
PImage img3;
PImage power;
int x = 0;
int x1 = 0;
int y = 0;
int y1 = 0;


float c1 = 0;
float c2 = 50;
float c3 = 100;
float c4 = 150;


void setup() {
  size(250, 360);
  smooth();
  //processing image
  img = loadImage("chuck.png");
  img2 = loadImage("wanted1.png");
  img3 = loadImage("wanted.png");
  power= loadImage("power.png");
}

void draw() {

  background(255); 
  noStroke();
  //TL
  tint(c1,c2,c3);
  image(img2, x, y1);
  //TR
  tint(c2,c3,c4);
  image(img3, x1, y1);
  //BL
  tint(c3,c4,c1);
  image(img2, x, y);
  //BR
  tint(c4,c1,c3);
  image(img3, x1, y);
  noTint();
  image(power, width/2-20, height/2-20);

  if (mousePressed && mouseX>110 && mouseX<140 && mouseY>160 &&mouseY<200) {
    x=x-5;
    x1=x1+5;
    y=y+3;
    y1=y1-3;

    fill(255, 255, 0);
    ellipse(mouseX-8, mouseY, 100+random(10), 200+random(10, 50));
  }
  else {
    x=0;
    x1=125;
    y=180;
    y1=0;
  }
  //TL
  if (mouseX<125 && mouseY<180){
    c1= 0; 
    if(c2>255) {c2=0;}
    c2= c2 + 15;
    if(c3>255) {c3=0;}
    c3= c3 + 5;
    if(c4>255) {c4=0;}
    c4= c4 +10;

}
  //BL
 if (mouseX<125 && mouseY>180){
    if(c1<0) {c1=255;}
    c1= c1-5; 
    c2= 0;
    if(c3>255) {c3=0;}
    c3= c3 + 5;
    if(c4>255) {c4=0;}
    c4= c4 +10;

}
//TR
 if (mouseX>125 && mouseY<180){
    if(c1<0){c1=255;}
     c1= -5; 
    if(c2<0) {c2=255;}
    c2= c2 - 1;
    c3= 0;
    if(c4<0) {c4=255;}
    c4= c4 -10;

}
//BR
 if (mouseX>125 && mouseY>180){
    if(c1>255) {c1=0;}
    c1= c1+10; 
    if(c2>255) {c2=0;}
    c2= c2+3;
    if(c3>255) {c3=0;}
    c3= c3 + 5;
    c4= 0;

}



  image(img, mouseX-62, mouseY-90);
}




PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;
PImage sp1;
PImage sp2;
PImage sp3;
PImage sp4;
PImage sp5;
PImage sp6;
PImage sp7;
PImage go;
float x1 = 30;
float y1 = 20;
float circley =40;
float move;
int i=0;


void setup(){
  size(720,540);

  sp1 = loadImage("sp1.png");
  sp2 = loadImage("sp2.png");
  sp3 = loadImage("sp3.png");
  sp4 = loadImage("sp4.png");
  sp5 = loadImage("sp5.png");
  sp6 = loadImage("sp6.png");
  sp7 = loadImage("sp7.png");
  p1 = loadImage("p1.png");
  p2 = loadImage("p2.png");
  p3 = loadImage("p3.png");
  p4 = loadImage("p4.png");
  p5 = loadImage("p5.png");
  p6 = loadImage("p6.png");
  p7 = loadImage("p7.png");
  go = loadImage("go.png");
}

void draw(){
  background(0);
  stroke(255);
  line(200,40,200,500);
  smooth(255);
  image(go,600,50);
  fill(255);
  if (mouseX>185 &&mouseX<215 &&mouseY>40 &&mouseY<500 &&mousePressed){
  circley();
  }
  ellipse(200,circley,14,14);
  move = map(dist(200,circley,200,40),0,460,0,378);
  image(sp1,x1, y1-move);
  image(sp2,x1, y1+130-move);
  image(sp3,x1, y1+260-move);
  image(sp4,x1, y1+390-move);
  image(sp5,x1, y1+520-move);
  image(sp6,x1, y1+650-move);
  image(sp7,x1, y1+780-move);
  choose();
  switch(i) {
    case 0: 
      image(p1,208,81,504,378);
    break;
    case 1: 
      image(p1,208,81,504,378);
      stroke(255);
      image(sp1,x1-8, y1-move-6,160,120);
    break;
    case 2: 
      image(p2,208,81,504,378);
      image(sp2,x1-8, y1-move+124,160,120);
    break;
    case 3: 
      image(p3,208,81,504,378);
      image(sp3,x1-8, y1-move+254,160,120);
    break;
    case 4: 
      image(p4,208,81,504,378);
      image(sp4,x1-8, y1-move+384,160,120);
    break;
    case 5: 
      image(p5,208,81,504,378);
      image(sp5,x1-8, y1-move+514,160,120);
    break;
    case 6: 
      image(p6,208,81,504,378);
      image(sp6,x1-8, y1-move+644,160,120);
    break;
    case 7: 
      image(p7,208,81,504,378);
      image(sp7,x1-8, y1-move+774,160,120);
    break;
  }
}



void circley(){
  circley = mouseY;
}

void choose(){
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1-move&&mouseY<y1+108-move &&mousePressed){
    i=1;
  }
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1+130-move &&mouseY<y1+238-move &&mousePressed){
    i=2;
  }
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1+260-move &&mouseY<y1+368-move &&mousePressed){
    i=3;
  }
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1+390-move &&mouseY<y1+498-move &&mousePressed){
    i=4;
  }
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1+520-move &&mouseY<y1+628-move &&mousePressed){
    i=5;
  }
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1+650-move &&mouseY<y1+758-move &&mousePressed){
   i=6;
  }
  if(mouseX>x1 &&mouseX<x1+108 && mouseY>y1+780-move &&mouseY<y1+888-move &&mousePressed){
   i=7;
  }
}






PImage p11,p12,p13,p14,p15,p16,p17,sp11,sp12,sp13,sp14,sp15,sp16,sp17;
PImage p21,p22,p23,p24,p25,p26,p27,sp21,sp22,sp23,sp24,sp25,sp26,sp27;
PImage p31,p32,p33,p34,p35,p36,p37,sp31,sp32,sp33,sp34,sp35,sp36,sp37;
PImage p41,p42,p43,p44,p45,p46,p47,sp41,sp42,sp43,sp44,sp45,sp46,sp47;
PImage go,stop,back,next;
float x1 = 30;
float y1 = 20;
float circley =40;
float move;
int i=0;
boolean a = false;
int t= 99;
int s=0;
boolean canchoose=true;

void setup(){
  size(720,540);

  sp11 = loadImage("sp11.png");
  sp12 = loadImage("sp12.png");
  sp13 = loadImage("sp13.png");
  sp14 = loadImage("sp14.png");
  sp15 = loadImage("sp15.png");
  sp16 = loadImage("sp16.png");
  sp17 = loadImage("sp17.png");
  sp21 = loadImage("sp21.jpg");
  sp22 = loadImage("sp22.jpg");
  sp23 = loadImage("sp23.jpg");
  sp24 = loadImage("sp24.jpg");
  sp25 = loadImage("sp25.jpg");
  sp26 = loadImage("sp26.jpg");
  sp27 = loadImage("sp27.jpg");
  sp31 = loadImage("sp31.jpg");
  sp32 = loadImage("sp32.jpg");
  sp33 = loadImage("sp33.jpg");
  sp34 = loadImage("sp34.jpg");
  sp35 = loadImage("sp35.jpg");
  sp36 = loadImage("sp36.jpg");
  sp37 = loadImage("sp37.jpg");
  sp41 = loadImage("sp41.jpg");
  sp42 = loadImage("sp42.jpg");
  sp43 = loadImage("sp43.jpg");
  sp44 = loadImage("sp44.jpg");
  sp45 = loadImage("sp45.jpg");
  sp46 = loadImage("sp46.jpg");
  sp47 = loadImage("sp47.jpg");
  p11 = loadImage("p11.png");
  p12 = loadImage("p12.png");
  p13 = loadImage("p13.png");
  p14 = loadImage("p14.png");
  p15 = loadImage("p15.png");
  p16 = loadImage("p16.png");
  p17 = loadImage("p17.png");
  p21 = loadImage("p21.jpg");
  p22 = loadImage("p22.jpg");
  p23 = loadImage("p23.jpg");
  p24 = loadImage("p24.jpg");
  p25 = loadImage("p25.jpg");
  p26 = loadImage("p26.jpg");
  p27 = loadImage("p27.jpg");
  p31 = loadImage("p31.jpg");
  p32 = loadImage("p32.jpg");
  p33 = loadImage("p33.jpg");
  p34 = loadImage("p34.jpg");
  p35 = loadImage("p35.jpg");
  p36 = loadImage("p36.jpg");
  p37 = loadImage("p37.jpg");
  p41 = loadImage("p41.jpg");
  p42 = loadImage("p42.jpg");
  p43 = loadImage("p43.jpg");
  p44 = loadImage("p44.jpg");
  p45 = loadImage("p45.jpg");
  p46 = loadImage("p46.jpg");
  p47 = loadImage("p47.jpg");

  go = loadImage("go.png");
  stop = loadImage("stop.png");
  back = loadImage("back.png");
  next = loadImage("next.png");
}

void draw(){
  chooseslide();
  switch(s){
    case 0:
      slide0();
    break;
    case 1:
      slide1();
    break;
    case 2:
      slide2();
    break;
    case 3:
      slide3();
    break;
    case 4:
      slide4();
    break;
  }
}

void slide0(){
  canchoose=true;
  background(0);
  image(p11,60,45,200,150);
  image(p21,280,45,150,150);
  image(p31,450,45,178,150);
  image(p41,60,215,200,145);
}

void slide1(){
  canchoose=false;
  background(0);
  stroke(255);
  line(200,40,200,500);
  smooth(255);
  fill(255);
  circley();
  play();
  
  ellipse(200,circley,14,14);
  move = map(dist(200,circley,200,40),0,460,0,378);
  image(sp11,x1, y1-move);
  image(sp12,x1, y1+130-move);
  image(sp13,x1, y1+260-move);
  image(sp14,x1, y1+390-move);
  image(sp15,x1, y1+520-move);
  image(sp16,x1, y1+650-move);
  image(sp17,x1, y1+780-move);
  image(back,630, 50);
  choose1();
  if(a==true){
  start();
  }
  switch(i) {
    case 0: 
      image(p11,208,81,504,378);
    break;
    case 1: 
      image(p11,208,81,504,378);
      stroke(255);
      image(sp11,x1-8, y1-move-6,160,120);
    break;
    case 2: 
      image(p12,208,81,504,378);
      image(sp12,x1-8, y1-move+124,160,120);
    break;
    case 3: 
      image(p13,208,81,504,378);
      image(sp13,x1-8, y1-move+254,160,120);
    break;
    case 4: 
      image(p14,208,81,504,378);
      image(sp14,x1-8, y1-move+384,160,120);
    break;
    case 5: 
      image(p15,208,81,504,378);
      image(sp15,x1-8, y1-move+514,160,120);
    break;
    case 6: 
      image(p16,208,81,504,378);
      image(sp16,x1-8, y1-move+644,160,120);
    break;
    case 7: 
      image(p17,208,81,504,378);
      image(sp17,x1-8, y1-move+774,160,120);
    break;
  }
  if(mousePressed && mouseX>630 &&mouseX<650 &&mouseY>50 &&mouseY<70){
    s=0;
    i=0;
    circley=40;
  }
  t++;
}

void slide2(){
  canchoose=false;
  background(0);
  stroke(255);
  line(200,40,200,500);
  smooth(255);
  fill(255);
  circley();
  play();
  
  ellipse(200,circley,14,14);
  move = map(dist(200,circley,200,40),0,460,0,378);
  image(sp21,x1, y1-move);
  image(sp22,x1, y1+130-move);
  image(sp23,x1, y1+260-move);
  image(sp24,x1, y1+390-move);
  image(sp25,x1, y1+520-move);
  image(sp26,x1, y1+650-move);
  image(sp27,x1, y1+780-move);
  image(back,630, 50);
  choose1();
  if(a==true){
  start();
  }
  switch(i) {
    case 0: 
      image(p21,271,81,378,378);
    break;
    case 1: 
      image(p21,271,81,378,378);
      stroke(255);
      image(sp21,x1-8, y1-move-6,120,120);
    break;
    case 2: 
      image(p22,271,81,378,378);
      image(sp22,x1-8, y1-move+124,120,120);
    break;
    case 3: 
      image(p23,271,81,378,378);
      image(sp23,x1-8, y1-move+254,120,120);
    break;
    case 4: 
      image(p24,271,81,378,378);
      image(sp24,x1-8, y1-move+384,120,120);
    break;
    case 5: 
      image(p25,271,81,378,378);
      image(sp25,x1-8, y1-move+514,120,120);
    break;
    case 6: 
      image(p26,271,81,378,378);
      image(sp26,x1-8, y1-move+644,120,120);
    break;
    case 7: 
      image(p27,271,81,378,378);
      image(sp27,x1-8, y1-move+774,120,120);
    break;
  }
  if(mousePressed && mouseX>630 &&mouseX<650 &&mouseY>50 &&mouseY<70){
    s=0;
    i=0;
    circley=40;
  }
  t++;
}

void slide3(){
  canchoose=false;
  background(0);
  stroke(255);
  line(200,40,200,500);
  smooth(255);
  fill(255);
  circley();
  play();
  
  ellipse(200,circley,14,14);
  move = map(dist(200,circley,200,40),0,460,0,378);
  image(sp31,x1, y1-move);
  image(sp32,x1, y1+130-move);
  image(sp33,x1, y1+260-move);
  image(sp34,x1, y1+390-move);
  image(sp35,x1, y1+520-move);
  image(sp36,x1, y1+650-move);
  image(sp37,x1, y1+780-move);
  image(back,630, 50);
  choose1();
  if(a==true){
  start();
  }
  switch(i) {
    case 0: 
      image(p31,236,81,448,378);
    break;
    case 1: 
      image(p31,236,81,448,378);
      stroke(255);
      image(sp31,x1-8, y1-move-6,142,120);
    break;
    case 2: 
      image(p32,236,81,448,378);
      image(sp32,x1-8, y1-move+124,142,120);
    break;
    case 3: 
      image(p33,236,81,448,378);
      image(sp33,x1-8, y1-move+254,142,120);
    break;
    case 4: 
      image(p34,236,81,448,378);
      image(sp34,x1-8, y1-move+384,142,120);
    break;
    case 5: 
      image(p35,236,81,448,378);
      image(sp35,x1-8, y1-move+514,142,120);
    break;
    case 6: 
      image(p36,236,81,448,378);
      image(sp36,x1-8, y1-move+644,142,120);
    break;
    case 7: 
      image(p37,236,81,448,378);
      image(sp37,x1-8, y1-move+774,142,120);
    break;
  }
  if(mousePressed && mouseX>630 &&mouseX<650 &&mouseY>50 &&mouseY<70){
    s=0;
    i=0;
    circley=40;
  }
  t++;
}

void slide4(){
  canchoose=false;
  background(0);
  stroke(255);
  line(200,40,200,500);
  smooth(255);
  fill(255);
  circley();
  play();
  
  ellipse(200,circley,14,14);
  move = map(dist(200,circley,200,40),0,460,0,378);
  image(sp41,x1, y1-move);
  image(sp42,x1, y1+130-move);
  image(sp43,x1, y1+260-move);
  image(sp44,x1, y1+390-move);
  image(sp45,x1, y1+520-move);
  image(sp46,x1, y1+650-move);
  image(sp47,x1, y1+780-move);
  image(back,630, 50);
  choose1();
  if(a==true){
  start();
  }
  switch(i) {
    case 0: 
      image(p41,205,89,510,362);
    break;
    case 1: 
      image(p41,205,89,510,362);
      stroke(255);
      image(sp41,x1-8, y1-move-6,169,120);
    break;
    case 2: 
      image(p42,205,89,510,362);
      image(sp42,x1-8, y1-move+124,169,120);
    break;
    case 3: 
      image(p43,205,89,510,362);
      image(sp43,x1-8, y1-move+254,169,120);
    break;
    case 4: 
      image(p44,205,89,510,362);
      image(sp44,x1-8, y1-move+384,169,120);
    break;
    case 5: 
      image(p45,205,89,510,362);
      image(sp45,x1-8, y1-move+514,169,120);
    break;
    case 6: 
      image(p46,205,89,510,362);
      image(sp46,x1-8, y1-move+644,169,120);
    break;
    case 7: 
      image(p47,205,89,510,362);
      image(sp47,x1-8, y1-move+774,169,120);
    break;
  }
  if(mousePressed && mouseX>630 &&mouseX<650 &&mouseY>50 &&mouseY<70){
    s=0;
    i=0;
    circley=40;
  }
  t++;
}

void circley(){
  if (mouseX>185 &&mouseX<215 &&mouseY>40 &&mouseY<500 &&mousePressed){
    circley = mouseY;
  }
}

void choose1(){
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

void play(){
  if(mouseX>600 &&mouseX<620 &&mouseY>0 &&mouseY<70 &&mousePressed){
    a=!a;
  }
  if(a == false){
    image(go,600,50);
  }else{
    image(stop,600,50);
  }
}

void start(){
  if(t%100==0 && i<7){
    i++;
  }
}

void chooseslide(){
  if(mousePressed && mouseX>60 &&mouseX<260 &&mouseY>45 &&mouseY<195 && canchoose==true){
    s=1;
  }
  if(mousePressed && mouseX>280 &&mouseX<430 &&mouseY>45 &&mouseY<195 && canchoose==true){
    s=2;
  }
  if(mousePressed && mouseX>450 &&mouseX<628 &&mouseY>45 &&mouseY<195 && canchoose==true){
    s=3;
  }
  if(mousePressed && mouseX>60 &&mouseX<260 &&mouseY>215 &&mouseY<360 && canchoose==true){
    s=4;
  }
}



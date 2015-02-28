
int card = 0; 

PImage img1;
PImage img2;
PImage img3;
PImage img4;

PFont font;

int x = 750;
int y = 350;
int w = 40;
int h = 50;


void setup() {
  size (800,400) ;
  smooth();
  background(250);
  img1 = loadImage("Untitled-3.jpg");
  img2 = loadImage("Untitled-6.gif");
  img3= loadImage("Untitled-7.gif");
  img4= loadImage("Untitled-2.gif");


  font = loadFont("BradleyHandITC-48.vlw");
  textFont(font);
}

void draw() {
  noStroke();
  if (card == 0) {
    rect (x,y,w,h);

    image(img1, 0,0);
    image(img2, 580,0);
    image(img4,750,350);

    textSize(45);
    fill(59,178,107);
    text("< Growing Larva >",20,50);
    textSize(25);
    text("   Once upon a time, ",20,90);
    text("   The green larva was living.",20,130);
    text("   He is taking a walk.",20,170);

    textSize(25);
    fill(246,30,6);
    text("clik",700,380);


    head(-150,250,1,0); 
    body1(0,0,1,0);
    body2(0,0,1,0);
    body4(0,0,1,0);
    body3(0,0,1,0);
  }

  else if (card == 1) {  
    rect (x,y,w,h);

    image(img1, 0,0);
    image(img2, 580,0);
    image(img4,750,350);

    textSize(25);
    fill(59,178,107);
    text("  At that time,",20,40);
    text("  green larva look around and find the red apple. ",20,80);
    text("  He is getting hungry. ",20,120);

    textSize(25);
    fill(246,30,6);
    text("clik",700,380);

    head(0,250,1,0); 
    body1(0,0,1,0);
    body2(0,0,1,0);
    body4(0,0,1,0);
    body3(0,0,1,0);
  }  

  if (card == 2) {
    rect (x,y,w,h);

    image(img1, 0,0);
    image(img2, 580,0);
    image(img4,750,350);

    textSize(25);
    fill(59,178,107);
    text(" 'I would really like to have some apples.'",20,40);
    text("  Larva said.",20,70);
    text(" But apple tree is too high in the land.",20,100);
    text(" So, he work out a new method.",20,130);

    textSize(25);
    fill(246,30,6);
    text("clik",700,380);

   body1(120,250,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
  head(0,int(random(190,195)),1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  
  }


  if (card == 3) {
    rect (x,y,w,h);
    image(img1, 0,0);
    image(img2, 580,0);
    image(img4,750,350);

    textSize(25);
    fill(59,178,107);
    text("  Larva beginning stand up to eat apple.",20,40);

    textSize(25);
    fill(246,30,6);
    text("clik",700,380);      

    head(200,390,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
    body1(0,0,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
    body2(120,-90,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
    body4(0,0,1,0);
    body3(0,0,1,0);
  }
  if (card == 4) {
    rect (x,y,w,h);
    image(img1, 0,0);
    image(img2, 580,0);
    image(img4,750,350);

    textSize(25);
    fill(59,178,107);
    text("  'I will eat apple!!'",20,40);
    text("  He goes up, goes up.",20,70);

    textSize(25);
    fill(246,30,6);
    text("clik",700,380);

    head(200,310,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
    body1(10,215,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
    body2(118,-80,1,QUARTER_PI);
    body4(103,-40,1,QUARTER_PI);
    body3(0,0,1,0);
  }



  if (card == 5) {
    rect (x,y,w,h);
    image(img1, 0,0);
    image(img2, 580,0);
    image(img4,750,350);

    textSize(25);
    fill(59,178,107);
    text("   He goes up.. ",20,40);
    text("   He goes up... ",20,70);
    text("   He goes up.... ",20,100);

    textSize(25);
    fill(246,30,6);
    text("clik",700,380);

    head(200,260,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
    body1(0,207,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
    body2(0,0,1,0);
    body3(105,-40,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
    body4(90,10,1,QUARTER_PI);
  }
  if (card == 6) {
    rect (x,y,w,h);

    image(img1, 0,0);
    image(img3, 580,0);
    image(img4,750,350);

    textSize(25);
    fill(59,178,107);
    text("  Finally, Larva stand with his feet.",20,40);
    text("  and eat apple.",20,70);
    text("  Now,The green larva can walk freely.",20,100);

    textSize(25);
    fill(246,30,6);
    text("The end",660,380);

    head(270,40,1,0); 
    body1(150,360,1,PI+HALF_PI);
    body2(0,0,1,0);
    body3(0,0,1,0);
    body4(155,55,1,HALF_PI);
  }
}

void body2(int z, int b,float c, float v) {
  noStroke();
  translate(z,b);
  scale(c);
  rotate(v);
  noStroke();


  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(145,120,140,140);
  line(155,120,160,140);

  //body
  noStroke();
  fill(8,244,138);
  ellipse(150,105,50,50);
}


void body3(int d, int f,float g, float h) {
  noStroke();
  translate(d,f);
  scale(g);
  rotate(h);
  noStroke();

  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(95,120,90,140);
  line(105,120,110,140);

  //body
  noStroke();
  fill(59,178,107);
  ellipse(100,105,50,50);
}


void body4(int u, int i,float o, float p) {
  noStroke();
  translate(u,i);
  scale(o);
  rotate(p);
  noStroke();


  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(45,120,40,140);
  line(55,120,60,140);


  //body
  noStroke();
  fill(8,244,138);
  ellipse(50,105,50,50);
}


void head(int q, int w,float e, float r) {
  noStroke();
  translate(q,w);
  scale(e);
  rotate(r);
  noStroke();

  //head line
  strokeWeight(4);
  stroke(83,178,126);
  line(250,50,270,100);
  line(280,50,260,100);
  stroke(100,204,10);
  strokeWeight(8);
  line(246,40,250,50);
  line(284,40,280,50);


  //body
  noStroke();
  fill(8,244,138);
  ellipse(260,100,70,70);  

  //eye
  noStroke();
  fill(255);
  ellipse(250,80,20,20);
  ellipse(275,80,20,20);
  fill(0);
  ellipse(253,75,10,10);
  ellipse(278,75,10,10);

  //mouse
  noStroke();
  fill(247,201,201);
  ellipse(240,90,18,8);
  ellipse(285,90,18,8);
  noStroke();
  fill(244,127,127);
  arc(260,100,70,70,0,QUARTER_PI);
}



void body1(int x, int y,float s,float t) {

  noStroke();
  translate(x,y);
  scale(s);
  rotate(t);
  noStroke();



  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(195,120,190,140);
  line(205,120,210,140);

  //body
  noStroke();
  fill(59,178,107);
  ellipse(200,105,50,50);
}


void mousePressed() {  

  if (card == 0) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 2;
    } 
    else card =1;
  }   
  else if (card == 2) {

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 3;
    } 
    else card = 2;
  }
  else if (card == 3) {
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 4;
    } 
    else card = 3;
  }  


  else if (card == 4) {
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 5;
    } 
    else card = 4;
  }  



  else if (card == 5) {
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 6;
    } 
    else card = 5;
  } 
  else if (card == 6) {
    card = 0;
  }
}



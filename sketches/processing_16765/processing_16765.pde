
int card = 0;  
PImage img1,  nightsky1,startrail_fireflyvi09;
PFont f;
PShape f1, f2, catcher;
float angle = 0.0;

void setup() {
  size(600,600);
  smooth();
  img1 = loadImage("green.jpg");
  nightsky1 = loadImage("nightsky1.jpg");
  f1= loadShape("bi.svg"); 
  f2= loadShape("gunner.svg");
  catcher = loadShape("catch.svg");
  startrail_fireflyvi09 = loadImage("startrail_fireflyvi09.jpg");
  f= loadFont("Garamond-Italic-48.vlw");
  textFont(f);
}

void draw() {
  background(0);
  smooth();

  if (card == 0) {  
    background(0);  
    image(img1,0,0,width,height);
    fill(254,255,0);
    stroke(300);
    text("Finally i came to be a photuris! now i can make lots of friends!",
    80,360, width/2.1, height*2);
    translate(mouseX,mouseY); 
    rotate(angle);  
    photuris1(280,20, 1, 255, 255 );
    angle += 0.5;
    frameRate(5);
  }

  else if (card == 1) {
    image(nightsky1,0,0,width,height);
    shape(f1,0,5,width,height*1.5);
    text("Chirp, Chirp, Chirp, Chirp"  
      ,320,450, width/2, height);
  }


  else if (card == 2) {
    fill(255);  
    text("There are beautiful birds! what should i do?",
    160,190,width/2,height/2);
    if((mouseX > 70) && (mouseX < 220) && (mouseY > 400) && (mouseY < 420)) {  
      fill(255,255,0);
    }  
    else {  
      fill(245,176,199);
    }  
    text("Go closer",70,420);  
    if((mouseX > 300) && (mouseX < 480) && (mouseY > 400) && (mouseY < 430)) {  
      fill(0,255,30);
    }  
    else {  
      fill(0,0,255);
    }  
    text("Ignore them", 300,420);
  }


  else if (card == 3) {
    image(nightsky1,0,0,width,height);
    shape(f1,0,5,width/2,height/2);
    shape(f2,80,20,width*1.5,height*2);
    fill(255,0,0);
    text("Thanks to Photuris, i can see those birds clearly! hahahaha!!", 240,400,
    width/2, height/2);

    text("What the..!!!!",200,60,width/2);
    rotate(angle);  
    photuris1(150,-50, 1, 255, 255);
    angle += 1.5;
    frameRate(2);

    fill(255,255,0);
    text("Hello! b.......",
    80,300, width/4, height/2);
  }


  else if (card == 4) {
    fill(255,0,0);
    text("S,SORRY..........",
    160,280,width/2,height/2);

    if((mouseX > 450) && (mouseX < 500) && (mouseY > 390) && (mouseY < 500)) {  

      fill(255,255,0);
    }  
    else {  
      fill(245,176,199);
    }  

    text("Again",420,420);
  }


  else if (card == 5) {
    image(startrail_fireflyvi09,0,0,width,height);
    translate(mouseX,mouseY);
    rotate(angle);

    photuris(100,100, 1, 255, 133, 243 );  

    photuris(250,100, 2, 50, 0, 154);  

    photuris(250,280, 0.5, 160, 255, 75);  

    photuris(100,210, 0.1, 70, 70, 98);  

    photuris(100,80,0.3, 100, 30, 255);  

    photuris(280,60, 0.2, 160, 156, 0);  

    angle += 0.5;
  }


  else if (card == 6) {
    fill(255);  
    text("Wow, they really look like me! what should i do?",
    160,190,width/2,height/2);
    if((mouseX > 80) && (mouseX < 230) && (mouseY > 410) && (mouseY < 430)) {  
      fill(255,255,0);
    }  
    else {  
      fill(245,176,199);
    }  
    text("Fly with them",70,420);  
    if((mouseX > 310) && (mouseX < 490) && (mouseY > 410) && (mouseY < 440)) {  
      fill(0,255,30);
    }  
    else {  
      fill(0,0,255);
    }  
    text("Say come here", 300,420);
  }


  else if (card == 7) {
    smooth();
    fill(255,0,0);
    text("It's photuris! let's catch it!!",
    160,150,width/2,height/2);
    shape(catcher, 120,150,width,height);
  }


  else if (card == 8) {
    fill(255,0,0);
    text("Oh, gosh..........",
    160,280,width/2,height/2);
    if((mouseX > 450) && (mouseX < 500) && (mouseY > 390) && (mouseY < 500)) {  
      fill(255,255,0);
    }  
    else {  
      fill(245,176,199);
    }  
    text("Again",420,420);
  }


  else if (card == 9) {
    fill(255,255,0);
    text("Watch that guys with butterfly net!!",
    160,150,width/2,height/2);
    fill(0,255,255);
    text("Oh, you saved our life!! how kind of you!",
    160,300,width/2,height/2);
  }

  else if (card == 10) {
    image(startrail_fireflyvi09,0,0,width,height);
    text("Let's fly together!!", 260,20,
    width/2, height);
    translate(mouseX,mouseY);
    rotate(angle);

    photuris(100,100, 1, 255, 133, 243 );  

    photuris(250,100, 2, 50, 0, 154);  

    photuris(250,280, 0.5, 160, 255, 75);  

    photuris(100,210, 0.1, 70, 70, 98);  

    photuris(100,80,0.3, 100, 30, 255);  

    photuris(280,60, 0.2, 160, 156, 0);  

    angle += 0.5;
  }
}

void mousePressed() {    



  if (card == 0) { 
    card = 1;
  }     

  else if (card == 1) {
    card = 2;
  }  

  if (card == 2) {  

    if((mouseX > 70) && (mouseX < 220) && (mouseY > 400) && (mouseY < 420)) {
      card = 3;
    }
    else if((mouseX > 300) && (mouseX < 480) && (mouseY > 400) && (mouseY < 430)) {

      card = 5;
    }
  }

  else if (card == 3) {
    card =4;
  }

  else if (card ==4) {
    card =2;
  }

  else if(card==5) {
    card=6;
  }


  if (card == 6) {  



    if((mouseX > 70) && (mouseX < 220) && (mouseY > 400) && (mouseY < 420)) {

      card = 7;
    }

    else if((mouseX > 300) && (mouseX < 480) && (mouseY > 400) && (mouseY < 430)) {

      card = 9;
    }
  }

  else if(card==7) {
    card=8;
  }

  else if(card==8) {
    card=6;
  }

  else if (card ==9) {
    card=10;
  }

  else if (card==10) {
    card =0;
  }
}








void photuris1(int x, int y, float s, int t, int w) {  
  pushMatrix();  
  noStroke();  
  translate(x,y);  
  scale(s);  
  smooth();  
  //wings  
  fill(w);  
  ellipse(150,210,200,60);  
  ellipse(50,210,200,60);  
  ellipse(130,250,140,20);  
  ellipse(50,250,140,20);  
  //body  
  fill(116,61,16);  
  ellipse(100,210,80,160);  
  //eyes  
  fill(201,223,234);  
  ellipse(80,130,80,80);  
  ellipse(120,130,80,80);  
  fill(0);  
  ellipse(80,140,40,40);  
  ellipse(120,140,40,40);  
  //tail  
  fill(t,255,0);  
  ellipse(100,300,40,40);  
  popMatrix();
}

void photuris(int x, int y, float s, int t, int w,int v) {  
  pushMatrix();  
  noStroke();  
  translate(x,y);  
  scale(s);  
  smooth();  
  //wings  
  fill(w,v,252);  
  ellipse(150,210,180,40);  
  ellipse(50,210,180,40);  
  ellipse(130,240,140,20);  
  ellipse(50,240,140,20);  
  //body  
  fill(137,89,62);  
  ellipse(100,210,80,160);  
  //eyes  
  fill(201,223,234);  
  ellipse(80,130,80,80);  
  ellipse(120,130,80,80);  
  fill(0);  
  ellipse(80,140,40,40);  
  ellipse(120,140,40,40);  
  //tail  
  fill(t,255,0);  
  ellipse(100,300,40,40);  
  popMatrix();
} 








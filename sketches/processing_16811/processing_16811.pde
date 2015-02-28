
int card = 0;
int a = 0;
//int k = int(random(4,5));
//int l = int(random(7,8));


PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11;
PShape shp;
PFont f;

void setup(){
size(450,300);
f = loadFont("YDSSH-30.vlw");
textFont(f);
img10 = loadImage("start.jpg");
img1 = loadImage("1.jpg");
img2 = loadImage("1_1.png");
img3 = loadImage("2.jpg");
img4 = loadImage("3.jpg");
img5 = loadImage("5_2.png");
img6 = loadImage("7.png");
img7 = loadImage("6.jpg");
img8 = loadImage("8.jpg");
img9 = loadImage("9.jpg");
img11 = loadImage("11.png");
shp = loadShape("5.svg");
}

void draw(){
  
  if(card == 0){
    image(img10,0,0,450,300);
    text("Dream of Cup",140,210);
  }
  
  if(card == 1){
  background(255);
image(img1,0,0);
pushMatrix();
stroke(0);
rotate(PI/-3.0);
cup(-45,170,1);
popMatrix();
image(img2,0,0);
stroke(255);
strokeWeight(2);
line(350,250,370,290);
line(9,245,19,260);
line(25,230,50,280);
line(40,240,60,279);
line(64,260,80,298);
line(79,236,90,280);
line(110,220,125,280);
line(150,226,175,290);
line(190,250,208,282);
line(223,205,240,260);
line(250,205,270,290);
line(287,220,300,275);
line(323,268,340,289);
line(390,240,420,285);
 }
 
 if(card == 2){
 background(255);
 smooth();
 frameRate(50);
  image(img3,0,a--);
  if( a < -300) {
    a = 0;
  }
  pushMatrix();
  rotate(PI/5.0);
  cup(250,-80,0.7);
  popMatrix();
  text("the cup falling down...down..",20,45);
 }


if(card == 3){
image(img4,0,0);
pushMatrix();
strokeWeight(2);
cup(150,20,0.7);
popMatrix();
fill(255);
textSize(20);
text("sad ending",20,210);
text("which do you want?",115,35);
fill(0);
text("happy ending",300,210);
ellipseMode(CENTER);
noStroke();
fill(#F3FF50);
ellipse(70,240,50,50);
ellipse(370,240,50,50);
stroke(0);
line(52,230,57,240);
line(57,240,62,230);
line(75,230,80,240);
line(80,240,85,230);
line(350,240,355,230);
line(355,230,360,240);
line(375,240,380,230);
line(380,230,385,240);
}

if(card == 4){
image(img6,0,0);
strokeWeight(2);
stroke(0);
ellipseMode(CENTER);
line(0,230,450,220);
fill(255);
ellipse(100,207,50,40);
ellipse(190,107,70,70);
ellipse(340,130,50,50);
line(40,20,85,110);
line(316,200,389,180);
stroke(255);
textSize(30);
text("the cup was broken......",30,280);
}

if(card == 5){
smooth();
background(255);
image(img8,0,0);
pushMatrix();
rotate(PI/1.2);
strokeWeight(2);
cup(-190,-250,0.5);
popMatrix();
ellipse(198,101,30,30);
ellipse(235,82,30,30);
fill(0);
ellipse(200,100,8,8);
ellipse(236,80,8,8);
fill(255);
text("OMG!!!somebody help me!!",30,240);
}

if(card == 6){
  background(255);
  smooth();
  frameRate(50);
  image(img9,0,a--);
  if( a < - 600){
    a=0;
  }
  cup(140,20,0.8);
  fill(0);
  textSize(30);
  text("bye bye...;-(",40,30);
  textSize(20);
  text("choice again",290,295);
  fill(#F3FF50);
  noStroke();
  rect(410,260,40,40);
}

if(card == 7){
 background(255);
  smooth();
  stroke(255);
  fill(201,255,247);
  pushMatrix();
  frameRate(2.5);
  ellipse(random(450),random(100,300),10,10);
  ellipse(random(450),random(100,300),20,20);
  ellipse(random(450),random(100,300),45,45);
  ellipse(random(450),random(100,300),40,40);
  ellipse(random(450),random(100,300),50,50);
  ellipse(random(450),random(100,300),30,30);
  ellipse(random(450),random(100,300),15,15);
  ellipse(random(450),random(100,300),80,80);
  ellipse(random(450),random(100,300),25,25);
  ellipse(random(450),random(100,300),60,60);
  ellipse(random(450),random(80,300),62,62);
  ellipse(random(450),random(80,300),53,53);
  ellipse(random(450),random(80,300),20,20);
  popMatrix();
  stroke(0);
  cup(150,50,0.7);
  cup(20,40,0.2);
  cup(270,180,0.3);
  cup(370,90,0.4);
  cup(90,150,0.27);
  textSize(20);
  fill(0);
  text("the cup arrived NEW WORLD!!",80,30);
  text("there's lot a freinds!!<3",95,50); 
}

if(card ==8){
background(255);
    smooth();
    image(img5,0,0);
    shape(shp,168,60);
    pushMatrix();
    rotate(PI/5.0);
    cup(250,0,0.5);
    popMatrix();
    fill(183,255,251);
    stroke(165,227,255);
    ellipse(200,50,50,60);
    ellipse(160,80,30,30);
    ellipse(300,100,70,67);
    ellipse(240,150,20,20);
    ellipse(180,120,30,50);
    ellipse(250,40,40,40);
    ellipse(340,60,35,35);
    ellipse(330,150,30,32);
    textSize(20);
    fill(0);
    text("the cup traveled all over the sky",10,250);
    image(img11,42,-17);
}

if(card == 9){
background(255);
image(img7,0,0);
fill(0);
textSize(27);
text("cup lived happily ever after:-)",20,30);
strokeWeight(3);
cup(150,30,0.85);
line(180,130,195,115);
line(195,115,210,130);
line(240,130,255,115);
line(255,115,270,130);
textSize(20);
  text("choice again",290,295);
  fill(#F3FF50);
  noStroke();
  rect(410,260,40,40);
}

}

void mousePressed(){

  if(card == 0 ){
  card = 1;
  }
  
  else if(card == 1){
  card = 2;
  }
  
  else if(card == 2){
  card = 3;
  }
 
 //need modify
 
 else if(card == 3){
  float d = dist(mouseX,mouseY,70,240);
   if(d<50){
    card = int(random(4,5));
   }
  float t = dist(mouseX,mouseY,370,240);
   if(t<50){
    card = int(random(7,8));
   } 
 }
 
 else if(card == 4){
 card = 6;
 }
  
 else if(card == 5){
 card = 6;
 }
  
  else if(card == 6){
   if((mouseX > 410)&&(mouseY > 260)){
     card = 3;}
  }
  
  else if(card == 7){
  card = 9;
  }
  
  else if(card == 8){
  card = 9;
  }
  
  else if(card == 9){
   if((mouseX > 410)&&(mouseY > 260)){
   card = 3;
   }
  }
  
}


void cup(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  stroke(1);
  noFill();
  ellipseMode(CENTER);
  ellipse(95,60,150,50);
  ellipse(95,60,142,42);
  noFill();
  arc(95,250,80,50,0,PI);
  line(20,60,55,250);
  line(170,60,135,250);
  popMatrix();
}



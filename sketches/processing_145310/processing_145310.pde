
//Cara Homer
float x;
float y;
float xperson;
float yperson;
float v= random(-8,6);
float vy= random(-8,4);
int mida= 20;

//Rosquilla gran
float x1;
float y1;
float v1= random(-8,6);
float vy1= random(-8,6);
float color1= random (255);
float color2= random (255);
float color3= random (255);


void setup() {
  size(700, 700);
  rectMode(CENTER);
  x=width/2;
  y=height/2;
  x1=width/2;
  y1=height/2;
  noCursor();  
}

void draw(){
  
  fons();
  dibuix1();
  dibuix2();
  baba();
  dibuix3();
  velocitat();
  actualitzaPosicio();
  limits();

}

void fons() {
  background((95), (229), (242));
  fill(0,10);
  noStroke();
  rect(width/2,height/2,width,height);

  
   //rosquilles
  fill(232,124,221);
  stroke(232,124,221);
  ellipse(150,100,100,100);
  ellipse(350,100,100,100);
  ellipse(550,100,100,100);
  
  ellipse(150,550,100,100);
  ellipse(350,550,100,100);
  ellipse(550,550,100,100);
  
fill(95,229,242);
  ellipse(150,100,40,40);
  ellipse(350,100,40,40);
  ellipse(550,100,40,40);
  
  ellipse(150,550,40,40);
  ellipse(350,550,40,40);
  ellipse(550,550,40,40);
 
 //sucre
  stroke(252,241,15);
  strokeWeight(5);
  line(120,80,123,83);
   line(320,120,323,123);
   line(523,110,520,113);
   
   line(130,530,133,533);
   line(323,530,320,533);
   line(540,583,543,580);
   //
   stroke(42,252,15);
   line(113,115,110,118);
   line(343,70,340,73);
   line(550,130,553,133);
   
   line(163,580,160,583);
   line(355,580,358,583);
   line(550,520,553,523);
   //
   stroke(255,255,255);
   line(173,125,170,128);
   line(380,100,383,103);
   line(580,100,583,103);
   
   line(180,550,183,553);
   line(385,550,388,553);
   line(588,565,585,568);
   //
   stroke(255,0,4);
   line(185,100,188,103);
   line(363,135,360,138);
   line(550,65,553,68);
   
   line(163,515,160,518);
   line(323,565,326,568);
   line(518,550,521,553);
   //
   stroke(110,141,252);
   line(163,70,160,73);
   line(372,65,375,68);
   line(523,76,520,79);
   
   line(133,570,130,573);
   line(370,520,373,523);
   line(585,532,588,535);
   //
   stroke(255,167,3);
   line(140,135,143,138);
   line(315,90,318,93);
   line(581,73,578,76);
   
   line(113,550,110,553);
   line(348,510,345,513);
   line(523,520,520,523);
   //
 
 fill(random(255),random(0),0);  
strokeWeight(22);
textSize(45);
textAlign(CENTER);
text("The Simpsons", width/2, height/2);
textSize(30);
fill(color1,color2, color3);
strokeWeight(32);
text("Homer", width/2+100, height/2+30);
}

void mousePressed(){
 x=mouseX;
 y=mouseY;

 v=random(-5,5);
 vy=random(-5,5);
 
 v1=random(-8,8);
 vy1=random(-8,8);
 
 color1=random (255);
 color2= random (255);
 color3= random (255);
  
 
}


//Rosquilla Gran
void dibuix1(){
  fill(232,124,221);
  stroke(232,124,221);
  ellipse(x1+180,y1+180,160,160);

  fill(95,229,242);
  stroke(95,229,242);
  ellipse(x1+180,y1+180,40,40);
  
  stroke(252,241+x1,15+x1/2);
  strokeWeight(10);
  line(x1+150,y1+110,x1+140,y1+120);
  stroke(42,252-x/4,15+x/4);
  line(x1+180,y1+250,x1+170,y1+240);
  stroke(255-x1/5,0,4+x1/5);
  line(x1+250,y1+200,x1+240,y1+210);
  stroke(110+x1/3,141,252-x1/5);
  line(x1+120,y1+160,x1+110,y1+170);
  stroke(255-x1/2,255,255-x1/4);
  line(x1+230,y1+140,x1+220,y1+130);
  stroke(255-x1/4,167+x1/4,3+x1/2);
  line(x1+120,y1+220,x1+110,y1+210);
}


//Homer
void dibuix2 () {
noFill();
  stroke(0);
  strokeWeight(1.5);
  ellipse(x, y-70, 75, 75);
  ellipse(x, y-70, 60, 60);

  //front
  stroke(247, 225, 20);
  strokeWeight(2);
  fill(247, 225, 20);
  ellipse(x, y-10, 180, 160);

  //cara
  rect(x, y+50, 180, 130);

  //parpelles
  ellipse(x-72, y+39, 50, 50);
  ellipse(x+72, y+39, 50, 50);

  //orelles
  stroke(247, 225, 20);
  ellipse(x-80, y+130, 50, 40);
  ellipse(x+80, y+130, 50, 40);
  rect(x, y+120, 180, 130);

  //ulls
  fill(255, 255, 255);
  stroke(0, 0, 0);
  strokeWeight(1.6);
  ellipse(x-50, y+75, 90, 90);
  ellipse(x+50, y+75, 90, 90);

  //pupil·les
  noStroke();
  fill(color1,color2,color3);
  ellipse(x-58,y+75,15,15);
  ellipse(x-46, y+75, 15, 15);
  ellipse(x+58,y+75,15,15);
  ellipse(x+46, y+75, 15, 15);
  
  triangle(x-63,y+80,x-41,y+80,x-52,y+86);
  triangle(x+63,y+80,x+41,y+80,x+52,y+86);
  

  //barba
  stroke(134, 90, 7);
  strokeWeight(2.5);
  fill(178, 138, 63);
  ellipse(x, y+185, 180, 130);

  //nas
  stroke(0, 0, 0);
  strokeWeight(1.5);
  fill(247, 225, 20);
  ellipse(x, y+110, 40, 40);
  stroke(247, 225, 20);
  rect(x, y+90, 10, 6);

  //boca
  fill(255, 255, 255);
  stroke(255, 255, 255);
  stroke(134, 90, 7);
  ellipse(x, y+192, 130, 70);



  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(x, y+165, 160, 57);

  rect(x-62, y+200, 16, 40);
  rect(x+62, y+200, 20, 40);



  stroke(0, 0, 0);
  fill(255, 255, 255);
  stroke(255, 255, 255);



  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(x-64, y+188, 40, 5);
  ellipse(x+64, y+188, 40, 5);
  
  
  ellipse(x-60, y+180, 15, 18);
  ellipse(x+60, y+180, 15, 18);
  
  
  fill(255, 255, 255);
  stroke(255, 255, 255);
  ellipse(x-46, y+202, 22, 22);
  ellipse(x+44, y+203, 22, 22);
  
  fill(178, 138, 63);
  stroke(178, 138, 63);
   ellipse(x-53.3, y+184, 15, 15);
  ellipse(x+53.3, y+185.2, 15, 15);
  

 ellipse(x+43, y+182.8, 15, 15);
 
 //dents
stroke(0, 0, 0);
strokeWeight(1.5);
line(x-44, y+190, x-44, y+217.5);
line(x+42, y+191, x+42, y+217);
line(x+16, y+193, x+16, y+225);
line(x-16,y+193, x-16, y+225);

//orelles per dins
stroke(0, 0, 0);
noFill();
ellipse(x+90, y+130, 20, 20);
ellipse(x-90, y+130, 20, 20);

fill(247, 225, 20);
stroke(247, 225, 20);
rect(x-85,y+130,12,22);
rect(x+85,y+130,12,22);
rect(x+96, y+137, 12, 6);
rect(x-96, y+137, 12, 6);

stroke(0, 0, 0);
noFill();
line(x-97, y+125, x-90, y+130);
line(x+97, y+125, x+90, y+130);

fill(255,5,5);

}


//baba
void baba(){
  if (x>=width/2-250 && v>0) {
  fill(255,255,255);
  noStroke();
  ellipse(x+58,y+210,14,24);
  ellipse(x+52,y+199,22,22);
  ellipse(x-52,y+198,22,22);
  
  ellipse(x+58,y+240,14,14);
  triangle(x+50,y+240,x+66,y+240,x+58,y+224);
  
  stroke(0, 0, 0);
strokeWeight(1.5);
line(x-44, y+190, x-44, y+217.5);
line(x+42, y+191, x+42, y+217);
line(x+16, y+193, x+16, y+225);
line(x-16,y+193, x-16, y+225);
  }
  
if (y<=width/2+250 && v>0) {
fill(255,0,0);
noStroke();
ellipse(x+60,y+130,50,20);
ellipse(x-60,y+130,50,20);
  }
 
if (y<=width+200 && v>0) {
fill(247, 225, 20);
stroke(0);
arc(x-50,y+68,90,90,PI,TWO_PI);
arc(x+50,y+68,90,90,PI,TWO_PI);
 }
}
  
//Cervesa
void dibuix3(){
  
  if(mouseX < width/3){
  fill(90, 52, 13);
  noStroke();
  rect(mouseX,mouseY+40,80,140);
  fill(90, 52, 13);
  noStroke();
  rect(mouseX,mouseY-20,30,200);
  triangle(mouseX-40,mouseY-30,mouseX,mouseY-30,mouseX,mouseY-70);
  triangle(mouseX+40,mouseY-30,mouseX,mouseY-30,mouseX,mouseY-70);
  fill(255,0,0);
  noStroke();
  rect(mouseX,mouseY+40,80,100);
  rect(mouseX,mouseY-90,30,40);
  stroke(0,0,0);
  fill(255,255,255);
  rect(mouseX,mouseY+40,70,40);
   textSize(30);
  fill(0,0,0);
  strokeWeight(18);
  text("Duff", mouseX,mouseY+50);
  textSize(16);
  strokeWeight(10);
  text("B E E R", mouseX,mouseY+80);
  fill(255,255,255);
  strokeWeight(1);
  rect(mouseX,mouseY-90,24,16);
  fill(0,0,0);
  textSize(10);
  text("Duff", mouseX,mouseY-85);
  fill(144,97,7);
  noStroke();
  rect(mouseX,mouseY-122,32,6);
  fill(90, 52, 13);
  noStroke();
  ellipse(mouseX-9,mouseY-116,11,11);
  ellipse(mouseX,mouseY-116,11,11);
  ellipse(mouseX+9,mouseY-116,11,11);
  fill(color1,color2,color3);
  textSize(20);
  text("I am", mouseX,mouseY+13);
  
  
  } else if (mouseX < (width/3)*2){
    fill(90, 52, 13);
  noStroke();
  rect(mouseX,mouseY+40,80,140);
  fill(90, 52, 13);
  noStroke();
  rect(mouseX,mouseY-20,30,200);
  triangle(mouseX-40,mouseY-30,mouseX,mouseY-30,mouseX,mouseY-70);
  triangle(mouseX+40,mouseY-30,mouseX,mouseY-30,mouseX,mouseY-70);
  fill(255,0,0);
  noStroke();
  rect(mouseX,mouseY+40,80,100);
  rect(mouseX,mouseY-90,30,40);
  stroke(0,0,0);
  fill(255,255,255);
  rect(mouseX,mouseY+40,70,40);
   textSize(30);
  fill(0,0,0);
  strokeWeight(18);
  text("Duff", mouseX,mouseY+50);
  textSize(16);
  strokeWeight(10);
  text("B E E R", mouseX,mouseY+80);
  fill(255,255,255);
  strokeWeight(1);
  rect(mouseX,mouseY-90,24,16);
  fill(0,0,0);
  textSize(10);
  text("Duff", mouseX,mouseY-85);
  fill(144,97,7);
  noStroke();
  rect(mouseX,mouseY-122,32,6);
  fill(90, 52, 13);
  noStroke();
  ellipse(mouseX-9,mouseY-116,11,11);
  ellipse(mouseX,mouseY-116,11,11);
  ellipse(mouseX+9,mouseY-116,11,11);
  fill(255,191,72);
  textSize(20);
  text("Homer's", mouseX,mouseY+12);
  
  
  }else{
    fill(90, 52, 13);
  noStroke();
  rect(mouseX,mouseY+40,80,140);
  fill(90, 52, 13);
  noStroke();
  rect(mouseX,mouseY-20,30,200);
  triangle(mouseX-40,mouseY-30,mouseX,mouseY-30,mouseX,mouseY-70);
  triangle(mouseX+40,mouseY-30,mouseX,mouseY-30,mouseX,mouseY-70);
  fill(255,0,0);
  noStroke();
  rect(mouseX,mouseY+40,80,100);
  rect(mouseX,mouseY-90,30,40);
  stroke(0,0,0);
  fill(255,255,255);
  rect(mouseX,mouseY+40,70,40);
   textSize(30);
  fill(random(255),random(255),random(255));
  strokeWeight(18);
  text("Duff", mouseX,mouseY+50);
  textSize(16);
  strokeWeight(10);
  text("B E E R", mouseX,mouseY+80);
  fill(255,255,255);
  strokeWeight(1);
  rect(mouseX,mouseY-90,24,16);
  fill(0,0,0);
  textSize(10);
  text("Duff", mouseX,mouseY-85);
  fill(144,97,7);
  noStroke();
  rect(mouseX,mouseY-122,32,6);
  fill(90, 52, 13);
  noStroke();
  ellipse(mouseX-9,mouseY-116,11,11);
  ellipse(mouseX,mouseY-116,11,11);
  ellipse(mouseX+9,mouseY-116,11,11);
  fill(color1,color3,color2);
  textSize(20);
  text("DESIRE!", mouseX,mouseY+13);
  }
}
  
void velocitat(){
x=x+v;
y=y+vy;

x1=x1+v1*2;
y1=y1+vy1;

}


   void actualitzaPosicio(){
  float r=random(-5,5);
  if(r<40){
    x=x+v/35; 
    x1=x1+v1/30;
   
  }else if (r<60){
   x=x-v/35;
   x1=x1-v1/30;
 
  }else if (r<80){
    y=y-v/35;
    y1=y1-v1/25;
    
  }else{
    y=y+v/35;
    y1=y1+v1/55;
    
  }
  }  
  
  
  
void limits(){
  if(x+100>width||x-100<0){
    v=-v;
  }
   if(y+250>height||y-100<0){
    vy=-vy;
   }
   
   
   if(x1+282>width||x1+88<0){
    v1=-v1;
  }
   if(y1+280>height||y1+88<0){
    vy1=-vy1;
   }
}
  
  





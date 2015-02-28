
//variables
float posX, posY, velX, velY, velB, velE;
float colorB,color1,color2,color3;
float posXb, posYb, posYc;
float RbutX, RbutY;
float posB;
float exp, act1,act2;
float diana;

//matrixes
float[] posXc = new float[10];
float[] posYd = new float[10];
float[] velXc = new float[10];
float[] velYc = new float[10];


void setup(){
  size(800,700);
  
  //valores variables
  posX = width/2;
  posY = height/2;
  velX = 4;
  velY = 4;
  velB = 20;
  posYb = 0;
  colorB = 0;
  exp = 0;
  velE = 0;
  color1=255;
  color2=255;
  color3=255;
  act1=0;
  act2=act1-10;
  
  //valores matrixes
  for (int h=0; h < 10; h++) {
   
    posXc[h] = random(3*width);
    posYd[h] = random(3*height);
    velXc[h] = random(3,7);
    velYc[h] = random(3,7);
  }
}
 
void draw(){
   background (#97BDE5);
   
   //fondo nubes
   
   for (int i=0; i<800; i+= 100) for (int j=0; j<700; j+= 100){
     fill(255,255,255,i/2);
  float posV = i+50;
  float posC = j+50;
  float nub = i/6;
  ellipse(posV, posC, nub, nub);
   }
  for (int i=0; i<800; i+= 100) for (int j=0; j<700; j+= 200){
     fill(7,89,219,i/2);
  float posV = i+50;
  float posC = j+50;
  float nub = i/6;
  ellipse(posV, posC, nub, nub);
}
 for (int i=0; i<800; i+= 100) for (int j=0; j<700; j+= 100){
     fill(255,255,255,i/2);
  float posV = i+50;
  float posC = j+50;
  float nub = j/6;
  ellipse(posV, posC, nub, nub);
   }
  for (int i=0; i<800; i+= 100) for (int j=0; j<700; j+= 200){
     fill(7,89,219,i/2);
  float posV = i+50;
  float posC = j+50;
  float nub = j/5;
  ellipse(posV, posC, nub, nub);
}
for (int i=0; i<100; i+= 1) {
  stroke(7,89,219,100-i);
  line(i,0,i,height);
}



  //Posición
  posX = posX+velX;
  posY = posY+velY;
  //Posición bomba
  posXb = posX+velB;
  posYb = posYb+velB;
  exp = exp+velE;
  
  
  //avions
  scale (0.3);
    for (int h=0; h < 10; h++) {
  //posicion matrixes
  posXc[h] = posXc[h] + velXc[h];
    posYd[h] = posYd[h] + velYc[h];
    //condiciones matrixes
  if ( posXc[h] >width*4) {
      posXc[h] = posXc[h]-3500;
    }
     if (posYd[h] < 0+50 || posYd[h] > height*3+150) {
      velYc[h] = -velYc[h];
    }
    

//Avión(los grises)
 float centreX = -280;
  float centrey = -205;
   
 
  
  
   
  //helix 1
fill (#BC1114);
ellipse (posXc[h]+centreX+65,posYd[h]+centrey+202,20,95);
ellipse (posXc[h]+centreX+65,posYd[h]+centrey+202,60,40);
  
 //Roda 
strokeWeight (5);
stroke (1);
line (posXc[h]+centreX+100,posYd[h]+centrey+230,posXc[h]+centreX+150,posYd[h]+centrey+300);
line (posXc[h]+centreX+200,posYd[h]+centrey+230,posXc[h]+centreX+150,posYd[h]+centrey+300);
fill (#676565);
ellipse (posXc[h]+centreX+150,posYd[h]+centrey+300,60,60);
ellipse (posXc[h]+centreX+150,posYd[h]+centrey+300,50,50);
noStroke ();
fill (#157495);
ellipse (posXc[h]+centreX+120,posYd[h]+centrey+155,100,50);

  
  
  
  
 //cos avio
  
fill (#8B8B8B);
triangle (posXc[h]+centreX+263,posYd[h]+centrey+155,posXc[h]+centreX+263,posYd[h]+centrey+250,posXc[h]+centreX+560,posYd[h]+centrey+250);
triangle (posXc[h]+centreX+263,posYd[h]+centrey+155,posXc[h]+centreX+263,posYd[h]+centrey+243,posXc[h]+centreX+560,posYd[h]+centrey+210);
rect (posXc[h]+centreX+560,posYd[h]+centrey+210,-100,39);
rect (posXc[h]+centreX+263,posYd[h]+centrey+155,-200,95);
ellipse (posXc[h]+centreX+520,posYd[h]+centrey+210,100,180);
ellipse (posXc[h]+centreX+450,posYd[h]+centrey+210,200,60);
  
 
noCursor ();
  
 //diana
  
noStroke ();
fill (#F7F9FA);
ellipse (posXc[h]+centreX+280,posYd[h]+centrey+205,70,70);
fill (#0256D8);
ellipse (posXc[h]+centreX+280,posYd[h]+centrey+205,50,50);
fill (#D80209);
ellipse (posXc[h]+centreX+280,posYd[h]+centrey+205,30,30);
  
 //decoracio
noStroke ();
fill (#145F09);
ellipse (posXc[h]+centreX+150,posYd[h]+centrey+200,150,40);
  
  //ales
strokeWeight (5);
stroke (1);
stroke (#B96613);
line (posXc[h]+centreX+120,posYd[h]+centrey+230,posXc[h]+centreX+70,posYd[h]+centrey+100);
line (posXc[h]+centreX+250,posYd[h]+centrey+230,posXc[h]+centreX+200,posYd[h]+centrey+100);
line (posXc[h]+centreX+70,posYd[h]+centrey+156,posXc[h]+centreX+70,posYd[h]+centrey+100);
line (posXc[h]+centreX+200,posYd[h]+centrey+156,posXc[h]+centreX+200,posYd[h]+centrey+100);
noStroke ();
fill (#A05810);
ellipse (posXc[h]+centreX+190,posYd[h]+centrey+230,160,15);
ellipse (posXc[h]+centreX+150,posYd[h]+centrey+100,180,20);
fill (0);
ellipse (posXc[h]+centreX+525,posYd[h]+centrey+180,70,70);
fill (#016C25);
ellipse (posXc[h]+centreX+530,posYd[h]+centrey+180,52,72);
  
textSize(20);
fill(255);
text("666", posXc[h]+centreX+518, posYd[h]+centrey+185);
  
//helix 2
fill (#BC1114);
ellipse (posXc[h]+centreX+40,posYd[h]+centrey+160,10,120);
ellipse (posXc[h]+centreX+40,posYd[h]+centrey+240,10,120);

    }

    
   
  //Avión
 float centreX = -280;
  float centrey = -205;
   
  scale(2);
  
  //ametralladora
noStroke ();
fill (255,255,0);
for(int a=0; a > -1600; a-=50){
float velAm = posX-random (1600);
float velAn = posY;
ellipse (velAm,velAn,act1,act2);
}
   
  //helix 1
fill (#BC1114);
ellipse (posX+centreX+65,posY+centrey+202,20,95);
ellipse (posX+centreX+65,posY+centrey+202,60,40);
  
 //Roda 
strokeWeight (5);
stroke (1);
line (posX+centreX+100,posY+centrey+230,posX+centreX+150,posY+centrey+300);
line (posX+centreX+200,posY+centrey+230,posX+centreX+150,posY+centrey+300);
fill (#676565);
ellipse (posX+centreX+150,posY+centrey+300,60,60);
ellipse (posX+centreX+150,posY+centrey+300,50,50);
noStroke ();
fill (#157495);
ellipse (posX+centreX+120,posY+centrey+155,100,50);

  
  
  
  //bomba
  
  posB = posYc+centrey+205+posYb;
noStroke ();
fill (colorB,0,0);
ellipse (RbutX+centreX+280,posB,70+exp,70+exp);
  
  
 //cos avio
  
fill (#0EC402);
triangle (posX+centreX+263,posY+centrey+155,posX+centreX+263,posY+centrey+250,posX+centreX+560,posY+centrey+250);
triangle (posX+centreX+263,posY+centrey+155,posX+centreX+263,posY+centrey+243,posX+centreX+560,posY+centrey+210);
rect (posX+centreX+560,posY+centrey+210,-100,39);
rect (posX+centreX+263,posY+centrey+155,-200,95);
ellipse (posX+centreX+520,posY+centrey+210,100,180);
ellipse (posX+centreX+450,posY+centrey+210,200,60);
  
 
noCursor ();
  
 //diana
  
noStroke ();
fill (#F7F9FA);
ellipse (posX+centreX+280,posY+centrey+205,70,70);
fill (#0256D8);
ellipse (posX+centreX+280,posY+centrey+205,50,50);
fill (#D80209);
ellipse (posX+centreX+280,posY+centrey+205,30,30);
  
 //decoracio
noStroke ();
fill (#145F09);
ellipse (posX+centreX+150,posY+centrey+200,150,40);
  
  //ales
strokeWeight (5);
stroke (1);
stroke (#B96613);
line (posX+centreX+120,posY+centrey+230,posX+centreX+70,posY+centrey+100);
line (posX+centreX+250,posY+centrey+230,posX+centreX+200,posY+centrey+100);
line (posX+centreX+70,posY+centrey+156,posX+centreX+70,posY+centrey+100);
line (posX+centreX+200,posY+centrey+156,posX+centreX+200,posY+centrey+100);
noStroke ();
fill (#A05810);
ellipse (posX+centreX+190,posY+centrey+230,160,15);
ellipse (posX+centreX+150,posY+centrey+100,180,20);
fill (0);
ellipse (posX+centreX+525,posY+centrey+180,70,70);
fill (#016C25);
ellipse (posX+centreX+530,posY+centrey+180,52,72);
  
textSize(20);
fill(255);
text("20", posX+centreX+518, posY+centrey+185);
  
//helix 2
fill (#BC1114);
ellipse (posX+centreX+40,posY+centrey+160,10,120);
ellipse (posX+centreX+40,posY+centrey+240,10,120);




 
 
  //condición X (pos+color)
  if((posX<240)||(posX>2*width-520)){
    velX = -velX;
  }
   if((posX<0)||(posX>width)){
    color1 = -255;
  }
   if((posX<width)||(posX>2*width)){
    color1 = 0;
  }
    //Condición Y (pos+color)
  if((posY<110)||(posY>2*height-330)){
    velY = -velY;
  
  }
    //Condición B
  if((posB>1200)){
    velB = 0;
    
  }
  //Condición C
  if((velB==0)){
    colorB = 255;
    velE = 4;
  }
  //Condición D
  if((exp>=100)||posB<=1200){
     
    velE = 0;
  }
 
  
}
void mousePressed() {
  if (RbutX == posX) {
    RbutX = posX;
  } else {
    RbutX = posX;
  }
  if (posYb == posYb) {
    posYb = 0;
  } else {
    posYb = posYb;
  }
  if (posYc == posY) {
    posYc = posY;
  } else {
    posYc = posY;
  }
  if (velB == 20) {
    velB = 20;
  } else {
    velB = 20;
  }
  if (colorB == 0) {
    colorB = 0;
  } else {
    colorB = 0;
  }
  if (exp == 0) {
    exp = 0;
  } else {
    exp = 0;
  }
 
}
void keyPressed() {
   if (act1 == 20) {
    act1 = 0;
  } else {
    act1 = 20;
  }
}




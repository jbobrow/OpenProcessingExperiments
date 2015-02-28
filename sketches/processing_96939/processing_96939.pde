

float posX, posY, velX, velY, velB, velE;
float colorB,color1,color2,color3;
float posXb, posYb, posYc;
float RbutX, RbutY;
float posB;
float exp;
float diana;
void setup(){
  size(800,700);
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
  diana = ellipse;
}

void draw(){
   background (#97BDE5);
  
  //Posición
  posX = posX+velX;
  posY = posY+velY;
  //Posición bomba
  posXb = posX+velB;
  posYb = posYb+velB;
  exp = exp+velE;
  
  //Avión
 float centreX = -280;
  float centrey = -205;
  
  scale(0.5);
  
  //helix 1
fill (#BC1114);
ellipse (posX+centreX+65,posY+centrey+202,20,95);
ellipse (posX+centreX+65,posY+centrey+202,60,40);
 
 
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
fill (#97BDE5);
ellipse (posX+centreX+155,posY+centrey+155,100,100);
 
 
 
  //bomba
 
  posB = posYc+centrey+205+posYb;
noStroke ();
fill (colorB,0,0);
ellipse (RbutX+centreX+280,posB,70+exp,70+exp);
 
 
 //cos avio
 
fill (color3+255,color1+255,color2+255);
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
diana (posX+centreX+280,posY+centrey+205,30,30);
 
noStroke ();
fill (#145F09);
ellipse (posX+centreX+150,posY+centrey+200,150,40);
 
 
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
fill (#97BDE5);
ellipse (posX+centreX+150,posY+centrey+155,90,20);
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
  if((posX<240)||(posX>2*width-288)){
    velX = -velX;
  } 
   if((posX<0)||(posX>width)){
    color1 = -255;
  } 
   if((posX<width)||(posX>2*width)){
    color1 = 0;
  } 
    //Condición Y (pos+color)
  if((posY<110)||(posY>2*height-118)){
    velY = -velY;
  } 
   if((posX<0)||(posX>height)){
    color3 = -255;
  } 
   if((posX<height)||(posX>2*height)){
    color3 = 0;
  } 
    //Condición B
  if((posB>2*height)){
    velB = 0;
   
  } 
  //Condición B
  if((velB==0)){
    colorB = 255;
    velE = 4;
  } 
  //Condición B
  if((exp>=100)){
    
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




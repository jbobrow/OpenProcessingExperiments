
//for foam:white
int yF=196;
int speedF=1;
//for wave:blue
int yW=200;
int speedW=1;
  
//for dotson appearing after mouseclick
boolean dotsonAppear = false;

void setup() {
 //default background:white
 size(1080,630);
 smooth();
}

void draw() {
  drawSky();
  drawSea();
  drawShore();
  drawWaves();
  drawDotson(mouseX,mouseY);
  drawParasole();
}

void drawSky() {
   background(0,200,155);
}

void drawSea() {
   noStroke();
   fill(8,150,190);
   rect(0,100,1080,650);
}

void drawShore() {
   fill (224,203,168);
   ellipse (100,570,2900,580);
}

void drawWaves() {
   //foam:white
   yF=yF+speedF;
   if ((yF<196)||(yF>310)) {
   speedF=speedF*-1;
   }
   fill(255,150);
   bezier(0,yF,360,310,720,380,1300,355);
   //wave:blue
   yW=yW+speedW;
   if ((yW<200)||(yW>314)){
   speedW=speedW*-1;
   }
   fill(8,150,190,200);
   triangle(0,yW,1300,196,1300,355);
}

void drawDotson(float dx, float dy) {
   if (dotsonAppear) {
   //make yellow face:
   noStroke();
   smooth();
   fill(244,252,18);
   ellipse(mouseX,mouseY,40,40); //original size x=50 y= 50

   //make 1 50% opaque sensory organ (i.e. nose/ear/mouth/eyes)
   stroke(1,126,21);
   fill(255,127);
   ellipse(mouseX,mouseY, 10,10);

   //make front legs
   stroke(126,97,1);
   //vertical line of front leg:
   line(mouseX,mouseY+20, mouseX+1,mouseY+60);
   //front axis of front leg:
   line(mouseX+1,mouseY+60, mouseX-10,mouseY+70);
   //left paw of front axis:
   bezier(mouseX-10,mouseY+70, mouseX-15,mouseY+70, mouseX-15,mouseY+80,
   mouseX-10,mouseY+75);
   //back axis of front leg:
   line(mouseX+1,mouseY+60, pmouseX+10, pmouseY+70);
   //back paw of front axis:
   bezier(pmouseX+10,pmouseY+70,pmouseX+5,pmouseY+70,pmouseX+5,pmouseY
     +80,pmouseX+10,pmouseY+75);

   //body
   fill(244,252,18);
   noStroke();
   rect(mouseX+1,mouseY+24, 110, 27);

   //hind legs
   stroke(126,97,1);
   //vertical part of hind leg
   line(mouseX+110,mouseY+51, mouseX+111,mouseY+60);
   //front axis of hind legs with 50% opacity:
   line(mouseX+111,mouseY+60,mouseX+102,mouseY+70);
   fill(255, 127);
   bezier(mouseX+102,mouseY+70, mouseX+97,mouseY+70,mouseX+97,mouseY
     +80,mouseX+102,mouseY+75);
   //back axis of hind legs
   line(mouseX+111,mouseY+60,pmouseX+120,pmouseY+70);
   bezier(pmouseX+120,pmouseY+70, pmouseX+115,pmouseY+70, pmouseX+115,pmouseY
     +80, pmouseX+120,pmouseY+75);

   //tail
   noFill();
   bezier(mouseX+110,mouseY+24, pmouseX+120, pmouseY+24, pmouseX+120,
   pmouseY+14, pmouseX+110, pmouseY+4);
   }
}
void mousePressed() {
 dotsonAppear = true;
}
 
   void drawParasole() {
   //stick
   stroke (100,50,30);
   fill (0,50,50);
   rect (135,270,10,230);
   //umbrella
   noStroke();
   fill (225,0,0);
   ellipse (135,265,400, 180);
   //top
   stroke (100,50,30);
   fill (0,50,50);
   rect (135,165,10,40);
}
 


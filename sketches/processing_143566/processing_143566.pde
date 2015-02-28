
float posiciox= 0;
float posicioy= 350;
float x= 0;
float dx= 350;

void setup() {
  size(700, 700);
}

void draw() {
  fons();
  movement();
  mouse();

}

void fons() {
  background(95, 229, 242);
  
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

} 


void movement (){
  fill(232,124,221);
  stroke(232,124,221);
  ellipse(x+0,posicioy-20,250,250);
posiciox=posiciox+0.8;
posicioy=posicioy;

  fill(95,229,242);
  stroke(95,229,242);
  ellipse(x,posicioy-20,80,80);
  
  stroke(252,241+posiciox,15+posiciox/2);
  strokeWeight(10);
  line(x-70,posicioy-90,x-60,posicioy-80);
  stroke(42,252-x/4,15+x/4);
  line(x+30,posicioy-110,x+20,posicioy-100);
  stroke(255-x/5,0,4+x/5);
  line(x+50,posicioy+60,x+60,posicioy+50);
  stroke(110+x/3,141,252-x/5);
  line(x-80,posicioy+0,x-90,posicioy+10);
  stroke(255-x/2,255,255-x/4);
  line(x-40,posicioy+60,x-30,posicioy+70);
  stroke(255-x/4,167+x/4,3+x/2);
  line(x+90,posicioy-40,x+100,posicioy-30);
  
  
  x = x + dx;
  
if(x>700){
dx=-6;
}

if(x<0){
dx=6;
} 

}


void mouse() {
  rectMode(CENTER);

  // pels cap
  noFill();
  stroke(0);
  strokeWeight(1.5);
  ellipse(mouseX, mouseY-70, 75, 75);
  ellipse(mouseX, mouseY-70, 60, 60);

  //front
  stroke(247, 225, 20);
  strokeWeight(2);
  fill(247, 225, 20);
  ellipse(mouseX, mouseY-10, 180, 160);

  //cara
  rect(mouseX, mouseY+50, 180, 130);

  //parpelles
  ellipse(mouseX-72, mouseY+39, 50, 50);
  ellipse(mouseX+72, mouseY+39, 50, 50);

  //orelles
  stroke(247, 225, 20);
  ellipse(mouseX-80, mouseY+130, 50, 40);
  ellipse(mouseX+80, mouseY+130, 50, 40);
  rect(mouseX, mouseY+120, 180, 130);

  //ulls
  fill(255, 255, 255);
  stroke(0, 0, 0);
  strokeWeight(1.6);
  ellipse(mouseX-50, mouseY+75, 90, 90);
  ellipse(mouseX+50, mouseY+75, 90, 90);

  //pupil·les
  stroke(255, 0, 0);
  fill(255, 0, 0);
  ellipse(mouseX-58,mouseY+75,15,15);
  ellipse(mouseX-46, mouseY+75, 15, 15);
  ellipse(mouseX+58,mouseY+75,15,15);
  ellipse(mouseX+46, mouseY+75, 15, 15);
  
  triangle(mouseX-63,mouseY+80,mouseX-41,mouseY+80,mouseX-52,mouseY+86);
  triangle(mouseX+63,mouseY+80,mouseX+41,mouseY+80,mouseX+52,mouseY+86);


  //barba
  stroke(134, 90, 7);
  strokeWeight(2.5);
  fill(178, 138, 63);
  ellipse(mouseX, mouseY+185, 180, 130);

  //nas
  stroke(0, 0, 0);
  strokeWeight(1.5);
  fill(247, 225, 20);
  ellipse(mouseX, mouseY+110, 40, 40);
  stroke(247, 225, 20);
  rect(mouseX, mouseY+90, 10, 6);

  //boca
  fill(255, 255, 255);
  stroke(255, 255, 255);
  stroke(134, 90, 7);
  ellipse(mouseX, mouseY+192, 130, 70);



  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(mouseX, mouseY+165, 160, 57);

  rect(mouseX-62, mouseY+200, 16, 40);
  rect(mouseX+62, mouseY+200, 20, 40);



  stroke(0, 0, 0);
  fill(255, 255, 255);
  stroke(255, 255, 255);



  fill(178, 138, 63);
  stroke(178, 138, 63);
  ellipse(mouseX-64, mouseY+188, 40, 5);
  ellipse(mouseX+64, mouseY+188, 40, 5);
  
  
   ellipse(mouseX-60, mouseY+180, 15, 18);
  ellipse(mouseX+60, mouseY+180, 15, 18);
  
  
  fill(255, 255, 255);
  stroke(255, 255, 255);
  ellipse(mouseX-46, mouseY+202, 22, 22);
  ellipse(mouseX+44, mouseY+203, 22, 22);
  
  fill(178, 138, 63);
  stroke(178, 138, 63);
   ellipse(mouseX-53.3, mouseY+184, 15, 15);
  ellipse(mouseX+53.3, mouseY+185.2, 15, 15);
  

 ellipse(mouseX+43, mouseY+182.8, 15, 15);
 
 //dents
stroke(0, 0, 0);
strokeWeight(1.5);
line(mouseX-44, mouseY+190, mouseX-44, mouseY+217.5);
line(mouseX+42, mouseY+191, mouseX+42, mouseY+217);
line(mouseX+16, mouseY+193, mouseX+16, mouseY+225);
line(mouseX-16,mouseY+193, mouseX-16, mouseY+225);

//orelles per dins
stroke(0, 0, 0);
noFill();
ellipse(mouseX+90, mouseY+130, 20, 20);
ellipse(mouseX-90, mouseY+130, 20, 20);

fill(247, 225, 20);
stroke(247, 225, 20);
rect(mouseX-85,mouseY+130,12,22);
rect(mouseX+85,mouseY+130,12,22);
rect(mouseX+96, mouseY+137, 12, 6);
rect(mouseX-96, mouseY+137, 12, 6);

stroke(0, 0, 0);
noFill();
line(mouseX-97, mouseY+125, mouseX-90, mouseY+130);
line(mouseX+97, mouseY+125, mouseX+90, mouseY+130);

fill(255,5,5);

PFont font;
font = loadFont("ForteMT-38.vlw");
textFont (font, 38);
strokeWeight(8);
textSize(45);
textAlign(CENTER);
text("The Simpsons", mouseX, mouseY+290);

}




















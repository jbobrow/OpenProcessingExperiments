
int value=0;

void setup() {
  size (1000,500);
}

void draw() {
//-----------------------------------------------------------
/*FUNDO*/
background(9,39,67);
  for (int b=1; b<1000; b=b+1){
  stroke(b/4,29,90);
  line(0,b,1000,b);
} 
//-----------------------------------------------------------
/*CHÃO*/
  stroke(160);
  fill(160);
  rect(0,420,1000,81);
  fill(47,185,45);//grama
  quad(175,423,175,465,938,465,900,423);
//-----------------------------------------------------------
/*HALL DE VIDRO*/
  stroke(0);
  fill(207,250,249,60);
  strokeWeight(1);
  rect(182,256,880-182,452-256);//CUBO
  
  stroke(150);
  fill(232,237,175);
  quad(183,428,183,451,879,451,868,428);//CHÃO
  line(868,428,868,240);
  
  stroke(180);
  fill(255);
  quad(182,292,296,240,346,240,182,325);//PASSAGENS
  rect(182,346,362-182,370-347);
  fill(230);
  rect(182,360,363-183,428-355);
  
  stroke(200);
  triangle(521,434,742,324,742,434);//ESCADA
  rect(520,413,561-519,434-413);
  
/*VIDRO DA FRENTE*/
  noStroke();
  fill(134,255,248,10);
  rect(183,257,880-184,451-257);
  
/*GRADEADO VIDRO FRENTE*/
  stroke(0);
  for (int x=182; x<880; x=x+20) {
  line(x, 256, x,452);
  }
  for (int y=256; y<452; y=y+66) {
  line(182, y, 880,y);
  }
  
//-----------------------------------------------------------
/*SACADA EDIFICIO LATERAL*/
stroke(0);
fill(150,238,247,150);
  rect(82,214,136-82,250-214);
  arc(109,224,142-80,240-205,PI+PI/6,TWO_PI-PI/6,OPEN);
  line(91,209,91,250);
  line(109,206,109,250);
  line(127,209,127,250);
  
/*GUARDA-CORPO*/  
  line(42,239,176,239);
  line(42,239,42,249);
  
  pushMatrix();
   translate(28, 0);
  line(42,239,42,249);
   translate(28, 0);
  line(42,239,42,249);
   translate(24, 0);
  line(42,239,42,249);
   translate(28, 0);
  line(42,239,42,249);
   translate(27, 0);
  line(42,239,42,249);
  popMatrix();
  
//-----------------------------------------------------------
/*EDIFICIO LATERAL*/
  stroke(0);
  fill(200);
  rect(38,250,182-38,460-250);
  
/*2º ANDAR*/
  fill(250,255,121);
  rect(44,265,67-45,322-265);
  arc(55,265,66-44,272-258,PI,TWO_PI,OPEN);
  line(55,258,55,322);
 
    pushMatrix();
  translate(27, 0);
  rect(44,265,66-44,322-265);
  arc(55,265,66-44,272-258,PI,TWO_PI,OPEN);
  line(55,258,55,322);
  
    translate(28, 0);
  rect(44,265,66-44,322-265);
  arc(55,265,66-44,272-258,PI,TWO_PI,OPEN);
  line(55,258,55,322);
  
    translate(28, 0);
  rect(44,265,66-44,322-265);
  arc(55,265,66-44,272-258,PI,TWO_PI,OPEN);
  line(55,258,55,322);
  
    translate(27, 0);
  rect(44,265,66-44,322-265);
  arc(55,265,66-44,272-258,PI,TWO_PI,OPEN);
  line(55,258,55,322);
    popMatrix();
  
/*1º ANDAR*/
  rect(44,346,93-44,388-346); 
  arc(69,346,93-44,358-338,PI,TWO_PI,OPEN); 
  line(69,336,69,388);
   pushMatrix();
   
    translate(83, 0);
  rect(44,346,93-44,388-346);
  arc(69,346,93-44,358-338,PI,TWO_PI,OPEN); 
  line(69,336,69,388);
    popMatrix();
    
  rect(99,343,120-98,388-343); 
  arc(110,343,120-98,348-334,PI,TWO_PI,OPEN); 
  line(110,336,110,388);
  
/*TÉRREO*/
  rect(44,416,93-44,388-344); 
  arc(69,416,93-44,358-338,PI,TWO_PI,OPEN); 
  line(69,406,69,460);
  
   pushMatrix();
    translate(83, 0);
  rect(44,416,93-44,388-344); 
  arc(69,416,93-44,358-338,PI,TWO_PI,OPEN); 
  line(69,406,69,460);
    popMatrix();
    
  rect(99,413,120-98,388-341); 
  arc(110,413,120-98,348-334,PI,TWO_PI,OPEN); 
  line(110,406,110,460);

//-----------------------------------------------------------
/*BOLHA*/
fill(48,48,130);
beginShape();
curveVertex(235,221);
curveVertex(235,261);
curveVertex(241,290+mouseY/15);
curveVertex(265,330);
curveVertex(307,358+mouseY/20);
curveVertex(354,368-mouseY/40);
curveVertex(420,370+mouseY/10);
curveVertex(445,368);
curveVertex(475,360);
curveVertex(495,350);
curveVertex(523,330+mouseY/10);
curveVertex(551,315);
curveVertex(600,304);
curveVertex(635,307-mouseY/40);
curveVertex(674,315+mouseY/10);
curveVertex(743,333);
curveVertex(785,340+mouseY/15);
curveVertex(836,341);
curveVertex(871,334+mouseY/15);
curveVertex(906,321);
curveVertex(941,295+mouseX/15);
curveVertex(960,266);
curveVertex(967,240);
curveVertex(962,182-mouseY/10);
curveVertex(916,132);
curveVertex(866,110-mouseY/40);
curveVertex(808,98);
curveVertex(767,93-mouseY/15);
curveVertex(647,94);
curveVertex(563,97-mouseY/15);
curveVertex(471,107-mouseY/10);
curveVertex(382,116);
curveVertex(304,138-mouseY/15);
curveVertex(264,160);
curveVertex(240,196-mouseY/10);
curveVertex(235,221);
curveVertex(235,260);
curveVertex(246,311);
endShape();

//-----------------------------------------------------------
/*LAMPADAS E MIRANTE*/
  fill(value);//LAMPADAS
  for(int c=255;c<945;c=c+18){
    for(int d=180;d<300;d=d+18){
    ellipse(c,d,8,8);};}

  fill(134,255,248,100);//MIRANTE
  quad(145,138,145,208,629,196,629,126);
  int a=5;
  for (int z=145+70; z<629; z=z+70) {
  line(z, 135-a, z,210-a);
  }
  
strokeWeight(3);
line(152,210,623,197);
line(160,212,615,199);
line(165,213,610,201);

line(152,137,623,126);
line(160,135,615,124);
line(165,133,610,122);}

//-----------------------------------------------------------
/*ANIMAÇAÃO LAMPADAS*/
void mouseDragged() {
  value = value + 25;
  if (value > 255) 
     {value = 0;}
}

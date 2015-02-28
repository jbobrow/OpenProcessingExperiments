
// Created by Joseph Kennedy
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Artigas Residence, by João Batista Vilanova Artigas


//Variables
int count;
int click = 10;
int a = 0;
int b = 0;

//Scale
void setup() {
  fill(255);
  size(1100, 850);
  smooth();
}

void draw() {
 //Background
  fill(255);
  rect(0,0,1100,850);
 
 //Obscure
  if(keyPressed) {
    if (key == 'z' || key== 'Z') {
      fill(0);
      rect(b+700,b+175,a+100,a+100);
      a+=2;
      b--;
    }
  }

 //Mask
    if(mousePressed) {
    fill(150);
  } else {
    fill(0);
  }
  
  noStroke();
  rect(0,0,mouseX-50,height);
  rect(mouseX+50,0,width,height);
  rect(0,0,width,mouseY-50);
  rect(0,mouseY+50,width,height);
  
  //Expanding Illumination
   if(keyPressed) {
    if (key == 'a' || key== 'A') {
      fill(255);
      rect(b+700,b+175,a+100,a+100);
      a+=2;
      b--;
    }
  }

  
  //Reset Values
  if(keyPressed) {
    int keyIndex = -1;
    if (key >= 'A' && key <= 'Z') {
      keyIndex = key - 'A';
    } 
    else if (key >= 'a' && key <= 'z') {
      keyIndex = key - 'a';
    }
    if (keyIndex == -1) {
      a=0;
      b=0;
    }
  }
  
 //Columns
  stroke(0);
  column(875,175);
  column(875,275);
  column(800,175);
  column(800,275);
  column(700,175);
  column(700,275);
//Plan 
 //Exterior Partition
  strokeWeight(3);
  line(880,143,880,297);
  line(880,143,795,143);
  line(880,297,560,297);
  line(538,297,464,297);
  line(444,297,222,297);
  line(222,143,222,297);
  line(222,143,705,143);
  line(705,143,705,270);
  line(705,270,795,270);
  line(795,270,795,143);

//Interior Partition
  line(538,275,538,175);
  line(538,275,506,275);
  line(538,175,506,175);
  line(538,200,506,200);
  line(538,255,506,255);
  
  line(464,275,464,175);
  line(464,275,492,275);
  line(464,175,492,175);
  line(464,200,484,200);
  line(464,216,506,216);
  line(506,216,506,200);
  
  line(426,275,416,275);
  line(416,275,416,175);
  line(416,175,434,175);
  line(426,255,382,255);
  line(382,255,382,235);
  line(382,235,358,235);
  line(358,255,358,143);
  
  line(336,255,336,235);
  line(286,255,336,255);
  line(286,255,286,143);
  
  line(336,323,336,277);
  line(336,323,392,379);
  line(368,355,242,481);
  line(242,481,298,537);
  line(298,537,515,320);
  line(408,427,396,415);
  
  line(423,412,411,400);
  line(515,320,503,308);
  line(515,320,543,348);
  line(543,348,594,297);
 
//Section
  //Columns
  strokeWeight(10);
  line(875,746,875,655);
  line(800,746,800,662);
  line(700,746,700,672);
  
  //Walls
  strokeWeight(3);
  line(880,713,880,650);
  line(538,750,538,682);
  line(464,750,464,678);
  line(416,750,416,686);
  line(358,750,358,682);
  line(286,750,286,676);
  line(222,750,222,670);
  
  //Roof
  line(538,685,880,650);
  line(538,682,464,678);
  line(222,670,464,690);
  
  //Floor
  line(222,750,700,750);
  line(880,713,800,713);
  line(800,713,756,738);
  line(756,738,724,738);
  line(724,738,700,750);
  
 //Construction Lines
  float mx1 = constrain(mouseX,0,700);
  float mx2 = constrain(mouseX,875,1200);
  strokeWeight(2);
  line(mx2,175,mx1,175);
  line(mx2,275,mx1,275);

  float my1 = constrain(mouseY,0,175);
  float my2 = constrain(mouseY,275,850);
  strokeWeight(2);
  line(700,my2,700,my1);
  line(800,my2,800,my1);
  line(875,my2,875,my1);
  
construction1(560);  
construction1(538);
construction1(506);
construction1(492);
construction1(484);
construction1(464);
construction1(444);
construction1(434);
construction1(426);
construction1(416);    
construction1(382);
construction1(358);
construction1(336);  
construction1(286);  
construction1(222);

construction1(705);
construction1(795);
construction1(880);

construction2(506,200);
construction2(506,255);
construction2(464,216);
construction2(358,235);
construction2(222,143);
construction2(222,297);

construction3(660);
construction3(723);
construction3(740);
construction3(761);
construction3(772);
construction3(810);
construction3(835);
construction3(858);
construction3(891);

  //Crosshairs
  for (int count=0; count < click; count++) { 
    stroke(0);
    strokeWeight(2);
    line(mouseX,0,mouseX,height);
  }
  for (int count=0; count < click; count++) {
    stroke(0);
    strokeWeight(2);
    line(0,mouseY,width,mouseY);
  }  
  
//Blocked Spaces
 solid('c',600,275,-30,-40);
 solid('d',538,275,-32,-19);
 solid('e',538,255,-32,-54);
 solid('f',426,275,-9,-19);
 solid('g',426,255,-9,-79);
 solid('h',416,255,-33,-19);
 solid('i',382,255,-23,-19);
 solid('j',336,255,-49,-19);
 solid('k',336,297,-113,-19);
 solid2('l',408,427,396,415,411,400,423,412);
 solid2('m',411,400,423,412,515,320,503,308);
 stairs('n',708,270);
 solid('o',796,144,84,153);
 solid('p',705,144,-166,153);
 solid('b',505,275,-40,-58);
 solid('r',506,216,-41,-15);
 solid('s',465,176,73,24);
 solid('t',464,275,-36,-99);
 solid('u',416,235,-57,-91);
 solid('v',358,235,-71,-91);
 solid('w',286,297,-63,-153);
 solid('w',338,297,-52,-41);
 solid2('x',423,412,299,536,244,481,369,356);
 solid2('y',424,412,515,320,337,298,337,323);
 solid2('y',337,298,337,323,515,320,494,298);
 solid2(',',494,298,543,348,594,297,594,297);
 solid('.',337,297,79,-41);
 solid(';',416,297,123,-21);
 solid('[',539,144,-123,31); 

}

//Functions
void solid(int z,int u1,int u2,int u3, int u4) {
  fill(255);
  noStroke();
  if (key == z || key == Z) {
    rect(u1,u2,u3,u4);
    if (u1 > 538) {
      quad(u1,750,u1+u3,750,u1+u3,741-.10234*u1-.10234*u3,u1,741-.10234*u1);
    }
    if (u1 <= 538 && u1 > 464) {
      quad(u1,750,u1+u3,750,u1+u3,654+.054*u1+.054*u3,u1,654+.054*u1);
    }
    if (u1 <= 464) {
      quad(u1,750,u1+u3,750,u1+u3,654+.08196*u1+.08196*u3,u1,654+.08196*u1);
   }
  }
 }
 
void solid2(int z2,int w1,int w2,int w3,int w4,int w5,int w6, int w7, int w8) {
  fill(255);
  noStroke();
  if (key == z2) {
    quad(w1,w2,w3,w4,w5,w6,w7,w8);
  }
 }
 
void stairs(int z3,int v1,int v2) {
  stroke(255);
  strokeWeight(2);
  if (key == z3) {
    line(v1,v2,v1,v2+27);
    line(v1+6,v2,v1+6,v2+27);
    line(v1+12,v2,v1+12,v2+27);
    line(v1+18,v2,v1+18,v2+27);
    line(v1+24,v2,v1+24,v2+27);
    
    line(v1+44,v2,v1+44,v2+27);
    line(v1+50,v2,v1+50,v2+27);
    line(v1+56,v2,v1+56,v2+27);
    line(v1+62,v2,v1+62,v2+27);
    line(v1+68,v2,v1+68,v2+27);
    line(v1+74,v2,v1+74,v2+27);
    line(v1+80,v2,v1+80,v2+27);
    line(v1+86,v2,v1+86,v2+27);
  }
}
    
void column(int x, int y) {
  fill(0);
  ellipse(x, y, 8, 8);
}

void construction1(int x1) {
  if(mouseX <= x1) {
  float my3 = constrain(mouseY,0,175);
  float my4 = constrain(mouseY,275,850);
  strokeWeight(1);
  line(x1,my4,x1,my3);
  }
}

void construction2(int x2,int y2) {
  if(mouseX <= x2) {
  float mx5 = constrain(mouseX,0,700);
  float mx6 = constrain(mouseX,875,1100);
  strokeWeight(1);
  line(mx6,y2,mx5,y2);
  }
}


void construction3(int x3) {
   strokeWeight(1);
   if(x3-mouseX < mouseY && mouseY >= 297) {
     line(x3,0,mouseX,x3-mouseX);
   }
   if(x3-mouseX > mouseY && mouseY >= 297) {
     line(x3,0,x3-mouseY,mouseY);
   }     
}



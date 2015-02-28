
PImage a,b,c,d,e,f,g,h,i,j,k,l;int card = 0;int radius=58;
/*int halfcir, wCen, yCen, clocir, halfcir1, halfcir2 ; 
int x;*/
int m=170;int o= 526;int w = 70;int v = 50;
void setup(){
size(600,600);
 // ellipseMode(RADIUS);
 noStroke();
// ellipseMode(RADIUS);
}
void draw() {
  //xuanze
 if (card == 0) {   
  a= loadImage("img.png");
image(a,0,0,600,600) ;
//zuo 
textSize(20);
fill(0);
 text("Want to eat ?",30,o );
  fill(0);
  rect(m,o, w,v);
 //you
 textSize(20);
fill(0);
 text("Want to sport ?",460,o );
  fill(0);
rect(m+210,o, w,v);
 
fill(231,180,211);
ellipse(338,110,52,138);
ellipse(255,110,52,138);
fill(225);
ellipse(338,110,32,120);
ellipse(255,110,32,120);
//limbs
fill(250,177,246);
ellipse(393,340,68,28);
ellipse(209,340,68,28);
ellipse(200,470,117,37);
ellipse(400,470,117,37);

//big body
fill(245,146,240);
ellipse(300,380,137,217);
//small body
fill(225);
ellipse(300,380,60,175);
//head
fill(247,185,244);
ellipse(300,220,160,140);

ellipse(330,490,20,20);

b= loadImage("img2.png");
image(b,45,-20,600,600) ;
 }
   else if (card == 1) {  
     //eat 1
      a= loadImage("img.png");
image(a,0,0,600,600) ;
 c= loadImage("img3.png");
image(c,0,270,280,180) ;
noStroke();
 textSize(20);
 text("Next Page->",460,o );
   float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
//erduo
 
fill(231,180,211);
ellipse(428,158,20,78);
ellipse(442,158,20,78);
//body
fill(245,146,240);
ellipse(430,370,75,161);
fill(225);
ellipse(412,367,34,114);
//legs
fill(250,177,246);
ellipse(371,322,60,18);
ellipse(373,447,86,23);

ellipse(460,445,15,15);
//head
fill(247,185,244);
ellipse(432,243,100,100);


stroke(0);
line(401,233,403,245);
}
  else if (card == 2) { 
   //eat2 
 a= loadImage("img.png");
image(a,0,0,600,600) ;
 d= loadImage("img4.png");
image(d,0,200,280,280) ;
//erduo
 noStroke();
 textSize(20);
 text("Next Page->",460,o );
  float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
 
fill(231,180,211);
ellipse(428,158,20,78);
ellipse(442,158,20,78);
//body
fill(245,146,240);
ellipse(430,370,100,161);
fill(225);
ellipse(412,367,34,114);
//legs
fill(250,177,246);
ellipse(371,322,60,18);
ellipse(373,447,86,23);

ellipse(460,445,15,15);
//head
fill(247,185,244);
ellipse(432,243,100,100);


stroke(0);
line(401,233,403,245);
}
 else if (card == 3) {  
   //eat3
  a= loadImage("img.png");
image(a,0,0,600,600) ;
 e= loadImage("img5.png");
image(e,0,180,320,340) ;
//erduo
 noStroke();
 textSize(20);
 text("Next Page->",460,o );
 float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
fill(231,180,211);
ellipse(428,158,20,78);
ellipse(442,158,20,78);
//body
fill(245,146,240);
ellipse(430,370,140,161);
fill(235);
ellipse(412,367,34,114);
//legs
fill(250,177,246);
ellipse(371,322,60,18);
ellipse(373,447,86,23);

ellipse(460,445,15,15);
//head
fill(247,185,244);
ellipse(432,243,100,100);


stroke(0);
line(401,233,403,245);
}  
else if (card == 4) { 
  //sleep
   a= loadImage("img.png");
image(a,0,0,600,600) ;
 g= loadImage("img7.png");
image(g,0,0,600,600) ;
 noStroke();
 textSize(20);
 text("Next Page->",460,o-426 );
   float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o-426, radius, radius);
 
 fill(231,180,211);
 ellipse(545,488,78,20);
  ellipse(545,498,78,20);
 //body
fill(245,146,240);
 ellipse(334,502,161,140);
 fill(235);
  ellipse(334,460,114,34);
  //legs
fill(250,177,246);
  ellipse(210,518,95,23);
  ellipse(210,526,95,23); 
   ellipse(382,528,18,60);
 //head
fill(247,185,244);
ellipse(460,505,100,100);
stroke(0);
line(464,464,464,475);

}
else if (card == 5) { 
 //zhu
  noStroke();
  a= loadImage("img.png");
image(a,0,0,600,600) ;
 h= loadImage("img8.jpg");
image(h,0,0,600,600) ;
textSize(20);
 text("Back->",460,o );
   float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
} 
 else if (card == 6) {  
   //zuqiu
  noStroke();
 
 a= loadImage("img.png");
image(a,0,0,600,600) ;
 text("Next Page->",460,o );
  float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
 i= loadImage("img9.png");
image(i,100,350,100,100) ;
fill(231,180,211);
ellipse(428,158,20,78);
ellipse(442,158,20,78);
//body
fill(245,146,240);
ellipse(430,370,140,161);
fill(235);
ellipse(412,367,34,114);
//legs
fill(250,177,246);
ellipse(371,322,60,18);
ellipse(373,447,86,23);

ellipse(460,445,15,15);
//head
fill(247,185,244);
ellipse(432,243,100,100);


stroke(0);
line(401,233,403,245);
}
 else if (card == 7) {  
   //lamqiu
  noStroke();
  a= loadImage("img.png");
image(a,0,0,600,600) ;
 text("Next Page->",460,o );
  float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
 j= loadImage("img10.png");
image(j,100,350,100,100) ; 
fill(231,180,211);
ellipse(428,158,20,78);
ellipse(442,158,20,78);
//body
fill(245,146,240);
ellipse(430,370,100,161);
fill(225);
ellipse(412,367,34,114);
//legs
fill(250,177,246);
ellipse(371,322,60,18);
ellipse(373,447,86,23);

ellipse(460,445,15,15);
//head
fill(247,185,244);
ellipse(432,243,100,100);


stroke(0);
line(401,233,403,245);
 noStroke();
}

else if (card == 8) { 
  //paiqiu
  a= loadImage("img.png");
image(a,0,0,600,600) ;
 k= loadImage("img11.png");
image(k,100,350,100,100) ;
noStroke();
 textSize(20);
 text("Next Page->",460,o );
  float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
 //erduo
 
fill(231,180,211);
ellipse(428,158,20,78);
ellipse(442,158,20,78);
//body
fill(245,146,240);
ellipse(430,370,75,161);
fill(225);
ellipse(412,367,34,114);
//legs
fill(250,177,246);
ellipse(371,322,60,18);
ellipse(373,447,86,23);

ellipse(460,445,15,15);
//head
fill(247,185,244);
ellipse(432,243,100,100);


stroke(0);
line(401,233,403,245);
} 
else if (card == 9) { 
  //shuijiao
   a= loadImage("img.png");
image(a,0,0,600,600) ;
 g= loadImage("img7.png");
image(g,0,0,600,600) ;
 noStroke();
 textSize(20);
 text("Next Page->",460,o-426 );
  float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o-426, radius, radius);
 
 fill(231,180,211);
 ellipse(545,488,78,20);
  ellipse(545,498,78,20);
  //body
fill(245,146,240);
 ellipse(334,502,161,90);
 fill(235);
  ellipse(334,490,114,34);
  //legs
fill(250,177,246);
  ellipse(210,518,95,23);
  ellipse(210,526,95,23); 
   ellipse(382,528,18,60);
 //head
fill(247,185,244);
ellipse(460,505,100,100);
stroke(0);
line(464,464,464,475);

}
 else if (card == 10) {  
  noStroke();
  a= loadImage("img.png");
image(a,0,0,600,600) ;
l= loadImage("img12.png");
image(l,0,0,600,600) ;
textSize(20);
 text("Back->",460,o );
  float z= dist(m+240,o,mouseX,mouseY);
  if(z<radius){
  fill(0);
  }
  else{
    fill(252,120,120);
  }
 // fill(199,252,245);
 ellipse(m+240,o, radius, radius);
} 
}
void mousePressed() { 
 
  if (card == 0) {  

    if((mouseX > m) && (mouseX < m +w ) && (mouseY > o) && (mouseY < o
    +v)) {
      card = 1;
    } 
     else if((mouseX > m+210) && (mouseX < m+210 +w ) && (mouseY > o) && (mouseY < o
    +v)) {
      card = 6;
    } 
    else card = 0;
  }
 
  else if (card == 1) {  

    float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 2;
    }
  else card = 1;
  }    
 
 else if (card == 2) {

    float n = dist(mouseX, mouseY, m+240, o);
    if (n< 20) {
      card = 3;
    }
    else card = 2;
  }
   else if (card == 3) {

    float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 4;
    }
    else card = 3;
  }  
 
  else if (card == 4) { 
     float n = dist(mouseX, mouseY, m+240, o-426);
    if (n < 20) {
      card = 5;
    }
    else card = 4;
  }  
 
  
    else if (card == 5){
     float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 0;
    }
    else card = 5;
  }  

  else if (card ==6) { 
 
     float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 7;
    }
    else card = 6;
  }  
   else if (card ==7) { 
 
    float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 8;
    }
    else card = 7;
  }  
  else if (card ==8) { 
 
        float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 9;
    }
    else card = 8;
  }  
   else if (card ==9) { 
 
     float n = dist(mouseX, mouseY, m+240, o-426);
    if (n < 20) {
      card = 10;
    }
    else card = 9;
  }   
   else if (card ==10) { 
 
     float n = dist(mouseX, mouseY, m+240, o);
    if (n < 20) {
      card = 0;
    }
    else card = 10;
}
}


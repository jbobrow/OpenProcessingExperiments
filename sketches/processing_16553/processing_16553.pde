
PImage a,b,c,d,e,f,g,h;int card = 0;int halfcir, wCen, yCen, clocir, halfcir1, halfcir2 ; 
int x;
void setup(){
size(600,600);
a= loadImage("img.png");
b= loadImage("img2.png");
c= loadImage("img3.png");
d= loadImage("img4.png");
e= loadImage("img5.png");
//f= loadImage("img6.jpg");
g= loadImage("img7.png");
h= loadImage("img8.jpg");
 noStroke();
}
void draw() {
 if (card == 0) {   
  a= loadImage("img.png");
image(a,0,0,600,600) ;
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
      a= loadImage("img.png");
image(a,0,0,600,600) ;
 c= loadImage("img3.png");
image(c,0,270,280,180) ;
//erduo
 noStroke();
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
 a= loadImage("img.png");
image(a,0,0,600,600) ;
 d= loadImage("img4.png");
image(d,0,200,280,280) ;
//erduo
 noStroke();
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
  a= loadImage("img.png");
image(a,0,0,600,600) ;
 e= loadImage("img5.png");
image(e,0,180,320,340) ;
//erduo
 noStroke();
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
   a= loadImage("img.png");
image(a,0,0,600,600) ;
 g= loadImage("img7.png");
image(g,0,0,600,600) ;
 noStroke();
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
  //f=loadImage("img6.jpg");
  //background color change  
    noStroke(); 
 float mapColorR=map(mouseX,0,600,10,255);
  float mapColorG=map(mouseX,0,600,20,255);
   float mapColorB=map(mouseX,0,600,30,255);
  fill(mapColorR,mapColorG,mapColorB);
  rect(0,0,width,height);
  
  for (int y=0; y <= height; y +=25){  

  for (int x= 0; x <= width; x +=25){  

    fill (196,142,255,144);  

    ellipse(x,y,15,15); }
  }
x=5;
//image(f,0,0,600,600);

//time
wCen = width/2;
yCen = height/2;
  
  noStroke();
  smooth();
 
  fill(255);
  ellipse(300,300, 10, 10);
 
  float s = map(second(), 0,5,0 , TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 5, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 3, 0, 3,0, TWO_PI) - HALF_PI;
  stroke(0);
  clocir =140;
  halfcir = 90;
  halfcir1 = clocir/2-10;
  halfcir2 = clocir/2;
  strokeWeight(2);
   line(300,300, cos(s) * halfcir1 +  wCen, sin(s) * halfcir1 +yCen);
  strokeWeight(5);
  line(300, 300, cos(m) * halfcir + wCen, sin(m) * halfcir + yCen);
   strokeWeight(7);
  line(300, 300, cos(h) * halfcir2 + wCen, sin(h) * halfcir2 +yCen);
 }
 else if (card == 6) {  
  noStroke();
  a= loadImage("img.png");
image(a,0,0,600,600) ;
 h= loadImage("img8.jpg");
image(h,0,0,600,600) ;
}  
}
void mousePressed() { 
 
  if (card == 0) { 
 
    card = 1;
  } 
 
  else if (card == 1) { 
 
    card = 2;
  } 
 
  else if (card == 2) { 
 
    card = 3;
  } 
   else if (card == 3) { 
 
    card = 4;
  } 
 
  else if (card == 4) { 
 
    card = 5;
  } 
    else if (card == 5){
    card = 6;
  } 

  else if (card ==6) { 
 
    card = 0;
  }
}  



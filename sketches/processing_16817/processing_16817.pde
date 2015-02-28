
PImage z,a,b,c,d,e;int card = 0;int x=200 ;int y=130;int w=180;int h=50;
void setup(){
size(600,600);

 noStroke();
}
void draw() {
   if (card == 0) { 
 z= loadImage("yi.png");
image(z,0,0,600,600) ;    
  textSize(50);
 // fill(225);
  //rect(100,25,400,80);
  fill(0);
  text("This is my  life of a week ",20,80);
   textSize(30);
fill(225);
rect(x,y,w,h);
fill(0);
 text(" Monday",x+35,y+30 );
 
 textSize(30);
fill(225);
rect(x,y+70,w,h);
fill(0);
 text(" Tuesday",x+35,y+100 );
 
 textSize(30);
fill(225);
rect(x,y+140,w,h);
fill(0);
 text("  Wednesday ",x+2,y+170 ); 
 
  textSize(30);
fill(225);
rect(x,y+210,w,h);
fill(0);
 text("   Thursday  ",x+10,y+240 ); 
 
   textSize(30);
fill(225);
rect(x,y+280,w,h);
fill(0);
 text("   Friday ",x+20,y+310 ); 
 
   textSize(30);
fill(225);
rect(x,y+350,w,h);
fill(0);
 text("   Saturday   ",x+20,y+380 ); 
 
  textSize(30);
fill(225);
rect(x,y+420,w,h);
fill(0);
 text("   Sunday   ",x+20,y+450); 
   }   
 if (card == 1) { 
 

z= loadImage("yi.png");
image(z,0,0,600,600) ;
fill(255,208,63);
ellipse(310,310,571,571);

 a= loadImage("yi1.png");
image(a,0,0,600,600) ;
//lift
fill(0);
ellipse(126,210,38,60);
fill(225);
ellipse(118,210,15,31);
//right
fill(0);
ellipse(332,213,45,57);
fill(225);
ellipse(324,213,16,24);
//
fill(0);
quad(95,150,208,153,208,170,95,170);
quad(355,140,485,172,477,200,347,150);
}
 else if (card == 2) { 
   a= loadImage("yi.png");
image(a,0,0,600,600) ; 
   fill(255,208,63);
ellipse(300,270,305,305);
   b= loadImage("yi2.png");
image(b,0,0,600,600) ;
fill(255,0,0);
ellipse(300,348,79,166);
fill(0);
rect(187,190,80,12);
rect(328,187,98,17);
}
 else if (card == 3) { 
   a= loadImage("yi.png");
image(a,0,0,600,600) ; 
   fill(255,208,63);
ellipse(300,270,305,305);
  b= loadImage("yi2.png");
image(b,0,0,600,600) ;
fill(0);
rect(187,190,80,12);
rect(328,187,98,17);

fill(0);
quad(240,401,292,342,290,350,247,406);
quad(292,342,295,355,341,416,350,410);
}
 if (card == 4) { 
    a= loadImage("yi.png");
image(a,0,0,600,600) ; 
   fill(255,208,63);
ellipse(300,270,305,305);
  b= loadImage("yi2.png");
 //zuo
fill(255);
ellipse(230,286,66,86);
fill(0);
ellipse(244,304,26,42);
//you
fill(255);
ellipse(362,286,58,92);
fill(0);
ellipse(370,306,31,41);
rect(231,382,146,10);

} 
 if (card == 5) { 
    a= loadImage("yi.png");
image(a,0,0,600,600) ; 
  fill(255,208,63);
ellipse(300,270,305,305);
   c= loadImage("yi3.png");
image(c,0,0,600,600) ;
fill(255,0,0);
ellipse(300,376,200,80);
} 
 if (card == 6) { 
    a= loadImage("yi.png");
image(a,0,0,600,600) ; 
  fill(255,208,63);
ellipse(300,270,305,305);
   z= loadImage("yi4.png");
image(z,0,0,600,600) ;
fill(255,0,0);
ellipse(300,376,200,80);
}
 if (card == 7) { 
     a= loadImage("yi.png");
image(a,0,0,600,600) ; 
fill(255,208,63);
ellipse(300,300,305,305);
   z= loadImage("yi5.png");
image(z,0,0,600,600) ;
}
}
 
 
 void mousePressed() { 
 
  if (card == 0) {  

    if((mouseX >x ) && (mouseX < x +w ) && (mouseY > y) && (mouseY < y
    +h)) {
      card = 1;
    } 
     else if((mouseX > x) && (mouseX < x +w ) && (mouseY >y+70 )
     && (mouseY < y+70
 +h)) {
      card = 2;
    } 
     else if((mouseX > x) && (mouseX < x +w ) && (mouseY >y+140 )
     && (mouseY < y+140
 +h)) {
      card = 3;
 }
  else if((mouseX > x) && (mouseX < x +w ) && (mouseY >y+210 )
     && (mouseY < y+210
 +h)) {
      card = 4;
 }
   else if((mouseX > x) && (mouseX < x +w ) && (mouseY >y+280 )
     && (mouseY < y+280
 +h)) {
      card = 5;
 }
   else if((mouseX > x) && (mouseX < x +w ) && (mouseY >y+350 )
     && (mouseY < y+350
 +h)) {
      card = 6;
 }
   else if((mouseX > x) && (mouseX < x +w ) && (mouseY >y+420 )
     && (mouseY < y+420
 +h)) {
      card = 7;
 }
    else card = 0;
  }
   else if (card == 1) { 
 
    card = 0;
  } 
 
  else if (card == 2) { 
 
    card = 0;
  } 
 
  else if (card == 3) { 
 
    card = 0;
  } 
 else if (card == 4) { 
 
    card = 0;
  } 
 
    else if (card == 5) { 
 
    card = 0;
  } 
   else if (card == 6){
    card = 0;
  } 

  else if (card ==7) { 
 
    card = 0;
  }
  /* else if (card ==7) { 
 
    card = 0;
}  
*/
}


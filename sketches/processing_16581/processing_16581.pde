
PImage x,a,b,c,d,e;int card = 0;
void setup(){
size(600,600);
x= loadImage("yi.png");
a= loadImage("yi1.png");
c= loadImage("yi3.png");
d= loadImage("yi4.png");
e= loadImage("yi5.png");
 noStroke();
}
void draw() {
 if (card == 0) { 
 

x= loadImage("yi.png");
image(x,0,0,600,600) ;
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
 else if (card == 1) { 
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
 else if (card == 2) { 
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
 if (card == 3) { 
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
 if (card == 4) { 
    a= loadImage("yi.png");
image(a,0,0,600,600) ; 
  fill(255,208,63);
ellipse(300,270,305,305);
   c= loadImage("yi3.png");
image(c,0,0,600,600) ;
fill(255,0,0);
ellipse(300,376,200,80);
} 
 if (card == 5) { 
    a= loadImage("yi.png");
image(a,0,0,600,600) ; 
  fill(255,208,63);
ellipse(300,270,305,305);
   x= loadImage("yi4.png");
image(x,0,0,600,600) ;
fill(255,0,0);
ellipse(300,376,200,80);
}
 if (card == 6) { 
     a= loadImage("yi.png");
image(a,0,0,600,600) ; 
fill(255,208,63);
ellipse(300,300,305,305);
   x= loadImage("yi5.png");
image(x,0,0,600,600) ;
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

   


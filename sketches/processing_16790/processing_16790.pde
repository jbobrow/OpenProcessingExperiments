
PImage b,c,d,e,f,g,h;int card = 0;
void setup(){
size(600,600);

b= loadImage("img2.png");
c= loadImage("img3.png");
d= loadImage("img4.png");
e= loadImage("img5.png");
f= loadImage("img6.png");
g= loadImage("img7.png");
h= loadImage("img8.png");
}
void draw() {
 if (card == 0) {  
    b= loadImage("img2.png");
image(b,0,0,600,600) ;
 }
  else if (card == 1) {  
   c= loadImage("img3.png");
   image(c,0,0,600,600) ;
  }
  else if (card == 2) {  
   d= loadImage("img4.png");
   image(d,0,0,600,600) ;
  }
  else if (card == 3) {  
   e= loadImage("img5.png");
   image(e,0,0,600,600) ;
  }
  else if (card == 4) {  
   f= loadImage("img6.png");
   image(f,0,0,600,600) ;
  }
  else if (card == 5) {  
   g= loadImage("img7.png");
   image(g,0,0,600,600) ;
  }
  else if (card == 6) {  
   h= loadImage("img8.png");
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
   
 
   




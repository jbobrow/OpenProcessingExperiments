
PImage b,c,d,e,f,g,h;int card = 0;
void setup(){
size(600,600);

b= loadImage("img1.jpg");
c= loadImage("img2.jpg");
d= loadImage("img3.jpg");
e= loadImage("img4.jpg");
f= loadImage("img5.jpg");
g= loadImage("img6.jpg");
h= loadImage("img7.jpg");
}
void draw() {
 if (card == 0) {  
    b= loadImage("img1.jpg");
image(b,0,0,600,600) ;
 }
  else if (card == 1) {  
   c= loadImage("img2.jpg");
   image(c,0,0,600,600) ;
  }
  else if (card == 2) {  
   d= loadImage("img3.jpg");
   image(d,0,0,600,600) ;
  }
  else if (card == 3) {  
   e= loadImage("img4.jpg");
   image(e,0,0,600,600) ;
  }
  else if (card == 4) {  
   f= loadImage("img5.jpg");
   image(f,0,0,600,600) ;
  }
  else if (card == 5) {  
   g= loadImage("img6.jpg");
   image(g,0,0,600,600) ;
  }
  else if (card == 6) {  
   h= loadImage("img7.jpg");
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
   
 
   



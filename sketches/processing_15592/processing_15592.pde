
int wCen, yCen, cloCir, halfCir;  

PImage bg;  

PImage cc;  

PImage aa;  

PImage bb;
   

PFont f ;  

   

void setup () {  

  size (360,600);   

  smooth();  

     

  bg = loadImage ("bg.png");  

  cc = loadImage ("center.png");  

  aa = loadImage ("fast.png");  
  
  bb = loadImage ("mm.png");
     

  f = loadFont ("ARCHRISTY-48.vlw");   

  textFont (f);  

 }  

   

void draw () {  

    

 wCen= width/2;   

 yCen = height/2;  

 cloCir= 300;  

 halfCir= 140;  

    

                     float s = map(second(), 0, 60, 0, TWO_PI) -HALF_PI;  

                     float m = map(minute(), 0, 60, 0,TWO_PI) -HALF_PI;  

                     float h = map(hour() % 12, 0, 12 , 0, TWO_PI) -HALF_PI;  

    

    

  imageMode(CORNER);  

  image ( bg, 0, 0, 360, 600);  

     

  imageMode(CENTER);  

  image (cc,wCen,yCen,200,140);  

     

  image(aa,cos(s) * halfCir+wCen, sin(s) * halfCir+yCen,55,50);  

  image(bb, cos(m) * (halfCir-50)+wCen, sin(m) * (halfCir-50)+yCen,50,50);   

 line(wCen, yCen, cos(h) * (halfCir-80)+wCen, sin(h) * (halfCir-80)+yCen);  

    

  int D = day();  

  int M = month();  

  int Y = year();  

    
 
 String time2  = nf(Y, 2)+ " / " + nf(M, 2) +" / " + nf(D, 2);  

 fill(0);
 
  textAlign(CENTER);  

  textSize(48);  

  text(time2, width/2, 80);    

  

} 



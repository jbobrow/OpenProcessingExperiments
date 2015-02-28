
int a =-10;
int b =20;
int c =300;
int d =0;
int e =250;
int f =200;
int g = 0;
int h =150;

void setup(){
 size (500,600);
  background (70);
  smooth ();
  noCursor();
  
}

void draw() {
  background (70);
 if (mousePressed){
   fill(250,80);
 quad (a,b,pmouseX,pmouseY,e,f,g,h);
 a=a-1;
 b=b+4;
 h= h+1;

 
 

 } else
   {fill(70);
   a=0;
   b=0;
   c=0;
   d=0;
   e=0;
   f=0;
   g=0;
   h=0;
  
 }
  
  
  stroke (70);
   strokeWeight (5);
  line (-10,200,100,0);
   line (10,-20,100,250);
   line (100,250,80,400);
   line (-10,400, 90,300);
   line (100,250, -500,100);
   line (200,300, -10, 80);
   line (0,150, 150, 500);
   line (150,500, 30,600);
   line (0,500, 130,340);
   line (130,340,150,250);
   line (18,480,80,600);
  line (100,470, 0,320);
   line (100,470,250,470);
   line (250,470, 170,200);
  line (170,200,73,50);
   line (150,600,230,400); 
  line (54,550,213,350);
  line (160,570,40,449);
   fill(70);
  rect (300,0,500,600);
 } 
 

                
                                

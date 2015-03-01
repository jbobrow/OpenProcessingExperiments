

boolean boton = false ;


void setup (){
size (600, 600);
;
background (255);frameRate (80);

}

void draw()
{  if (boton==true){
  

float azul = random (255);
  float ver = random (255);
float red = random (255);
float blue = random (255);

float  a =random ( 0, 600);
float  r =random ( 0, 600);
float  s =random ( 0, 600);
float  d =random ( 0, 600);
float  z =random ( 0, 600);
float  x =random ( 0, 600);
float  w =random ( 0, 600);
float  q =random ( 0, 600);
float  a1 =random ( 0, 600);
float  r1 =random ( 0, 600);
float  s1 =random ( 0, 600);
float  d1 =random ( 0, 600);
float  z1 =random ( 0, 600);
float  x1 =random ( 0, 600);
float  w1 =random ( 0, 600);
float  q1 =random ( 0, 600);



fill (red, ver, azul);
ellipse (a, r, 20, 20);
fill (azul, ver, red);
ellipse (s,d, 20, 20);
fill (ver, red, azul);
ellipse (z, x, 10, 10);
fill (red, azul, ver);
ellipse (w,q, 40, 40);
fill (azul, red, ver);
ellipse (a1, r1, 60, 60);
fill (ver, red, azul);
ellipse (s1, d1, 10, 10);
fill (blue, red, azul);
ellipse (z1,x1, 40, 40);
fill (ver, blue, azul);
ellipse (w1, q1, 60, 60);}else{


float azul = random (255);
  float ver = random (255);
float red = random (255);
float blue = random (255);



float  b =random (0, 600);
float  v =random ( 0, 600);
float  c =random ( 0, 600);
float  n =random ( 0, 600);

float  y =random ( 0, 600);
float  t =random ( 0, 600);
float  o =random ( 0, 600);
float  p =random ( 0, 600);

float  b1 =random ( 0, 600);
float  v1 =random ( 0, 600);
float  c1 =random ( 0, 600);
float  n1 =random ( 0, 600);

float  y1 =random ( 0, 600);
float  t1 =random ( 0, 600);
float  o1 =random ( 0, 600);
float  p1 =random ( 0, 600);
fill (red, ver, azul);

rect (b, v, 20, 20);
fill (azul, ver, red);
rect (c,n, 20, 20);
fill (ver, red, azul);
rect (y, t, 10, 10);
fill (red, azul, ver);
rect (o,p, 40, 40);
fill (azul, red, ver);
rect (b1, v1, 60, 60);
fill (ver, red, azul);

rect (c1, n1, 10, 10);

fill (blue, red, azul);

rect (y1,t1, 40, 40);

fill (ver, blue, azul);
rect (o1, p1, 60, 60);




}

fill (#FF0011);  
rect (200,470,200,60);
}

void mousePressed()
{if (mouseX > 200 && mouseX < 400 && mouseY > 470 && mouseY < 530) { 
     boton = !boton ;
    
   background (255);
 fill (#FF0011);  
rect (200,470,200,60);}
    
}

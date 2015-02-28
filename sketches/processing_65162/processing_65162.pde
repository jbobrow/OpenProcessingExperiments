
float a , b ,c , d , ab , ba , aa, bb;{
a = 50;
b = 60;
c= 50;
d= 60;
ab= 50;
ba= 70;
aa= 300;
bb= 400;
}

void setup (){
  
size (800, 600);
background (50,50,50);
stroke (100,100,100);
strokeWeight (10);
smooth ();
}

void draw (){
fill (255,100,0,50);
ellipse (0,0,a,b);
ellipse (800,0,a,b);
ellipse (0,600,a,b);
ellipse (800,600,a,b);
fill(100,100,0,0);
stroke (50,80,97);
fill(100,2,0,50);
stroke (255,100,0,50);
ellipse (400,300,50,50);
noStroke();
fill(97,5,20,20);
stroke(0,0,0,25);
ellipse (0,300,c,d);
ellipse (800,300,c,d);
ellipse (400,300,ab,ba);
fill (0,0,0,0);
point (bb,aa);
strokeWeight (50);
a= a-3;
b= b-6;
c= c-3;
d= d-2;

ab= 100 + 100*sin(ab);
ba= 100 + 100*cos(ba);
aa= 300 + 400*cos(aa);
bb= 300 + 800*sin(bb);

}










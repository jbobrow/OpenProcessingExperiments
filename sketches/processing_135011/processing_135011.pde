
float a1 = 0, a2 = 100, a3 = 200,
b1 = 0, b2 = 0,
c1 = 0, c2 = 0,
d1 = 150, d2 = 0,
e1 = 0, e2 = 0,
f1 = 50, f2 = 0,
g1 = 175, g2 = 100,
h1 = 25, h2 = 75,
i1 = 0, i2 = 0,
j1 = 425, j2 = 0,
k1 = 0, k2 = 0,
l1 = 0, l2 = 0,
m1 = 0, m2 = 0,
n1 = 0, n2 = 0,
o1 = 0, o2 = 0,
p1 = 0, p2 = 0,
q1 = 0, q2 = 0,
r1 = 0, r2 = 0,
s1 = 0, s2 = 0,
t1 = 0, t2 = 0,
u1 = 0, u2 = 0,
v1 = 0, v2 = 0,
w1 = 0, w2 = 0,
x1 = 0, x2 = 0,
y1 = 0, y2 = 0,
z1 = 0, z2 = 0;

int timeD = 0;
int opFill = 50;
PFont f;

void setup(){
 size(500, 500);
 //slows down the key press
  frameRate(10);
  
  f = createFont("Arial",16,true); 
}


void draw(){
if(timeD > 0){
  
  background(207, 180, 150);


//moving shapes
       if(mousePressed){
        //position
       z1= random(-250, 250); z2= random(-250, 250);
       x1= random(0, 450); x2= random(-25, 200);
       c1= random(-50, 250); c2= random(-50, 250);
       v1= random(-100, 300); v2= random(-175, 175);
       b1= random(-350, 50); b2= random(-125, 250);
       n1= random(-250, 75); n2= random(-425, 0);
       m1= random(-250, 75); m2= random(-425, 0);
       //size
       a1= random(0,-200); a2= random(100,500); a3= random(100,500);
       s1= random(0, 200); s2= random(-25, 200);
       d1= random(50, 250);
       f1= random(0 ,200); f2= random(-175, 175);
       g1= random(-100, 0); g2= random(-100, 0);;
       h1= random(-75, 75); h2= random(-75, 75);
       j1= random(300, 400); j2= random(0, 10);
       //rotation
       k1= random(.5);
       l1= random(.5);
       q1= random(.5);
       w1= random(.5);
       e1= random(.5);
       r1= random(.5);
       t1= random(.5);
       
    }
    
    //moving shapes
       if( keyPressed ){
         
      //location
       if( key == 'z' ){ z1= random(-250, 250); z2= random(-250, 250);}
       if( key == 'x' ){ x1= random(0, 450); x2= random(-25, 200);}
       if( key == 'c' ){ c1= random(-50, 250); c2= random(-50, 250);}
       if( key == 'v' ){ v1= random(-100, 300); v2= random(-175, 300);}
       if( key == 'b' ){ b1= random(-350, 50); b2= random(-125, 250);}
       if( key == 'n' ){ n1= random(-250, 75); n2= random(-425, 0);}
       if( key == 'm' ){ m1= random(-250, 75); m2= random(-425, 0);}
      //size
       if( key == 'a' ){ a1= random(0,-100); a2= random(100,500);
                         a3= random(100,500);}
       if( key == 's' ){ s1= random(0, 450); s2= random(-25, 200);}
       if( key == 'd' ){ d1= random(50, 250);}
       if( key == 'f' ){ f1= random(0, 200); f2= random(100, 0);
                         f3= random(0, 200); f4= random(0, 200);}
        
       if( key == 'g' ){ g1= random(-100, 100); g2= random(-100, 100);}
       if( key == 'h' ){ h1= random(-75, 75); h2= random(-75, 75);}
       if( key == 'j' ){ j1= random(300, 400); j2= random(0, 10);}
       
       //rotate
       if( key == 'k' ){ k1= random(.5);}
       if( key == 'l' ){ l1= random(.5);}
       if( key == 'q' ){ q1= random(.5);}
       if( key == 'w' ){ w1= random(.5);}
       if( key == 'e' ){ e1= random(.5);}
       if( key == 'r' ){ r1= random(.5);}
       if( key == 't' ){ t1= random(.5);}
       
       //reset
       if( key == 'y' ){ k1=0;k2=0;m1=0;m2=0;a1=0;a2=100;a3=200;}
       if( key == 'u' ){ z1=0;z2=0;s1=0;s2=0;l1=0;l2=0;}
       if( key == 'i' ){ c1=0;c2=0;d1=150;d2=0;q1=0;q2=0;x1=0;x2=0;f1=50;f2=0;w1=0;w2=0;}
       if( key == 'o' ){ v1=0;v2=0;g1=175;g2=100;e1=0;e2=0;b1=0;b2=0;h1=25;h2=75;r1=0;r2=0;}
       if( key == 'p' ){ n1=0;n2=0;j1=425;j2=0;t1=0;t2=0;}
  }
  
//Group 1 = bottom right square and crosshair lines = M, A, K
pushMatrix();
fill(205, 88, 44);
rotate(k1);
rect(m1+350, m2+350, s1+150, s2+150);
stroke(41, 40, 38);
strokeWeight(2);
line(m1+350, m2+-500, m1+350, m2+1000);
line(m1+-500, m2+350, m1+1000, m2+350);
popMatrix();

//Group 2 = back most shapes diagonal lines = Z, S, l
pushMatrix();
noStroke();
fill(131, 126, 120);
rotate(l1);
quad(z1+a1, z2+500, //bottom left
     z1+50, z2+500, // bottom right
     z1+500, z2+50,  //top right
     z1+500, z2+a1); //top left
fill(41, 40, 38);
quad(z1+50, z2+500, //bottom left
    z1+a2, z2+500, // bottom right
    z1+a3, z2+400, //top right
    z1+175, z2+375);// top left
popMatrix();

//Group 3 = circle and lines over circle = C, D, Q
pushMatrix();
rotate(q1);
ellipseMode(CENTER);
fill(205, 88, 44);
ellipse(c1+175, c2+175, d1, d1);
stroke(41, 40, 38);
strokeWeight(2);
line(c1+75, c2+50, c1+275, c2+150);
line(c1+75, c2+75, c1+275, c2+175);
noStroke();
popMatrix();


//Group 4 = left rectangle = X, F, W
pushMatrix();
rotate(w1);
fill(41, 40, 38);
quad(x1+25, x2+25, // top left
     x1+f1, x2+25, // top right
     x1+f1, x2+275, // bottom right
     x1+25, x2+275); // bottom left
fill(197, 193, 194); 
//small grey quad
quad(x1+25, x2+275, // top left
     x1+0, x2+300, // bottom left
     x1+f1-25, x2+300, // bottom right
     x1+f1, x2+275); // top right
fill(244, 235, 228);
//large white quad
quad(x1+25, x2+275, // bottom right
     x1+0, x2+300, // bottom left
     x1+0, x2+50, // top left
     x1+25, x2+25); // top right
popMatrix();


// Group 5 = triangle = V, G, E
pushMatrix();
rotate(e1);
fill(244, 235, 228);
triangle(v1+g1, v2+g1, // center point
         v1+150, v2+300, // right
         v1+g2, v2+250); // left
fill(41, 40, 38);
triangle(v1+g1, v2+g1, // center point
         v1+150, v2+325, // left
         v1+150, v2+300); // right
fill(197, 193, 194);
triangle(v1+g2, v2+250, // left
         v1+150, v2+300, // center
         v1+150, v2+325); // right
popMatrix();


// Group 6 = series of rectangles on the right = B, H, R
pushMatrix();
rotate(r1);
fill(197, 193, 194);
rect(b1+350, b2+100, h1, h2);
rect(b1+400, b2+150, h1, h2);
rect(b1+450, b2+200, h1, h2);
popMatrix();


// Group 7 = top most shapes bottom right rectangle = N, J, T
pushMatrix();
rotate(t1);
noStroke();
fill(244, 235, 228);
//white quad
quad(n1+250, n2+j1, //top left
     n1+250, n2+450, // bottom left
     n1+400, n2+450, // bottom right
     n1+400, n2+j1); // top right
fill(197, 193, 194);
//grey quad
quad(n1+250, n2+450, // top left
     n1+275, n2+475, // bottom left
     n1+425, n2+475, // bottom right
     n1+400, n2+450); // top right
fill(41, 40, 38);
//black quad
quad(n1+400, n2+j1, // top left
     n1+400, n2+450, // bottom left
     n1+425, n2+475, // bottom right
     n1+425, n2+j1+25); // top right
popMatrix();
}

if(timeD <= 0){
background(207, 180, 150);
  
  if (mousePressed){
    timeD = timeD +1;
  }
    if (keyPressed){
    timeD = timeD +1;
  }

//bottom right square and crosshair lines
fill(205, 88, 44, opFill);
rect(350, 350, 500, 500);
stroke(41, 40, 38, opFill);
strokeWeight(2);
line(350, 0, 350, 500);
line(0, 350, 500, 350);
noStroke();

//back most shapes diagonal lines
noStroke();
fill(131, 126, 120, opFill);
quad(0, 500, 50, 500, 500, 50, 500, 0);
fill(41, 40, 38, opFill);
quad(50, 500, 100, 500, 200, 400, 175, 375);

//left rectangle
fill(41, 40, 38, opFill);
rect(25, 25, 25, 250);
fill(197, 193, 194, opFill);
quad(25, 275, 0, 300, 25, 300, 50, 275);
fill(244, 235, 228, opFill);
quad(25, 275, 0, 300, 0, 50, 25, 25);

//circle and lines over circle
ellipseMode(CENTER);
fill(205, 88, 44, opFill);
ellipse(175, 175, 150, 150);
stroke(41, 40, 38, opFill);
strokeWeight(2);
line(75, 50, 275, 150);
line(75, 75, 275, 175);
noStroke();

//triangle
fill(244, 235, 228, opFill);
triangle(175, 175, 150, 300, 100, 250);
fill(41, 40, 38, opFill);
triangle(175, 175, 150, 325, 150, 300);
fill(197, 193, 194, opFill);
quad(100, 250, 100, 275, 150, 325, 150, 300);

//series of rectangles on the right
fill(197, 193, 194, opFill);
rect(350, 100, 25, 75);
rect(400, 150, 25, 75);
rect(450, 200, 25, 75);

//top most shapes bottom right rectangle
noStroke();
fill(244, 235, 228, opFill);
rect(250, 425, 150, 25);
fill(197, 193, 194, opFill);
quad(250, 450, 275, 475, 425, 475, 400, 450);
fill(41, 40, 38, opFill);
quad(400, 425, 400, 450, 425, 475, 425, 450);
 
 
  textFont(f); 
  fill(0);
 textAlign(CENTER);
  text("Use the Keyboard Letters or Mouse",width/2, height/2);
}

}
/*My composition is inspired by El Lissitzky, an avante garde russian artist
that inspired the constructivist and the Bauhaus. Most of his early work was
very minimilist, only containing a few shapes and a strict color pallet of red,
tans and grays. I used all of these minimilist ideas to create my own composition
following a lot of unseen rules he creates for himself. Most of his work is set
on some sort of grid, having each shape line up in a way. He also believes that
the most powerful shape is the triangle, as seen in multiple of El Lissitzky’s works,
it is suppose to represent strength and prosperity.*/



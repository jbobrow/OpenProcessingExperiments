
//x values
float z1 = 0;
float x1 = 0;
float c1 = 0;
float v1 = 0;
float b1 = 0;
float n1 = 0;
float m1 = 0;
//y values
float z2 = 0;
float x2 = 0;
float c2 = 0;
float v2 = 0;
float b2 = 0;
float n2 = 0;
float m2 = 0;

void setup(){
 size(500, 500);
 //slows down the key press
  frameRate(15);
}

void draw(){
// static shapes
  //background
background(207, 180, 150);
//moving shapes
       if( keyPressed ){
       if( key == 'z' ){ z1= random(-250, 250); z2= random(-250, 250);}
       if( key == 'x' ){ x1= random(0, 450); x2= random(-25, 200);}
       if( key == 'c' ){ c1= random(-50, 250); c2= random(-50, 250);}
       if( key == 'v' ){ v1= random(-100, 300); v2= random(-175, 175);}
       if( key == 'b' ){ b1= random(-350, 50); b2= random(-125, 250);}
       if( key == 'n' ){ n1= random(-250, 75); n2= random(-425, 0);}
       if( key == 'm' ){ m1= random(-250, 75); m2= random(-425, 0);}
    }
  
//M = bottom right square and crosshair lines
fill(205, 88, 44);
rect(m1+350, m2+350, 150, 150);
stroke(41, 40, 38);
strokeWeight(2);
line(m1+350, m2+-500, m1+350, m2+1000);
line(m1+-500, m2+350, m1+1000, m2+350);
noStroke();

  
// Z = back most shapes diagonal lines
noStroke();
fill(131, 126, 120);
quad(z1+0, z2+500, z1+50, z2+500, z1+500, z2+50, z1+500, z2+0);
fill(41, 40, 38);
quad(z1+50, z2+500, z1+100, z2+500, z1+200, z2+400, z1+175, z2+375);

// C = circle and lines over circle
ellipseMode(CENTER);
fill(205, 88, 44);
ellipse(c1+175, c2+175, 150, 150);
stroke(41, 40, 38);
strokeWeight(2);
line(c1+75, c2+50, c1+275, c2+150);
line(c1+75, c2+75, c1+275, c2+175);
noStroke();

// X = left rectangle
fill(41, 40, 38);
rect(x1+25, x2+25, 25, 250);
fill(197, 193, 194);
quad(x1+25, x2+275, x1+0, x2+300, x1+25, x2+300, x1+50, x2+275);
fill(244, 235, 228);
quad(x1+25, x2+275, x1+0, x2+300, x1+0, x2+50, x1+25, x2+25);

// V = triangle
fill(244, 235, 228);
triangle(v1+175, v2+175, v1+150, v2+300, v1+100, v2+250);
fill(41, 40, 38);
triangle(v1+175, v2+175, v1+150, v2+325, v1+150, v2+300);
fill(197, 193, 194);
quad(v1+100, v2+250, v1+100, v2+275, v1+150, v2+325, v1+150, v2+300);

// B = series of rectangles on the right
fill(197, 193, 194);
rect(b1+350, b2+100, 25, 75);
rect(b1+400, b2+150, 25, 75);
rect(b1+450, b2+200, 25, 75);

// N = top most shapes bottom right rectangle
noStroke();
fill(244, 235, 228);
rect(n1+250, n2+425, 150, 25);
fill(197, 193, 194);
quad(n1+250, n2+450, n1+275, n2+475, n1+425, n2+475, n1+400, n2+450);
fill(41, 40, 38);
quad(n1+400, n2+425, n1+400, n2+450, n1+425, n2+475, n1+425, n2+450);
}
//My composition is inspired by El Lissitzky, an avante garde russian artist that inspired the constructivist and the Bauhaus. Most of his early work was very minimilist, only containing a few shapes and a strict color pallet of red, tans and grays. I used all of these minimilist ideas to create my own composition following a lot of unseen rules he creates for himself. Most of his work is set on some sort of grid, having each shape line up in a way. He also believes that the most powerful shape is the triangle, as seen in multiple of El Lissitzky’s works, it is suppose to represent strength and prosperity.



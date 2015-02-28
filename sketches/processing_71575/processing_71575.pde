
//background setup
size(500, 500);
background(255);
int rectS=15;//rectangle size
noStroke();
smooth();

PImage smoke=loadImage("color_smoke.jpg");
image(smoke, 0, 0, width, height);

//assigning
int w1 = width/rectS;
int h1 = height/rectS;

//top-left rectangles
for (int i=0;i<3;i++) {
  for (int j=0;j<3;j++) {
    if ((i+j)%2==0) {
      fill(0);
    }
    else {
      fill(255);
    }
    rect(i*w1, j*h1, w1, h1);
  }
}

//floating rectangles
fill(50);
rect(w1*4, h1, w1, h1);
fill(100);
rect(w1*4, h1*4, w1, h1);
rect(w1*5, h1*3, w1, h1);
fill(150);
rect(w1, h1*5, w1, h1);
fill(200);
rect(w1*3, h1*6, w1, h1);
fill(230);
rect(w1*6, h1*6, w1, h1);
fill(230);
rect(w1*8, h1*5, w1, h1);

//transformation
noFill();
int x=width/2;
int y=height/2;
int sides=5;
int polyS=width/30;

fill(#DE4343);
beginShape();//pentagon
for (int i=0;i<=sides;i++) {
  float xx= x+polyS*cos(i*TWO_PI/sides);
  float yy= y+polyS*sin(i*TWO_PI/sides);
  vertex(xx+(width/10), yy);
}
endShape();

fill(#F08741);
beginShape();//hexagon
for (int i=0;i<=sides+1;i++) {
  float xx= x+polyS*cos(i*TWO_PI/(sides+1));
  float yy= y+polyS*sin(i*TWO_PI/(sides+1));
  vertex(xx+(width/4), yy+(height/20));
}
endShape();

fill(#F4F559);
beginShape();//heptagon
for (int i=0;i<=sides+2;i++) {
  float xx= x+polyS*cos(i*TWO_PI/(sides+2));
  float yy= y+polyS*sin(i*TWO_PI/(sides+2));
  vertex(xx, yy+(height/8));
}
endShape();

fill(#0B56D3);
beginShape();//octagon
for (int i=0;i<=sides+3;i++) {
  float xx= x+polyS*cos(i*TWO_PI/(sides+3));
  float yy= y+polyS*sin(i*TWO_PI/(sides+3));
  vertex(xx+(width/8), yy+(height/5));
}
endShape();

fill(#10C411);
beginShape();//nonagon
for (int i=0;i<=sides+4;i++) {
  float xx= x+polyS*cos(i*TWO_PI/(sides+4));
  float yy= y+polyS*sin(i*TWO_PI/(sides+4));
  vertex(xx+(width/5), yy+(height/3));
}
endShape();

//assigning
int circleS=15;//circle size
int w2=width/circleS;
int h2=height/circleS;
//color setting
color or=color(#F57D05);
color ye=color(#F7F700);
color bl=color(#0B56D3);
color gr=color(#02BF03);
//right-bottom circles
for (int i=0;i<3;i++) {
  for (int j=0;j<3;j++) {
    if ((i+j)==4) {
      fill(#FF0000);
    }
    else if ((i+j)==3) {
      fill(or);
    }
    else if ((i+j)==2) {
      fill(ye);
    }
    else if ((i+j)==1) {
      fill(gr);
    }
    else {
      fill(bl);
    }
    ellipse((width-w2/2)-i*w2, (height-h2/2)-j*h2, w2, h2);
  }
}



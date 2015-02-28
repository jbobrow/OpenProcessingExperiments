

int legHeight=60;
int x = 300;
int y = 120;
float easing =0.02;

void setup() {
  size(600,440);
  smooth();
}

void draw() {
  int targetX =mouseX;
  x +=(targetX -x) * easing;
  
  if (mousePressed) {
    legHeight=40;
  }else {
    legHeight=60;
  }
  
  
background(240);


//Wheel
fill(20);
ellipse(x+10,y+255,120,120);
fill(200);
stroke(255);
ellipse(x+10,y+255,80,80);

//Leg
fill(200);
stroke(0);
rect(x,y+160-legHeight+60,20,legHeight+30);
rect(x-5,y+180,30,60);
ellipse(x+10,y+255,25,25);

//Body
fill(200);
beginShape();
vertex(x-40,y+20 -legHeight +60);
vertex(x+40,y+20 -legHeight +60);
vertex(x+80,y+60 -legHeight +60);
vertex(x+80,y+160 -legHeight +60);
vertex(x-40,y+160 -legHeight +60);
endShape(CLOSE);

fill(100);
rect(x-35,y+25 -legHeight +60,5,130);
rect(x-25,y+25 -legHeight +60,5,130);

//Head
fill(200);
rect(x,y -legHeight +60,20,20);
rect(x-5,y-40 -legHeight +60,50,40);
rect(x+35,y-50 -legHeight +60,5,10);
line(x+37,y-70 -legHeight +60,x+37,y-50 -legHeight +60);
ellipse(x+10,y-20 -legHeight +60,55,55);
fill(20);
ellipse(x+10,y-20 -legHeight +60,45,45);
fill(255);
ellipse(x+22,y-20 -legHeight +60,12,24);



}



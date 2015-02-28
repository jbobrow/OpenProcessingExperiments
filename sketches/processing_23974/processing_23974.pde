
float r = 50;
float g = 100;
float b = 150;
float a = 0;
float m;
float n;
float l;
float t;
float d; 
float p;

void setup(){
  size(500,500);
  background(175);
}

int value = 0; 

void draw(){

if (mouseX > width/2 && mouseY < height/2) {
  b = b - 1; g = g - 1; r = r + 1;}  else { b = b + 1; g = g + 1; r = r - 1;} 
  
  b = constrain (b,0,200); 
  g = constrain (g,0,170);
  r = constrain (r,0,255);

background(r,g,b);

//land
noStroke();
fill(35,75,36);
rectMode(CENTER);  
rect(250,375,500,300);

if (mouseX > width/2 && mouseY < height/2 && mousePressed) 
{m = random(0,500); n= random(0,500);}
else {m = 0; n = 0;}

smooth();
noFill();
strokeWeight(10); 
stroke(255);
curve(250,400,250,330,400,150,m,n);



//ears
if(mousePressed) {l = 170; t = 330;}
else {l = 160; t=340;}

if(mouseX>width/2 && mouseY<height/2 || mousePressed) {l = random(160,170); t = random(330,340);}
else {l=160; t = 340;}

smooth();
strokeWeight(1);
fill(255);
triangle(170,130,l,40,width/2,80);
triangle(330,130,t,40,width/2,80);
//inner ears
fill(240,161,180);
triangle(170,130,l,40,200,80);
triangle(330,130,t,40,300,80);
//inner ears shading
noStroke();
fill(214,136,154);
triangle(170,130,175,55,200,80);
triangle(330,130,329,55,300,80);

//body
stroke(0);
fill(255);
rectMode(CENTER);
rect(width/2,height/2,100,200);

//legs
ellipseMode(CENTER);

fill(246);
ellipse(300,320,50,80);
ellipse(200,320,50,80);
fill(255);
ellipse(310,355,50,40);
ellipse(190,355,50,40);

ellipse(300,height/2,50,60);
ellipse(200,250,50,60);
line(200,270,200,280);
line(300,270,300,280);
line(190,265,190,280);
line(290,265,290,280);
line(210,265,210,280);
line(310,265,310,280);

//head
stroke(0);
fill(255);
smooth();
ellipse(width/2,150,180,180);
//body

//eyes
if(mousePressed && mouseX > width/2 && mouseY < 160) {d = d + 1; p = p + 1;}
else {d = d - 1; p = p - 1;} 

d = constrain(d,211,255);
p = constrain(p,124,255);

fill(d,36,139);
ellipseMode(CENTER);
ellipse(215,140,20,20);
ellipse(285,140,20,20);

//iris
fill(p,1,24);
ellipse(215,140,10,10);
ellipse(285,140,10,10);

//reflection
fill(255);
ellipse(211,135,5,5);
ellipse(281,135,5,5);
//mouth
  


fill(255);
stroke(0);
arc(240,185,20,20,0,PI);
arc(260,185,20,20,0,PI);



}



                

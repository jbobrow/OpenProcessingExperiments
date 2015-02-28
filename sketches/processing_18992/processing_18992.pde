
void setup(){
  size (400,400);
background(137,238,255);
frameRate(50);
fill(50,124,61);
noStroke();
rectMode(CORNERS);
rect(0,335,400,400);
colorMode(RGB);
}

int time = 0;
float x = 0;
float y = 0;
float z = 0;
float s = 0;
float t = 0;

void draw(){
  smooth();
  colorMode(RGB);
  fill(0);
  ellipseMode(CENTER);
  ellipse(110,115,75,75);
  stroke(0);
  strokeWeight(12);
  line(110,115,110,255);
  line(110,255,160,355);
  line(110,255,60,355);
  line(110,185,180,185);
  line(110,185,60,235);
  fill(255);
  
  noStroke();
  rectMode(CENTER);
  rect(110,105,60,15);
  stroke(0);
  strokeWeight(5);
  point(95,105);
   point(125,105);
  strokeWeight(1);
   fill(82,141,255,200);
  ellipse(280,180,40,50);
  colorMode(HSB,width);
 fill(x,400,400);
  ellipse(280,200,100,20);
  colorMode(RGB);
  noStroke();
  fill(0,400,0);
  ellipse(280,170,20,20);
  stroke(0,400,0);
  strokeWeight(3);
  line(280,170,280,188);
  stroke(0);
  strokeWeight(1);
  fill(400);
  ellipse(280,170,15,15);
  fill(0);
  ellipse(278,168,5,5);

strokeWeight(5);
stroke(0);
line(180,185,180,185-t);

for(int k= 50;k<350;k+=50){
  fill(400);
  noStroke();

  ellipse(k,20,80,80);
}
fill(0);

  time++;
  x++;
  y++;
  z++;
  s++;
  t++;

if(t>20){
  t=20;
}

if(time > 100){
  strokeWeight(1);
  
  triangle(290-x,200,340-x,202,340-x,198); 
  if(x>200){
    x=200;
    noStroke();
    fill(400,0,0);
    ellipseMode(CORNER);
    ellipse(110,198,5,y-200);
    time++;
 
  }

 if(y>350){
   y=350;
  ellipseMode(CENTER);
  ellipse(110,350,z-350,s-350); 
  
}
if(z>410){
  z=410;
}
if(s>375){
  s=375;
  fill(0);
  stroke(0);
 strokeWeight(5);
  
  line(85,95,105,115);
  line(105,95,85,115);
   line(115,95,135,115);
  line(135,95,115,115);
  
}

}

}



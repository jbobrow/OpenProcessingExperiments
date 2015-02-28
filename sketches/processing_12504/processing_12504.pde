
void setup(){
size(400,400);
background(255);
smooth();

beginShape(QUADS);
fill(255,255,0);
vertex(0,0);
vertex(width,0);
fill(0,0,255);
vertex(width,height);
vertex(0,height);
endShape(); 

for (int i=455; i>0; i--){
 noStroke();
 fill(255-i);
 ellipse(width/2, height/2, i, i);
}



//branch
fill(200,50,0);
point(0.6,303);
point(127,300);
point(225,298);
point(270,300.6);
point(342,308);
point(399,314);
strokeWeight(15);
stroke(200,50,0);
fill(200,50,0);
line(0.6,303,127,300);
line(127,300,225,298);
line(225,298,270,300.6);
line(270,300.6,342,308);
line(342,308,399,314);

//feet
{stroke(100,200,100);
strokeWeight(5);
point(90,297);
point(65,310);
line(90,297,65,310);
point(137,297);
point(165,298);
line(137,297,165,298);
point(196,280);
point(181,298);
line(196,280,181,298);
point(215,280);
point(225,298);
line(215,280,225,298);}

//wings

noStroke();
fill(100,200,200);
triangle(30,216,205,216,115,165);

//body (and wings)
fill(100,100,255);
noStroke();
ellipse(116,232,116,154);
fill(100,200,200);
triangle(164,150,260,150,204,94);
fill(100,100,150);
ellipse(315,202,150,280);
triangle(400,200,300,200,350,100);
fill(100,200,200);
ellipse(207,202,84,204);

fill(100,200,0);
ellipse(263,270,100,100);

triangle(190,270,340,270,263,250);




//eyes

int z=40;
/*
noFill();
colorMode(RGB, width);
for (int d=70; d>0; d-=10){
  stroke(d*2,0,z/3);
  ellipse(93,200,d,d);
}
*/

{
strokeWeight(1);
float radius = 0.0;
for (int deg=0; deg <360*3; deg +=20){
  float angle = radians(deg);
  float x =93 + (cos(angle) * radius);
  float y =200 + (sin(angle) * radius);
  ellipse(x,y,6,6);
  radius = radius + 0.10;

//

  float a =135 + (cos(angle) * radius);
  float b =200 + (sin(angle) * radius);
  ellipse(a,b,6,6);
  radius = radius + 0.34;
}}
 { 
strokeWeight(1);
float radius = 0.0;
for (int deg=0; deg <360*3; deg +=30){
  float angle = radians(deg);
  stroke(100,100,100);
  float c =185 + (cos(angle) * radius);
  float d =150 + (sin(angle) * radius);
  ellipse(c,d,6,6);
  radius = radius + 0.34;

  strokeWeight(1);
  float e =220 + (cos(angle) * radius);
  float f =150 + (sin(angle) * radius);
  ellipse(e,f,6,6);
  radius = radius + 0.34;
}}

   { 
strokeWeight(2);
float radius = 0.0;
for (int deg=0; deg <360*4; deg +=30){
  float angle = radians(deg);
  stroke(100,100,250);
  float g =285 + (cos(angle) * radius);
  float h =150 + (sin(angle) * radius);
  ellipse(g,h,6,6);
  radius = radius + 0.34;

  strokeWeight(2);
  float i =350 + (cos(angle) * radius);
  float j =150 + (sin(angle) * radius);
  ellipse(i,j,6,6);
  radius = radius + 0.34;
}}
  
   { 
strokeWeight(5);
float radius = 0.0;
for (int deg=0; deg <360*6; deg +=80){
  float angle = radians(deg);
  stroke(250,100,250);
  float k =240 + (cos(angle) * radius);
  float l =260 + (sin(angle) * radius);
  ellipse(k,l,6,6);
  radius = radius + 0.34;

  strokeWeight(5);
  float m =280 + (cos(angle) * radius);
  float n =260 + (sin(angle) * radius);
  ellipse(m,n,6,6);
  radius = radius + 0.34;
}}

//beaks

strokeWeight(3);
stroke(200,100,200);
triangle(108,226,125,226,116,240);

strokeWeight(1);
stroke(100,100,250);
triangle(200,240,220,190,190,190);

stroke(4);
stroke(0,200,150);
triangle(300,200,320,200,310,250);


  

}
  



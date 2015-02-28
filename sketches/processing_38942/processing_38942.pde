
int x = 400;
int y = 600;
 float a = int(random(x));
float b = int(random(y));
float c = int(random(x));
float d = int(random(y));
float e = int(random(x)); 
float f = int(random(y));
float g = int(random(x));
float h = int(random(y));
float i = int(random(x));
float j = int(random(y));
float k = int(random(x)); 
float l = int(random(y));
float m = int(random(x));
float n = int(random(y));
float o = int(random(x));
float p = int(random(y));
float q = int(random(x)); 
float r = int(random(y));
float s = int(random(x));
float t = int(random(y));
PImage bg;
float angle = 0.0;
float offset = 160;
float scalar = 300;
float speed = 0.05;


void setup(){
size(600, 400);
frameRate(30);

  
  


}
 



void draw(){
// tony's edition start
  bg = loadImage("space.jpg");
  background (0);
  smooth();
  float y1 = offset + sin(angle) * scalar;
  float y2 = offset + sin(angle + 0.4) * scalar;
   float y3 = offset + sin(angle + 0.8) * scalar;
   float y4 = offset + sin(angle + 1.2) * scalar;
   float y5 = offset + sin(angle + 1.4) * scalar;
   float y6 = offset + sin(angle + 1.6) * scalar;
   float y7 = offset + sin(angle + 2.4) * scalar;
   float y8 = offset + sin(angle + 3.0) * scalar;
   float y9 = offset + sin(angle + 4.0) * scalar;
   float y10 = offset +sin(angle + 5.0) * scalar;

noStroke();
fill(random(255), random(255), random(255));
ellipse(a, y1, 30, 30);
fill(random(255), random(255), random(255));
ellipse(c, y2, 30, 30);
fill(random(255), random(255), random(255));
ellipse(e, y3, 30, 30);
fill(random(255), random(255), random(255));
ellipse(g, y4, 30, 30);
fill(random(255), random(255), random(255));
ellipse(i, y5, 30, 30);
fill(random(255), random(255), random(255));
ellipse(k, y6, 30, 30);
fill(random(255), random(255), random(255));
ellipse(m, y7, 30, 30);
fill(random(255), random(255), random(255));
ellipse(o, y8, 30, 30);
fill(random(255), random(255), random(255));
ellipse(q, y9, 30, 30);
fill(random(255), random(255), random(255));
ellipse(s, y10, 30, 30);
angle += speed;


  rectMode(CENTER);
  fill(mouseX/3, mouseY/2, 255);
  rect(mouseX, mouseY, 50, 25);


if(mousePressed){
  
    rectMode(CENTER);
  fill(mouseX/3, mouseY/2, 255);
  rect(mouseX, mouseY, 50, 25);
  
  noStroke();
fill(random(255), random(255), random(255));
ellipse(a, y1, 30, 30);
fill(random(255), random(255), random(255));
ellipse(c, y2, 30, 30);
fill(random(255), random(255), random(255));
ellipse(e, y3, 30, 30);
fill(random(255), random(255), random(255));
ellipse(g, y4, 30, 30);
fill(random(255), random(255), random(255));
ellipse(i, y5, 30, 30);
fill(random(255), random(255), random(255));
ellipse(k, y6, 30, 30);
fill(random(255), random(255), random(255));
ellipse(m, y7, 30, 30);
fill(random(255), random(255), random(255));
ellipse(o, y8, 30, 30);
fill(random(255), random(255), random(255));
ellipse(q, y9, 30, 30);
fill(random(255), random(255), random(255));
ellipse(s, y10, 30, 30);
  
 
  if(mouseX <= width/2){
  
  for(int x=mouseX; x<=width; x+=1){
    fill(255);
    rect(x, mouseY, 2, 2);
if (x ==a && mouseY <= (y1+15) && mouseY >= (y1-15))
{
  fill(0);
  ellipse(a, b, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(a, y1, a+100, y1+100);
  line(a, y1, a, y1+100);
  line(a, y1, a+100, y1);
  line(a, y1, a, y1-100);
  line(a, y1, a-100, y1);
  line(a, y1, a+100, y1-100);
  line(a, y1, a-100, y1+100);
  line(a, y1, a-100, y1-100);
  
  a=width+30;
  y1=height+30;
}
  if (x ==c && mouseY <= (y2+15) && mouseY >= (y2-15))
{
  fill(0);
  ellipse(c, y2, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(c, y2, c+100, y2+100);
  line(c, y2, c, y2+100);
  line(c, y2, c+100, y2);
  line(c, y2, c, y2-100);
  line(c, y2, c-100, y2);
  line(c, y2, c+100, y2-100);
  line(c, y2, c-100, y2+100);
  line(c, y2, c-100, y2-100);
  
    c=width+30;
  y2=height+30;
}
if (x ==e && mouseY <= (y3+15) && mouseY >= (y3-15))
{
  fill(0);
  ellipse(e, y3, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(e, y3, e+100, y3+100);
  line(e, y3, e, y3+100);
  line(e, y3, e+100, y3);
  line(e, y3, e, y3-100);
  line(e, y3, e-100, y3);
  line(e, y3, e+100, y3-100);
  line(e, y3, e-100, y3+100);
  line(e, y3, e-100, y3-100);
    e=width+30;
  y3=height+30;
  
}
if (x ==g && mouseY <= (y4+15) && mouseY >= (y4-15))
{
  fill(0);
  ellipse(g, y4, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(g, y4, g+100, y4+100);
  line(g, y4, g, y4+100);
  line(g, y4, g+100, y4);
  line(g, y4, g, y4-100);
  line(g, y4, g-100, y4);
  line(g, y4, g+100, y4-100);
  line(g, y4, g-100, y4+100);
  line(g, y4, g-100, y4-100);
  
    g=width+30;
  y4=height+30;
}
if (x ==i && mouseY <= (y5+15) && mouseY >= (y5-15))
{
  fill(0);
  ellipse(i, y5, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(i, y5, i+100, y5+100);
  line(i, y5, i, y5+100);
  line(i, y5, i+100, y5);
  line(i, y5, i, y5-100);
  line(i, y5, i-100, y5);
  line(i, y5, i+100, y5-100);
  line(i, y5, i-100, y5+100);
  line(i, y5, i-100, y5-100);
  
    i=width+30;
  y5=height+30;
}
if (x ==k && mouseY <= (y6+15) && mouseY >= (y6-15))
{
  fill(0);
  ellipse(k, y6, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(k, y6, k+100, y6+100);
  line(k, y6, k, y6+100);
  line(k, y6, k+100, y6);
  line(k, y6, k, y6-100);
  line(k, y6, k-100, y6);
  line(k, y6, k+100, y6-100);
  line(k, y6, k-100, y6+100);
  line(k, y6, k-100, y6-100);
  
    k=width+30;
  y6=height+30;
}
if (x ==m && mouseY <= (y7+15) && mouseY >= (y7-15))
{
  fill(0);
  ellipse(m, y7, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(m, y7, m+100, y7+100);
  line(m, y7, m, y7+100);
  line(m, y7, m+100, y7);
  line(m, y7, m, y7-100);
  line(m, y7, m-100, y7);
  line(m, y7, m+100, y7-100);
  line(m, y7, m-100, y7+100);
  line(m, y7, m-100, y7-100);
  
    m=width+30;
  y7=height+30;
}
if (x ==o && mouseY <= (y8+15) && mouseY >= (y8-15))
{
  fill(0);
  ellipse(o, y8, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(o, y8, o+100, y8+100);
  line(o, y8, o, y8+100);
  line(o, y8, o+100, y8);
  line(o, y8, o, y8-100);
  line(o, y8, o-100, y8);
  line(o, y8, o+100, y8-100);
  line(o, y8, o-100, y8+100);
  line(o, y8, o-100, y8-100);
  
    o=width+30;
  y8=height+30;
}
if (x ==q && mouseY <= (y9+15) && mouseY >= (y9-15))
{
  fill(0);
  ellipse(q, y9, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(q, y9, q+100, y9+100);
  line(q, y9, q, y9+100);
  line(q, y9, q+100, y9);
  line(q, y9, q, y9-100);
  line(q, y9, q-100, y9);
  line(q, y9, q+100, y9-100);
  line(q, y9, q-100, y9+100);
  line(q, y9, q-100, y9-100);
  
    q=width+30;
  y9=height+30;
}
if (x ==s && mouseY <= (y10+15) && mouseY >= (y10-15))
{
  fill(0);
  ellipse(s, y10, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(s, y10, s+100, y10+100);
  line(s, y10, s, y10+100);
  line(s, y10, s+100, y10);
  line(s, y10, s, y10-100);
  line(s, y10, s-100, y10);
  line(s, y10, s+100, y10-100);
  line(s, y10, s-100, y10+100);
  line(s, y10, s-100, y10-100);
  
    s=width+30;
  y10=height+30;
}
  }
  }
  else
  {
  for(int x=mouseX; x>=0; x-=1){
    fill(255);
    rect(x, mouseY, 2, 2);
    
    if (x ==a && mouseY <= (y1+15) && mouseY >= (y1-15))
{
  fill(0);
  ellipse(a, y1, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(a, y1, a+100, y1+100);
  line(a, y1, a, y1+100);
  line(a, y1, a+100, y1);
  line(a, y1, a, y1-100);
  line(a, y1, a-100, y1);
  line(a, y1, a+100, y1-100);
  line(a, y1, a-100, y1+100);
  line(a, y1, a-100, y1-100);
  
    a=width+30;
  y1=height+30;
}
  if (x ==c && mouseY <= (y2+15) && mouseY >= (y2-15))
{
  fill(0);
  ellipse(c, y2, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(c, y2, c+100, y2+100);
  line(c, y2, c, y2+100);
  line(c, y2, c+100, y2);
  line(c, y2, c, y2-100);
  line(c, y2, c-100, y2);
  line(c, y2, c+100, y2-100);
  line(c, y2, c-100, y2+100);
  line(c, y2, c-100, y2-100);
  
    c=width+30;
  y2=height+30;
}
      if (x ==e && mouseY <= (y3+15) && mouseY >= (y3-15))
{
  fill(0);
  ellipse(e, y3, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(e, y3, e+100, y3+100);
  line(e, y3, e, y3+100);
  line(e, y3, e+100, y3);
  line(e, y3, e, y3-100);
  line(e, y3, e-100, y3);
  line(e, y3, e+100, y3-100);
  line(e, y3, e-100, y3+100);
  line(e, y3, e-100, y3-100);
  
    e=width+30;
  y3=height+30;
}

     if (x ==g && mouseY <= (y4+15) && mouseY >= (y4-15))
{
  fill(0);
  ellipse(g, y4, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(g, y4, g+100, y4+100);
  line(g, y4, g, y4+100);
  line(g, y4, g+100, y4);
  line(g, y4, g, y4-100);
  line(g, y4, g-100, y4);
  line(g, y4, g+100, y4-100);
  line(g, y4, g-100, y4+100);
  line(g, y4, g-100, y4-100);
  
    g=width+30;
  y4=height+30;
}

   if (x ==i && mouseY <= (y5+15) && mouseY >= (y5-15))
{
  fill(0);
  ellipse(i, y5, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(i, y5, i+100, y5+100);
  line(i, y5, i, y5+100);
  line(i, y5, i+100, y5);
  line(i, y5, i, y5-100);
  line(i, y5, i-100, y5);
  line(i, y5, i+100, y5-100);
  line(i, y5, i-100, y5+100);
  line(i, y5, i-100, y5-100);
  
    i=width+30;
  y5=height+30;
}

 if (x ==k && mouseY <= (y6+15) && mouseY >= (y6-15))
{
  fill(0);
  ellipse(k, y6, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(k, y6, k+100, y6+100);
  line(k, y6, k, y6+100);
  line(k, y6, k+100, y6);
  line(k, y6, k, y6-100);
  line(k, y6, k-100, y6);
  line(k, y6, k+100, y6-100);
  line(k, y6, k-100, y6+100);
  line(k, y6, k-100, y6-100);
  
    k=width+30;
  y6=height+30;
}
if (x ==m && mouseY <= (y7+15) && mouseY >= (y7-15))
{
  fill(0);
  ellipse(m, y7, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(m, y7, m+100, y7+100);
  line(m, y7, m, y7+100);
  line(m, y7, m+100, y7);
  line(m, y7, m, y7-100);
  line(m, y7, m-100, y7);
  line(m, y7, m+100, y7-100);
  line(m, y7, m-100, y7+100);
  line(m, y7, m-100, y7-100);
  
    m=width+30;
  y7=height+30;
}
if (x ==o && mouseY <= (y8+15) && mouseY >= (y8-15))
{
  fill(0);
  ellipse(o, y8, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(o, y8, o+100, y8+100);
  line(o, y8, o, y8+100);
  line(o, y8, o+100, y8);
  line(o, y8, o, y8-100);
  line(o, y8, o-100, y8);
  line(o, y8, o+100, y8-100);
  line(o, y8, o-100, y8+100);
  line(o, y8, o-100, y8-100);
  
    o=width+30;
  y8=height+30;
}
if (x ==q && mouseY <= (y9+15) && mouseY >= (y9-15))
{
  fill(0);
  ellipse(q, y9, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(q, y9, q+100, y9+100);
  line(q, y9, q, y9+100);
  line(q, y9, q+100, y9);
  line(q, y9, q, y9-100);
  line(q, y9, q-100, y9);
  line(q, y9, q+100, y9-100);
  line(q, y9, q-100, y9+100);
  line(q, y9, q-100, y9-100);
  
    q=width+30;
  y9=height+30;
}
if (x ==s && mouseY <= (y10+15) && mouseY >= (y10-15))
{
  fill(0);
  ellipse(s, y10, 30, 30);
  stroke(255);
  strokeWeight(5);
  line(s, y10, s+100, y10+100);
  line(s, y10, s, y10+100);
  line(s, y10, s+100, y10);
  line(s, y10, s, y10-100);
  line(s, y10, s-100, y10);
  line(s, y10, s+100, y10-100);
  line(s, y10, s-100, y10+100);
  line(s, y10, s-100, y10-100);
  
    s=width+30;
  y10=height+30;
}
  }
  }
}
  if(a==c && c==e && e==g && g==i && i==k && k==m && m==o && o==q && q==s) {
  print("You Win!");
    exit();
  }
   
}



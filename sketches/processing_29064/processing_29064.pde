
float p,c,d,e,f,g,h,i,j,k;

void setup(){
  size(400,400);
 smooth();
 strokeWeight(1);
c=60;
d=0;
e=0;
f=0;
g=0;
h=0;
i=0;
j=0;
k=0;
}
void draw(){
  stroke(random(255));
p=random(0,255);
d=map(c,0,400,0,200);
e=map(d,0,400,0,200);
f=map(e,0,400,0,200);
g=map(f,0,400,0,200); 
h=map(g,0,400,0,200);
i=map(h,0,400,0,200);
j=map(i,0,400,0,200);
k=map(j,0,400,0,200);
  background(255,random(0,255),random(0,125));
   fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,c+20,c+20);
    fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,d+40,d+40);
 fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,e+60,e+60);
   fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,f+80,f+80);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,g+100,g+100);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,h+120,h+120);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,i+140,i+140); 
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,j+160,j+160);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,k+180,k+180);
  fill(random(255));
 
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,c,c);
    fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,d,d);
 fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,e,e);
   fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,f,f);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,g,g);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,h,h);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,i,i); 
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,j,j);
  fill(random(255));
  ellipseMode(CENTER);
  ellipse(200,200,k,k);

  c++;


}


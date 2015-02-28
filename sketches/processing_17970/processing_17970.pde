

float x=0;
float y=0;
boolean drawstuff=true;
float strokesize=1;
float r=0;
float g=0;
float b=0;
float a=0;



size(250,250);
background(0);




for (int i=0; i<250; i++) {
  strokeWeight(strokesize);
  stroke(r,g,b,a);
  point(x,y);

  x++;
  y=random(0,50);

  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
 
}

x=0;
strokesize*=2.5;
for (int i=0; i<250; i++) {
  strokeWeight(strokesize);
  stroke(r,g,b,a);
  point(x,y);

  x++;
  y=random(50,100);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
 
}
x=0;
strokesize*=2;
for (int i=0; i<250; i++) {
  strokeWeight(strokesize);
  stroke(r,g,b,a);
  point(x,y);

  x++;
  y=random(100,150);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
 
}
x=0;
strokesize*=2;
for (int i=0; i<250; i++) {
  strokeWeight(strokesize);
stroke(r,g,b,a);
  point(x,y);

  x++;
  y=random(150,200);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);

  
}
x=0;
strokesize*=1.5;
for (int i=0; i<250; i++) {
  strokeWeight(strokesize);
  stroke(r,g,b,a);
  point(x,y);

  x++;
  y=random(200,250);
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
}




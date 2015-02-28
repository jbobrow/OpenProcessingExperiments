
size(400,400);
background(0,0,0);
for(int a=0; a<200; a+=7) {
  if (a==0) {
    noStroke();
    fill(255,255,255);
    ellipse(100,100,10,10);}
    else { 
      fill(255,255,0,5);
      noStroke();
      ellipse(100,100,a,a);}
}

for (int b=0; b<400; b+=50) {
  float r=random(200);
  float t=random(100);
  float y=random(30);
  fill(255,255,255,y);
  ellipse(b+t,b+t,r,r);}

stroke(255,255,0,40);
strokeWeight(2);
line(110,90,90,110);
line(100,90,100,110);
line(90,100,110,100);
line(90,90,110,110);
  

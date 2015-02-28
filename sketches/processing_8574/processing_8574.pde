
void setup()
{
  size(500,500);
  background(255);
  smooth();
}

float a = PI;
float b = PI+1;
float c = PI+2;
float d = PI+3;
void draw() 
{
   background(255);
  strokeWeight(5);
  float c1 = 255*noise(a);
  float s1 = 250+tan(a)*100;
  float s2 = 250+100*tan(b);
  float s3 = 250+tan(c)*100;
  float s4 = 250+tan(d)*100;
  float s5 = 250+tan(d+500)*100;
  noFill();
  noStroke();
  fill(noise(a)*255,noise(c)*255,0,60);
  ellipse(s4,250,200,200); // red green a c
  fill(0,noise(a)*255,noise(b)*255,60);
  ellipse(s3,250,200,200); //green blue a b
  fill(noise(c)*255,0,noise(d)*255,60);
  ellipse(s2,250,200,200); //red blue c d
  fill(noise(b)*255,0,noise(a)*255,60);
  ellipse(250,s4,200,200); //red blue b a
  fill(0,noise(d)*255,noise(b)*255,60);
  ellipse(250,s3,200,200); // green blue d b
  fill(noise(c)*255,noise(a)*255,0,60);
  ellipse(250,s2,200,200); // red green c a
if(mousePressed == true){
a=a;
  b=b;
  c=c;
  d=d;
}
else{
          a=a+0.02;
  b=b+0.02;
  c=c+0.02;
  d=d+0.02;}
}


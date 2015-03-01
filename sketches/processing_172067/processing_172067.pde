

void setup(){
  size (600,600);
  background(255);
  frameRate(10);
}

float a;
float l;
float f;
float r;

void draw(){
  f= 50;
for( float a=100; a<600; a=a +100){
  for(l=100;l<600; l=l+ 100){
    stroke(3);
   
    fill(255,255,56);
    ellipse(a,l,random(f), f);
  fill(random (0), random (r), random (255));
  ellipse(a,l,random(f*2), f);

  }
}
}

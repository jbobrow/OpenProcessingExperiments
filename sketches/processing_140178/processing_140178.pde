

void setup() { 
  size(500, 500); 
  background(255); 
  frameRate(30); 
} 
float t=0;
int x=0;

void draw() { 
float rand_blur = random(0,0.7);
  float nt = noise(t);
  fill(255,50);
noStroke();
stroke(0,0,500,500);
fill(255,0,0);
  painting(); 
 fill(255,nt*height , 0); 
 painting();
 fill(222,random(40,80),20);
 painting();
 fill(222,random(70,120),40);
 filter(BLUR,rand_blur);
 
  } 
void painting() { 
  strokeWeight(10); 
  float nt = noise(t);
   textSize(random(5,10));
   text("Mountain",x % width, map(noise(t), 0., 1., 0., height));
   stroke(x%width,150,nt*height,80);
point(x % width, map(noise(t), 0., 1., 0., height));
t=t+0.01; 
x++; 

} 




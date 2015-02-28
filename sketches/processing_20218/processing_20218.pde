
float posX = 25; // x-position
float posY = 25; // y-position
float fps = 8;
  
void setup(){
size(250,250);
frameRate(fps);
smooth();
}
  
void draw(){
strokeWeight(0);
background(255);

// moving lines in the background  
for(int a=0; a<250; a+=10)
for(int b=0; b<250; b+=10)
 {
   stroke(0);
 line(a,b,a+random(20),b+random(100));
}

// rotating multicoloured circles 
for(int c=0; c<260; c+=20)
for(int d=0; d<260; d+=20)
 {
    fill(color(random(72),random(209),random(204)),random(255));
    noStroke();
  pushMatrix();       
  translate(125,125);
  rotate(frameCount/15f);
  ellipse(c,d,50,60);
  popMatrix();
    
  pushMatrix();       
  translate(125,125);
  rotate(frameCount/15f);
  ellipse(-c,-d,50,60);
  popMatrix();
 }
}


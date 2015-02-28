
color[] strawchoc= {#260707, #422828, #EDE0D3, #CC2B4E, #CC002C};
color[] palette = strawchoc;

float limiter;
void setup(){
 size(400,300);
background(palette[0]);
smooth();
strokeWeight(5);
noFill();
frameRate(5);
}

void draw(){
 while(limiter < 100){
   stroke(palette[int(random(1,5))]);
   float x = random(width);
   float y = random(height);
   float d = random(20,200);
   ellipse(x,y,d,d);
   limiter += random(-1, +2);
  } 
  }

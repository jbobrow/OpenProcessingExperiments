
void setup(){
   size(600, 200);
   smooth();
   frameRate(2);
 }

void draw(){
   background(#6FC6CC);
   circles();
}

void circles(){
 noStroke();
 float x = random(width);
 float y = random(height);
 float d = random(200, 100);
 fill (#FF0099);
 arc(x, y, d, d);
 }

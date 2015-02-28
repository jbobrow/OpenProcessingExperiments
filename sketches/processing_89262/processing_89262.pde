
color[] chefken = {#8D53A6, #5D730E, #BF0449, #8C1822, #F2F2F2};
color[] palette = chefken;

int s = 100;

void setup(){
 size(600, 300);
 background(palette[0]);
 smooth();
 noStroke();
 
 for(int x = 0; x < width; x += s){
  for(int y = 0; y < height; y += s){
   fill(palette[int(random(1, 6))]);
   rect(x, y, s, s);
   }
  }
 }
 
void draw(){
 fill(palette[int(random(1, 6))]);
 int x = int(random(width/s))*s;
 int y = int(random(height/s))*s;
 rect(x, y, s, s);
 }

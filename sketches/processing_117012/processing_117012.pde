
// colored stripes 
// Behnood Eghbali Wed.Oct 23.2013 11:45am 
int i = 0;
void setup(){
  size(800, 600); 
  smooth(); 
}
  void draw (){
  i++;
  noStroke(); 
  float r = random(100); 
  float x = random(0, width); 
  float t = random(x); 
    fill(random(t), random(200), random(r), r);  
  rect(x, 0, r, height); 
} 


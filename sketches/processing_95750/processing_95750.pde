
color[] pleasant={#92997A, #ABCC3C, #FFEA65, #A4B1FF, #3C77CC};
color[] palette= pleasant;

int s = 50;

void setup(){
  size (400,300);
  smooth();
  background(palette[0]);
  noStroke();
  
  for(int x=0; x < width; x +=s){
    for (int y=0; y< height; y += s) {
      fill(palette[int(random(1,5))]);
      rect(x, y, s, s);
    }
  }
}
  
void draw(){
  fill(palette[int(random(1,5))]);
  int x = int(random(width/s))*s; 
  int y = int(random(height/s))*s; 
  rect(x, y, s, s);
}

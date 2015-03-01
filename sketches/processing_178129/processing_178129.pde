
color[] palette = {#4003FF, #000000, #FFFFFC};
PImage nature;
void setup(){
  size(800, 600);
  nature = loadImage("nature.png");
}
void draw() {
  image(nature, 0, 0);
  if(mousePressed){
    stroke(palette[int(random(1, 3))]);
    strokeWeight(int(random(1, 10)));
    fill(palette[int(random(1, 3))]);
    float x = random(width);    
   float y = random(height);
   float d = random(10, 80);
   ellipse(x, y, d, d);
  }
}
void keyReleased(){
  if (key == DELETE)
    background(palette[int(random(1, 3))]);
}


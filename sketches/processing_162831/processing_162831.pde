
PImage Goku;
float vari = 245;
float varil = 440;
void setup() {
  size(800, 600);
  Goku = loadImage("Goku.png");
}
    
void draw() {
  if (vari <= 610) {
  vari=vari+5;
  Goku.filter(GRAY);
  image(Goku, 0, 0);
  noStroke(255);
  line(245, 440, vari, varil-=6);
  }
  fill(#7FE0F2);
  new stroke(#7AD0E0);
  if (vari >= 255) {
    float locx = random(vari-50, vari+50);
    float locy = random(varil-50, varil+50);
    ellipse(locx, locy, 55, 55);
  }  
  if (vari >= 275) {
    float loc1x = random(vari-80, vari+80);
    float loc1y = random(varil-80, varil+80);
    ellipse(loc1x, loc1y, 55, 55);
  }
  if (vari >= 295) {
    float loc2x = random(vari-105, vari+105);
    float loc2y = random(varil-105, varil+105);
    ellipse(loc2x, loc2y, 55, 55);
  }
  if (vari >= 315) {
    float loc3x = random(vari-125, vari+125);
    float loc3y = random(varil-125, varil+125);
    ellipse(loc3x, loc3y, 55, 55);
  }
  if (vari >= 335) {
    float loc4x = random(vari-140, vari+140);
    float loc4y = random(varil-140, varil+140);
    ellipse(loc4x, loc4y, 55, 55);
  }
  if (vari >= 355) {
    float loc5x = random(vari-155, vari+155);
    float loc5y = random(varil-155, varil+155);
    ellipse(loc5x, loc5y, 55, 55);
  }
  if (vari >= 375) {
    float loc6x = random(vari-165, vari+165);
    float loc6y = random(varil-165, varil+165);
    ellipse(loc6x, loc6y, 55, 55);
  }
}




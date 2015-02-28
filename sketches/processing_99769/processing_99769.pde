
void setup(){size(600,600);
background(255);
}
 
 
 void draw(){
 if(mouseX<width/2) {
for (int i = 280; i < width; i = i+20) {
  for (int j = 0; j < height; j = j+1) {
    stroke(i*.9,j/2,j*.9);
    line(i+100,j,i/600,j/2);
  }
}
 
for (int f = 10; f < width; f = f+30) {
  for (int g = 0; g < height; g = g+10) {
    noStroke();
    fill(100,100,255,30);
    ellipse(100,500,f/2,g/2);
  }
}
}
else {
  colorMode(HSB, height, height, height);  
for (int i = 280; i < width; i = i+20) {
  for (int j = 0; j < height; j = j+1) {
    stroke(i*.9,j/2,j*.9);
    line(i+100,j,i/600,j/2);
  }
}
 
for (int f = 10; f < width; f = f+30) {
  for (int g = 0; g < height; g = g+10) {
    noStroke();
    fill(100,100,255,30);
    ellipse(100,500,f/2,g/2);
  }
}
}
}


color bColor = color(255, 255, 255);
void setup () {
  size(600,400);
}
  
void draw () {
 
background(255,255,0);


if (mouseY < 200) {
background(0,255,255);
} if ((mouseY < 200) && (mouseX < 300)) {
background(bColor);
bColor = color(random(255), random(255), random(255));//, random255, random255);
} else if (mouseX < 300) {
background(255,0,255);
}
}

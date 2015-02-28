
//allen
//july,8 2013
//Draw
//Reference: DMA Sample
void setup () {
size (1000,1000);
}
void draw() {
  if (mousePressed == true)
    line(pmouseX,pmouseY,mouseX,mouseY);
}

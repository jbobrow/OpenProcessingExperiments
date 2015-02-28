
int blocksize;
void setup() {
size(700,700);
blocksize = 7;
smooth();
noStroke();
}
void draw() {
for(int y=0; y<height; y+=blocksize) {
for(int x=0; x<width;x+=blocksize) {
for (int i = 0; i < 50; i++) {

}
}
fill(255, 255, 255, 1);
 ellipse (mouseX,mouseY, 20, 20);

int specialX = mouseX - (mouseX % blocksize);
int specialY = mouseY - (mouseY % blocksize);
fill(255);
rect(specialX, specialY, blocksize,blocksize);
 }
fill (random(300),random(300),random(300),5);
for(int g = 0; g < 10; g++)
 {
 if (mousePressed) rect(mouseX+random(-100,100), mouseY+random(-100,100), 20, 20);
 {
   fill(#8B8B8B);
      stroke(#2C1C98);
      strokeWeight(11);
    }

 
 
 }
}





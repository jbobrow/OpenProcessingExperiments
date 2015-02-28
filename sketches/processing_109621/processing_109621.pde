
int counter;
int myX = 0; 

void setup() {  //setup function called initially, only once
size(480, 120);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
    frameRate(1);

smooth();
strokeWeight(1);}

void draw() {  //draw function loops 
  background(255);  //set background white

for (int i = 10; i < 100; i += 10) {
myX += 10; // This is the same as x = x + 10

 line(i + myX, 40, i + 60, 80); 
 }
 
}

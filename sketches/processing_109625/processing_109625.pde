
int counter;
int myX = 0; 
int myY = 0;  


void setup() {  //setup function called initially, only once
size(480, 120);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
    frameRate(1);
    smooth();
    strokeWeight(1);
    myX = width; 
    myY = height;
}

void draw() {  //draw function loops 
  background(255);  //set background white

for (int i = 0; i < 100; i += 10) {
  

line(myX + i, myY -i, i, i);    
myX++;
myY --;
}
 
}

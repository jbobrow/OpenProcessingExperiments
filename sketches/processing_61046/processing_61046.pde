
int counter;

void setup(){  //setup function called initially, only once
  size(300, 300);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  frameRate(24);
}

void draw(){
line(15, 25, 70, 90);
     background(192, 64, 0);
     
     stroke(255);
     line(150, 25, 270, 350);

     stroke(255);               // sets the stroke color to white
     stroke(255, 0, 255);     // identical to the line above
     stroke(255, 128, 0, 128);  // bright orange with 50% transparency

}

void setup() {
       size(400, 400);
       stroke(255);
       background(192, 64, 0);
     } 

     void draw() {
       line(150, 25, mouseX, mouseY);
     }


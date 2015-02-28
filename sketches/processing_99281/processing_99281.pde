
EggRing  er1,er2,er3,er4,er5; // global variables
PImage b;

void setup() {
  size(500, 500);
  b = loadImage("sky.jpg"); // loads image
  smooth();
  er1 = new EggRing(60, 460, 0.1, 66); // the bottom left ring
  er2 = new EggRing(440, 140, 0.05, 132);//top right ring 
  er3 = new EggRing(440, 460, 0.1, 66); //bottom left ring 
  er4 = new EggRing(60, 140, 0.05, 132);// top left ring
  er5 = new EggRing(250, 320, 0.05, 132);// center ring
  
}


void draw() {
  background(0);
  image(b,0,0); // sets background
  
  er1.transmit(); 
  er2.transmit();
  er3.transmit();
  er4.transmit();
  er5.transmit();
}


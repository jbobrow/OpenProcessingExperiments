
//Wich side will you choose?
//by Sergio Sequero

PImage assassin;
PImage templar;
float r1 = 0.0; 
float r2 = 0.0; 
float incr = 0.0;

void setup() {
  size(192, 157); 
  background(0); 
  frameRate(25);
  noStroke();
  assassin = loadImage("http://www.inkace.com/media/catalog/product/cache/1/small_image/135x/9df78eab33525d08d6e5fb8d27136e95/a/s/assassins.jpeg");
  templar = loadImage("http://www.treasurenet.com/forums/attachments/treasure-marks-signs/299072d1332677504-treasure-signs-symbols-101-lg-templar-cross.jpg");

}

void draw () {
    background(255);
    
    r1 = 125 * sin(incr); 
    r2 = 125 * cos(incr);
    image(templar,30, height / 2, r2, r2);
    image(assassin,130, height/2, r1,r1);
    
    
    incr = incr + 0.05;

}


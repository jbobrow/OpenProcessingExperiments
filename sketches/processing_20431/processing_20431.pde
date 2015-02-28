
int frame = 0;
PImage[] images = new PImage[4];
     
void setup()
{
  size(640, 420);
  background(0);
  frameRate(1);
 
  //to add more images: change number on new PImage[] above and loadImage below.
  images[0]  = loadImage("LEDa.png");
  images[1]  = loadImage("LEDb.png");
  images[2]  = loadImage("LEDc.png");
  images[3]  = loadImage("LEDd.png");
   
  /*
  images[0]  = loadImage("LEDc.png");
  images[1]  = loadImage("LEDb.png");
  images[2]  = loadImage("LEDc.png");
  images[3]  = loadImage("LEDd.png");
   
  images[4]  = loadImage("LEDd.png");
  images[5]  = loadImage("LEDb.png");
  images[6]  = loadImage("LEDd.png");
  images[7]  = loadImage("LEDc.png");
   
  images[8]  = loadImage("LEDc.png");
  images[9]  = loadImage("LEDb.png");
  images[10]  = loadImage("LEDc.png");
  images[11]  = loadImage("LEDd.png");
   
  images[12]  = loadImage("LEDd.png");
  images[13]  = loadImage("LEDb.png");
  images[14]  = loadImage("LEDd.png");
  images[15]  = loadImage("LEDc.png");
   
  images[16]  = loadImage("LEDc.png");
  images[17]  = loadImage("LEDb.png");
  images[18]  = loadImage("LEDc.png");
  images[19]  = loadImage("LEDd.png");
   
  images[20]  = loadImage("LEDd.png");
  images[21]  = loadImage("LEDb.png");
  images[22]  = loadImage("LEDd.png");
  images[23]  = loadImage("LEDc.png");
*/
}
  
void draw()
{
   
  translate(0, -75);
  int h = hour() % 12;
  int m = minute();
 
  background(0);
   
  //hours
  //[frame] = [floor(random(0, images.length))] -- to load random images (for blinking)
  
 //column 1
  
  if (h >=6) {
  image(images[floor(random(0, images.length))], 60, 380, 100, 100);
 }
  
  if (h >=9) {
    image(images[floor(random(0, images.length))], 60, 300, 100, 100);
  }
   
  if (h >= 10) {
  image(images[floor(random(0, images.length))], 60, 220, 100, 100);
  }
   
  if (h == 12) {
    image(images[floor(random(0, images.length))], 60, 140, 100, 100);
  }
   
   
  //column 2
   
  if (h >=4) {
  image(images[floor(random(0, images.length))], 140, 380, 100, 100);
  }
   
  if (h >=5) {
  image(images[floor(random(0, images.length))], 140, 300, 100, 100);
  }
   
  if (h >=8) {
  image(images[floor(random(0, images.length))], 140, 220, 100, 100);
  }
 
  if (h >= 11) {
    image(images[floor(random(0, images.length))], 140, 140, 100, 100);
  }
   
   
  //column 3
   
  if (h >=1) {
  image(images[floor(random(0, images.length))], 220, 380, 100, 100);
  }
   
  if (h >=2) {
  image(images[floor(random(0, images.length))], 220, 300, 100, 100);
  }
   
  if (h >=4) {
  image(images[floor(random(0, images.length))], 220, 220, 100, 100);
  }
   
  if (h >=7) {
  image(images[floor(random(0, images.length))], 220, 140, 100, 100);
  //filter(BLUR, 1);
  }
   
   
   
  //minutes
  //write if statements in multiples of 5
   
  //to make all circles show up at :00 times
  if (m == 0) {
    m = 60;
  }
   
   
  //column 4
   
  if (m >= 5)  {
  image(images[floor(random(0, images.length))], 330, 380, 100, 100);
  }
   
  if (m >= 10)  {
  image(images[floor(random(0, images.length))], 330, 300, 100, 100);
  }
   
  if (m >= 20)  {
  image(images[floor(random(0, images.length))], 330, 220, 100, 100);
  }
   
  if (m >= 35)  {
  image(images[floor(random(0, images.length))], 330, 140, 100, 100);
 
  }
   
  //column 5
   
  if (m >= 15)  {
  image(images[floor(random(0, images.length))], 410, 380, 100, 100);
  }
   
  if (m >= 25)  {
  image(images[floor(random(0, images.length))], 410, 300, 100, 100);
  }
   
  if (m >= 40)  {
  image(images[floor(random(0, images.length))], 410, 220, 100, 100);
  }
   
  if (m >= 50)  {
  image(images[floor(random(0, images.length))], 410, 140, 100, 100);
  }
   
  //column 6
   
  if (m >= 30)  { 
  image(images[floor(random(0, images.length))], 490, 380, 100, 100);
  }
   
  if (m >= 45)  {
  image(images[floor(random(0, images.length))], 490, 300, 100, 100);
  }
   
  if (m >= 55)  {
  image(images[floor(random(0, images.length))], 490, 220, 100, 100);
  }
   
  if (m > 59)  {
  image(images[floor(random(0, images.length))], 490, 140, 100, 100);
  }
   
  //minutes -- 60 minutes or :00
  /*
    if (m == 0)  {
       
      //column4
      image(images[floor(random(0, images.length))], 340, 380, 100, 100);
      image(images[floor(random(0, images.length))], 340, 300, 100, 100);
      image(images[floor(random(0, images.length))], 340, 220, 100, 100);
      image(images[floor(random(0, images.length))], 340, 140, 100, 100);
 
      //column 5
      image(images[floor(random(0, images.length))], 420, 380, 100, 100);
      image(images[floor(random(0, images.length))], 420, 300, 100, 100);
      image(images[floor(random(0, images.length))], 420, 220, 100, 100);
      image(images[floor(random(0, images.length))], 420, 140, 100, 100);
 
   
      //column 6
      image(images[floor(random(0, images.length))], 500, 380, 100, 100);
      image(images[floor(random(0, images.length))], 500, 300, 100, 100);
      image(images[floor(random(0, images.length))], 500, 220, 100, 100);
      image(images[floor(random(0, images.length))], 500, 140, 100, 100);
   
  }*/
   
}




int frame = 0;
PImage[] images = new PImage[4];
     
void setup()
{
  size(640, 480);
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
  translate(-15, -10);
  int h = hour() % 12;
  int m = minute();
 
  background(0);
   
  //hours
  //[frame] = [floor(random(0, images.length))] -- to load random images (for blinking)
  
 //column 1
  
  if (h >=6) {
  image(images[floor(random(0, images.length))], 10, 360, 130, 130);
 }
  
  if (h >=9) {
    image(images[floor(random(0, images.length))], 10, 255, 130, 130);
  }
   
  if (h >= 10) {
  image(images[floor(random(0, images.length))], 10, 150, 130, 130);
  }
   
  if (h == 12) {
    image(images[floor(random(0, images.length))], 10, 45, 130, 130);
  }
   
   
  //column 2
   
  if (h >=4) {
  image(images[floor(random(0, images.length))], 110, 360, 130, 130);
  }
   
  if (h >=5) {
  image(images[floor(random(0, images.length))], 110, 255, 130, 130);
  }
   
  if (h >=8) {
  image(images[floor(random(0, images.length))], 110, 150, 130, 130);
  }
 
  if (h >= 11) {
    image(images[floor(random(0, images.length))], 110, 45, 130, 130);
  }
   
   
  //column 3
   
  if (h >=1) {
  image(images[floor(random(0, images.length))], 210, 360, 130, 130);
  }
   
  if (h >=2) {
  image(images[floor(random(0, images.length))], 210, 255, 130, 130);
  }
   
  if (h >=4) {
  image(images[floor(random(0, images.length))], 210, 150, 130, 130);
  }
   
  if (h >=7) {
  image(images[floor(random(0, images.length))], 210, 45, 130, 130);
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
  image(images[floor(random(0, images.length))], 330, 360, 130, 130);
  }
   
  if (m >= 10)  {
  image(images[floor(random(0, images.length))], 330, 255, 130, 130);
  }
   
  if (m >= 20)  {
  image(images[floor(random(0, images.length))], 330, 150, 130, 130);
  }
   
  if (m >= 35)  {
  image(images[floor(random(0, images.length))], 330, 45, 130, 130);
 
  }
   
  //column 5
   
  if (m >= 15)  {
  image(images[floor(random(0, images.length))], 430, 360, 130, 130);
  }
   
  if (m >= 25)  {
  image(images[floor(random(0, images.length))], 430, 255, 130, 130);
  }
   
  if (m >= 40)  {
  image(images[floor(random(0, images.length))], 430, 150, 130, 130);
  }
   
  if (m >= 50)  {
  image(images[floor(random(0, images.length))], 430, 45, 130, 130);
  }
   
  //column 6
   
  if (m >= 30)  { 
  image(images[floor(random(0, images.length))], 530, 360, 130, 130);
  }
   
  if (m >= 45)  {
  image(images[floor(random(0, images.length))], 530, 255, 130, 130);
  }
   
  if (m >= 55)  {
  image(images[floor(random(0, images.length))], 530, 150, 130, 130);
  }
   
  if (m > 59)  {
  image(images[floor(random(0, images.length))], 530, 45, 130, 130);
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



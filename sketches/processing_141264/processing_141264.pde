
// Arthur Siebesian
// Homework 8 - Load and Modify an image
// Got this badass image from the Google, Nasa.gov, and the codes...
// are the codes we learned in class from Flo and I mashed them together to get my SUPER SPACE IMAGE!!!
// 
PImage photo;
float a = 0;
float x; 


void setup() {
  background(0); // Black background for space
  size (450, 500); //sie
  x = width; // variable for x, so that image can move from right to left
  photo = loadImage("Star2.jpg"); // SPACE! 
}

void draw() {
    copy(photo, 50,int(random(1,45)),350,100,0,0,width,50); //image 1

  copy(photo, 50,int(random(30,40)),350,50,0,100,width,50);  //image 2
       int sy = int(map(noise(a), 0, 1, 0, height));  //image parameters
  copy(photo, 50,sy,350,50,0,200,width,50); // image 3
   a = a + 0.01; 
  copy(photo, 100,sy,450,100,0,400,width,50); //image 5
  copy(photo, 50,int(random(50,75)),350,50,0,300,width,50); //image 4 
image(photo, x, 0);  //Big space image that appears 
x = x - 1;  // program for the big space image to pass on by :)

if (keyPressed) {    //reset image so that you may see it again...
  setup();           //Press any button!
}
}

 

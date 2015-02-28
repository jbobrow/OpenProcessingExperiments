
// Using a combination of the dotFilter and the imgColorPickEasy examples 
// to get a rather intriguing array of circles of vairous sizes and colors from the image.
// The Falling Water by Frank Lloyd Wright is such an insperational piece of architecture
// that I decided to use it to inspire this processing assignment.


PImage myPic;

void setup() {    //Load image of "Falling Water"
  size(300, 300);
  myPic = loadImage("Falling_Water.jpg");
  noStroke();
  smooth();
}

int cell = 30; // Setting up the size of the pixles

void draw() {
  background(0);

  for (int y=cell; y <= 299; y+=cell) {    //setting up the array  
    for (int x=cell; x <= 299; x+=cell) {

      float radius = cell * (brightness(myPic.pixels[x + (y * 300)]) / 255);

      int a = int(random(0, myPic.width));    // creating random colors from random x and y coordinates from the image
      int b = int(random(0, myPic.height));   
      color myColor = myPic.get(a, b);       
     
      fill(myColor);  //creating the circles
      ellipse(x, y, radius, radius);
    }
  }
  noLoop(); //stopping the random madness
}

void keyPressed() {
  if ((key == 's') || (key == 's')) {    //saves screanshot image
    save("image.jpg");
    println("Image saved.");
  }
}



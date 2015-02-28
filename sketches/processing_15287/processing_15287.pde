
PImage pics[];

void setup()
{
  pics = new PImage[17]; //set up array to hold images
  size(1000,700, P3D); //set up 3D window
  background(0); //background black
  //enter in various pictures:
  pics[0] = loadImage("pic1.jpg");
  pics[1] = loadImage("pic2.jpg");
  pics[2] = loadImage("pic3.jpg");
  pics[3] = loadImage("pic4.jpg");
  pics[4] = loadImage("pic5.jpg");
  pics[5] = loadImage("pic6.jpg");
  pics[6] = loadImage("pic7.jpg");
  pics[7] = loadImage("pic8.jpg");
  pics[8] = loadImage("pic9.jpg");
  pics[9] = loadImage("pic10.jpg");
  pics[10] = loadImage("pic11.jpg");
  pics[11] = loadImage("pic12.jpg");
  pics[12] = loadImage("pic13.jpg");
  pics[13] = loadImage("pic14.jpg");
  pics[14] = loadImage("pic15.jpg");
  pics[15] = loadImage("pic16.jpg");
  pics[16] = loadImage("pic17.jpg");
  //template for more:
  //pics[] = loadImage["pic.jpg"]
  //just fill in number - DON'T FORGET TO CHANGE INITIALIZATION SIZE
}

void draw()
{
  ambientLight(220,220,220); //we want to be able to see the images, ideally
  //now let's make 'em all 3Dish and stuff
  rotateX(map(mouseY, 0, height, -.2, .2));
  rotateY(map(mouseX, 0, width, -.2, .2));  
}

void mousePressed()
{
  image(pics[int(random(16))], mouseX, mouseY); //add an image where you click
}

void keyPressed()
{
  background(0); //clear the page on keypress
}


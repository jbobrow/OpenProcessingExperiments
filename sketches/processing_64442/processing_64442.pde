
PImage GUSTA;
PImage OKAY;
void setup() {
  size(500, 500);

  //loads images
  GUSTA = loadImage("GUSTA.png");
  OKAY = loadImage("OKAY.jpg");
  //makes it so that the last 2 parameters in the imgae() function represent
  //the coordinates of the center of the image, not the top left corner
  imageMode(CENTER);
}
void draw() {
  //so that the movements of the arms erase
  background(255);
  
  if(mousePressed==true){
    stroke(random(255),random(255),random(255));
  }
  
  
  
  //okay face.  it goes before the Gusta so that the arms go over the
  //face
  
  
  
  image(OKAY, 290, 150);
  //body of OKAY
line(275,225,275,320);
//legs of OKAY
line(275,320,260,350);
line(275,320,290,350);
//ARMS of OKAY
line(275,200, 260, 300);
line(275,200,290,300);
  //gusta face
  image(GUSTA, 100, 100);
  strokeWeight(5);
  //body of GUSTA
  line(100, 170, 100, 300);
  //Legs of GUSTA
  line(100, 300, 50, 350);
  line(100, 300, 150, 350);
  //ARMS OF THE GUSTA.  Dividing by two keeps the arms from moving to far up.  
  //the second arm is negative so that it goes down, however it must have
  //a number added to it to keep it high enough
  line(100, 200, 270, mouseY/2+60);
  line(100, 200, 270, -mouseY/2+230);
  
  //text ANDY
 fill(0);
  text("Andy",100,10,250,250);
  
  text("David",300,50,250,250);
}




PImage img;

PImage img2;
PImage img3;

PImage[] images = new PImage[3];

void setup() {
  imageMode(CENTER);
  size(800,600);
  img = loadImage("Granite_Yosemite_P1160483.jpg");
  img2 = loadImage("rock.gif");
  img3 = loadImage("rocky copy.jpg");
  images[0] = loadImage("rocky.jpg");
  images[1] = loadImage("you.jpg");
  images[2] = loadImage("rock.gif");
}
void draw() {
  


 
}
  void display() {
    background(255);
  
}



void mouseClicked(){
  image(images[(int)random(3)],mouseX,mouseY);
 
} 



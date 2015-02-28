
//inspiration video-http://www.youtube.com/watch?v=qR8UqnwYKo8
//Inspired by this video I was intrigued by the way the fish seemed to jolt and move and then slow down. I decided to make a program where I could make a shark turn and follow a fish. I learned how to upload images to processing, aswell as rotating them and make them appear as if they are speeding up and then slowing down. I also incorporated classes into my project.
//Citations: Ciara Keegan, Ms. Freed, Clara Webby, http://www.processing.org/reference/atan2_.html,http://processing.org/reference/rotate_.html
Fish swimmy;//defines object
Fish coolfish;//defines object
PImage scaredfish;//naming pink fish that stays with mouse 
PImage frustratedshark;//naming shark that follows fish
int sharkX=0;
int sharkY=0;
//int coolfishX=250;
//int coolfishY=250;
void setup() {
  background(18, 28, 44);//dark blue color
  size(500, 500);//size of screen
  frustratedshark=loadImage("shark-clip-art-9.gif");//getting shark image from data folder
 scaredfish=loadImage("Pink_fish.png");//getting pinkfish image from data folder
 
  swimmy=new Fish (mouseX, mouseY, 22, 21);//defining object swimmy
  coolfish=new Fish (mouseX, mouseY, 22, 21);//defining object coolfish
}
void draw() {

  float a =atan2((mouseY-sharkY)/2, (mouseX-sharkX)/2);//getting angle between 
  imageMode(CENTER);//this makes my images draw from the center as opposed to a corner
  swimmy.display();//draws one of my fish objects
  coolfish.show();//draws the other fish object

  pushMatrix();//confines rotate to shark
  sharkX =(sharkX+(mouseX-sharkX)/40);//this makes the shark travel 1/40th of the distance to the object each time the code runs through
  sharkY=(sharkY+(mouseY-sharkY)/30);
  translate(sharkX, sharkY);//this moves the origin of the rotation to the middle of the shark
  rotate(a);//rotates the shark the angle specified by atan2


  image(frustratedshark, 0, 0, 100, 50);//draws my shark
  popMatrix();
}
class Fish {//makes  class
  int x;//defining variables
  int y;
  int wide;
  int tall;
  Fish(int tempX, int tempY, int tempWide, int tempTall)
  {
    x=tempX;
    y=tempY;
    wide=tempWide;
    tall=tempTall;
    
   
  }

  void display() {
    background(18, 28, 44);
    image(scaredfish, mouseX, mouseY,wide,tall);//makes my first fish
  }
    void show() {
    image(scaredfish, mouseX-25, mouseY-25,wide,tall);//makes my second fish
}}





PImage myImage;

//Initialize an array so the sketch knows what it's doing

int xPos[]=new int [100];
int yPos[]=new int [100];
int clicks = 0; // This feels weird.
 
 
void setup() {
  size (580, 260);
}
 
void draw() {
  background (255,0,0);
    myImage = loadImage("caveofforgottendreams.jpg");  //just to make a painful assignment more fun
  background(0, 84, 166);
  image(myImage, 0, 0);
  stroke  (112, 66, 20); // sepia
  strokeWeight(3);

   // The gnarly guts of the functionality
  for (int i = 0; i<1000 && i<clicks; i++) {
    ellipse(xPos[i], yPos[i], 5, 5);
    ellipse(xPos[i], yPos[i], 5, 5);
    if (i>0){
      line(xPos[i-1], yPos[i-1], xPos[i], yPos[i]);
      
     
    }
  }
  println(clicks); // Like sands through the hourglass.
}
 

void mouseClicked() {
  xPos[clicks]=mouseX;
  yPos[clicks]=mouseY;
  clicks++;
}


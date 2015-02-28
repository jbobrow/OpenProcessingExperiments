
PImage swing;
PImage dwarf;
PImage background;
float vx = 0;
float vy= 0;
float xPos = width /2;
float yPos= height /2;
PImage left;
PImage right;
PImage up;


void setup()
{
  size(800, 800);
  background = loadImage( "background.jpg");
  image(background, 0, 0);
 
}
public void draw() 
{
  swing = loadImage("dwarfgameplayswing.png");
  image(background, 0, 0);
  dwarf = loadImage("dwarfgameplaystand.png");
  left = loadImage("dwarfgameplaywalkleft.png");
  right = loadImage("dwarfgameplaywalkright.png");
  up = loadImage("dwarfgameplaywalkup.png");
 

  if (key == CODED) {
    if (keyCode == LEFT) {
      image(left, xPos, yPos);
      //xPos -= 50;
    } else if (keyCode == RIGHT) {
      image(right, xPos, yPos);
      //xPos +=50;
    } else if (keyPressed && keyCode == SHIFT) {

      image(swing, xPos, yPos);
    } else {
      image(dwarf, xPos, yPos);
    }



    
  }
  }



  void moveDwarf() {
    xPos = xPos + vx;
    yPos = yPos + vy;
  }
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        //image(left, xPos, yPos);
        xPos -= 50;
      } else if (keyCode == RIGHT) {
        //image(right, xPos, yPos);
        xPos +=50;
      }
    } else {
      vx = 0;
    }

    if (key == CODED) {
      if (keyCode == UP) {
        //vx = -5;
        yPos -= 50;
      } else if (keyCode == DOWN) {
        //vx = 5;
        yPos +=50;
      }
    } else {
      vx = 0;
    }
  }

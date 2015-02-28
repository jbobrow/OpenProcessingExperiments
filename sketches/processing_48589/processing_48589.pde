
//loads an image
PImage img;
//loads a font in 
PFont font;
//integer variable x assigned to 8 used for stroke weight
int x = 8;

void setup()
{
  //width 512 by height 512
  size(512, 512);
  //loads in font
  font = loadFont("Candara-48.vlw");
  //smooth line
  smooth();
  //loads in sketchbook image
  img = loadImage("finale.jpg");
  //sets image as background image
  background(img);
  //centers text
  textAlign(CENTER);
  fill(0);
  textFont(font, 14);
  text("Hold in left mouse button to draw a continous line", 280, 130);
  text("Press these buttons listed below to change line colors", 280, 150);
  text("Press 'r' for red line", 280, 170);
  text("Press 'b' for blue line", 280, 190);
  text("Press 'g' for green line", 280, 210);
  text("Press 'p' for purple line", 280, 230);
  text("Press 'o' for orange line", 280, 250);
  text("Press 'y' for yellow line", 280, 270);
  text("Press 'a' for black line", 280, 290);
  text("Press up to increase thickness of line or decrease it", 280, 310);
  text("Press delete to start drawing or clear screen", 280, 330);
  text("Press 1 to draw on a complete white screen", 280, 350);
}

void draw()
{
  if(keyPressed && (key == DELETE))
  {
    background(img);
  }
  //centers image
  imageMode(CENTER);

  //if the mouse pressed draws continous line at set stroke weight
  if (mousePressed && (mouseButton == LEFT))
  {
    line(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(x);
  }
}

void keyPressed()
{

  //if the r button is pressed turns line color red
  if (key == 'r' || key == 'R')
  {
    stroke(237, 19, 19);
  }
  // if the b button is pressed turns line color blue
  else if (key == 'b' || key == 'B')
  {
    stroke(19, 111, 237);
  }
  //if the g key is pressed turns line color green
  else if ( key == 'g' || key == 'G')
  {
    stroke(43, 237, 19);
  }
  //if the p key is pressed turns color purple
  else if (key == 'p' || key == 'P')
  {
    stroke(124, 19, 237);
 
  }
  //if the key o is pressed turns color orange
  else if (key == 'o' || key == 'O')
  {
    stroke(237, 103, 19);
  }
  //if the key  y is pressed turns color yellow
  else if ( key == 'y' || key == 'Y')
  {
    stroke(237, 230, 19);
    
  }
  else if ( key == DELETE)
  {
    //clears screen if delete is pressed
    background(img);
  }
  else if (key == '1')
  {
    //press 1 if you want a complete white screen
    background(255);
  }
  else if(key == 'a')
  {
    stroke(0);
  }
  else if (key == CODED) {
    //if up is pressed
    if (keyCode == UP)

      //stroke weight (line thickness goes up)
      x++;
    else if (keyCode == DOWN && x>0) {
      //line thickness decreases when down is pressed and x is greater than 0
      x--;
    }
  }
}





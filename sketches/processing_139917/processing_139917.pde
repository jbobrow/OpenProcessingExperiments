
/**
  * Bubbles
  * The processing monster is composed of primitive shapes, including ellipses, rectangles, lines and some fill. 
  * My monster, Bubbles, is sensitive to the user’s mouse meaning that its movements will parallel the direction the mouse moves.    The processing monster is composed of primitive shapes, including ellipses, rectangles, lines and some fill. My monster, Bubbles, is sensitive to the user’s mouse meaning that its movements will parallel the direction the mouse moves.    
  */
int color1 = color(188, 0, 188);  //initialize and define color1
int color2 = color(255, 0, 0);    //initialize and define color2
int cSwitch = 0;                  //initialize and define cSwitch
    void setup() {
    size(500,500);
    }

    void draw() {
    background (100, 250, 50);
    fill(color1);
    ellipse(mouseX,mouseY,150,100);
    /**
    * First ellipse forms the main head of the monster.
    */
    fill(255);
    ellipse(mouseX - 50, mouseY,20,45); 
    ellipse(mouseX + 50,mouseY,20,45); 
    /**
    * The following two smaller ellipses create the two basic ovals for the eyes.
    */
    fill(0);
    ellipse(mouseX - 50, mouseY - 15, 10, 10);
    ellipse(mouseX + 50, mouseY - 15, 10, 10);
    /**
    * These two ellipses are even smaller as they are encompassed by the previous and form the pupils. 
    * They are made solid by using the fill.
    */

    fill(255);
    rect(mouseX - 45, mouseY + 45, 25, 40);
    rect(mouseX + 25, mouseY + 45, 25, 40);
    /**
    * The two rectangles here make up the legs of the monster.
    */
    rect(mouseX + 75, mouseY - 5, 50, 15);
    rect(mouseX - 118, mouseY +5, 50, 15);
    /**
    * These rectangles have a longer width in order to make up the arms of the monster.
    */
    line(mouseX - 30, mouseY - 47, mouseX - 30, mouseY - 150);
    line(mouseX + 5, mouseY - 47, mouseX - 1, mouseY - 150);
    /**
    * Each line here relies on two points that make it up and form the antennas.
    * Using the mouseX and mouseY coordinates create mouse reactivity.
    */
    ellipse (mouseX + 3, mouseY - 150, 20, 20);
    ellipse (mouseX - 30, mouseY - 150, 20, 20);
    /**
    * The last two ellipses here are the finishing touvh of the antennas.
    * The particular points used create perfect circles.
    */
    }
    
    void mousePressed() {
      if (color1 == color(188, 0, 188)) {  //if mousePressed and color is purple, change color to red
        color1 = color2;
      } else {                              //if red, change back to purple
        color1 = color(188, 0, 188);
      }
    }




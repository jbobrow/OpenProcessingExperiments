
// original code without modifications is expanded off of example 7-14:Circular motion, Reas,Casey,and Ben Fry. Getting Started With Processing. Beijing:O'Reilly,2010.Print.
// Modified code written and changed by Zach Cummings. 
// All variations and commenting by Zach Cummings.

float angle =1;//changes angle that shape moves around center
float offset = 0;//moves position of shape on screen
float scalar = 1;//increases streakiness and diameter or width of shape
float speed = 10; // changes amount of shapes you will percieve, amount of streakiness, speed of shape drawn
void setup()
{
size(1100,700);//changes size of screen
strokeWeight(.9);//changes width or weight of stroke
background(255);//changes color of background; 145 is white, 0 is black
smooth();//smooths out drawings, blends pixels in the same vicinity
translate(400,400);//moves whole shape onto screen
}
void design(float angle, float offset, float scalar, float speed)//he function that allows one to easily manipulate the entire void(design) code as a singular line of code, name of the function is "design"
{
  translate(100,100);//moves whole shape onto screen; needs to happen in void draw to repeatedly complete this action
  float x = offset + cos(angle) * scalar;//change "*" to "+" to create vertical cylinder,change variables for variation in movement of shape
  float y = offset + sin(angle) * scalar;//change "*" to "+" to create horizontal cylinder, "        "
 rect(x,mouseY,sq(x),y,x);//dictates size and shape of the figure that moves on the screen, add a fifth coordinate to round the edges of a rectangle and create different patterns, use mouseX and mosueY for mouse controlled illustrations, square, multiply, add, divide or subtract x and y in the same coordinate for more variation, 
//  angle += speed;
}
void draw()
{
  design(angle, offset, scalar, speed);//function
  scalar += angle;//must be included with function in void draw to reset the movement each time
}


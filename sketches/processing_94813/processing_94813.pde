
int x=0; //defines int x

void setup()
{
    size(500,500); //defines the size
    smooth(); //makes it smooth
    colorMode(HSB); //set the colors to hue, saturation and brightness
    background(255); //sets the background to white
}
void draw()
{
    x=int(random(400));; //draws circles randomly until 400
    noFill(); //makes it no fill
    strokeWeight(4); //defines the stroke weight of the circles
    stroke(x,180,200,20); //defines the stroke color
    ellipse(width/2,height/2,x,x); //draws the ellipses

    if(mousePressed)
    {
       background(random(255)); //if mouse is pressed, the program resets to a different background color
    }
    else
    {
      fill(mouseX-HSB, mouseY-HSB, (mouseX*mouseY)); //defines the color of the circles made when mouse is moved
      ellipse(mouseX,mouseY,20,20); //draws circles when mouse is moved
    }
}




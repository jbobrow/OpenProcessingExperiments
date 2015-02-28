
void setup()
{
 background(255);
 size(450,800);
 smooth(); 
}

void draw()
{
background(255);
pushMatrix();
stroke(0);
strokeWeight(.1);
noFill();
translate(width/2,height/2);

bezier(90, 10, 10, 70, 0, mouseX, 15, 0);
popMatrix();

 //println("the x position is"+ mouseX);
 println("the y position is"+ mouseY);


}

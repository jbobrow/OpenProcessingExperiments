
void setup()
{
size(500, 500);
frameRate(60);
}
void draw()
{
 
 background(196, 215, 0);


fill(255, 255, 255);
ellipse(mouseX, mouseY, 70, 40);
ellipse(mouseX, mouseY, 70, 40);
fill(0, 0, 0);
ellipse(mouseX+1, mouseY+1, 30, 40);
ellipse(mouseX, mouseY, 30, 40);



fill(255, 255, 255);
ellipse(mouseX + 100, mouseY, 70, 40);
ellipse(mouseX + 100, mouseY, 70, 40);
fill(0, 0, 0);
ellipse(mouseX+1 + 100, mouseY+1, 30, 40);
ellipse(mouseX + 100, mouseY, 30, 40);


fill(237,109,0);
textFont(createFont("Ludwing",30));
textAlign(CENTER);
text("What are you looking for?", width/2, height/4);



}





void setup()
{
size(500,500);
background(41,229,14);
}

void draw()
{
noStroke();
fill(247,200,152);
ellipse(250, 150, 75,75);
fill(237,12,19);
ellipse(250, 280, 185, 185);
//fill(237,12,19);
//rect(85, 200, 125,40);
//fill(237,12,19);
//rect(290, 200, 125, 40);
fill(237, 12, 19);
rect(250, 350, 40, 125);
fill(237, 12, 19);
rect(200, 350, 40, 125);
fill(5, 0, 0);
rect(170, 465, 70, 25);
fill(5, 0,0);
rect(250, 465, 70, 25);
fill(255, 255, 255);
triangle(220, 175, 280, 175, 250, 240); 
fill(255, 255, 255);
rect(235, 150, 30, 7);

fill(237,12,19);
triangle(220,125, 280, 125, 250, 60);
fill(20,50,196);
ellipse(260, 140, 10, 10);
fill(20,50,196);
ellipse(240, 140, 10, 10);
fill(5,0,0);
ellipse( 250, 165, 16, 10); 
fill(255,255,255);
ellipse(250, 60, 20, 20);
text("Merry Christmas to All and to All a Good Night", 110, 40);


strokeWeight(40);
stroke(237,12,19);
line(200,225, 100,270);
line(300,225, 400,270);

println(mouseX + " , " + mouseY);


}

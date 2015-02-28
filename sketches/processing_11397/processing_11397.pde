
void setup ()
{
size(400, 200);
frameRate (40);


int d = 190;
int y = 160;
fill (256,0,14);
ellipse(0, y, d, d);   // Left
ellipse(100, y, d, d);  // Middle
ellipse(200, y, d, d);  // Right
ellipse(300, y, d, d);   // Left
ellipse(400, y, d, d);  // Middle
fill (257, 0, 56);
ellipse(0, y, d, d);   // Left
fill (250,50,100);
ellipse(100, y, d, d);  // Middle
fill (240, 100,120);
ellipse(200, y, d, d);  // Right
fill (220, 120, 140);
ellipse(300, y, d, d);   // Left
fill (200, 140, 160);
ellipse(400, y, d, d);  // Middle
fill (0, 0, 100);
ellipse(0, y, y, y);   // Left
fill (0, 0, 70);
ellipse(100, y, y, y);  // Middle
fill (0, 0, 40);
ellipse(200, y, y, y);  // Right
fill (0, 0, 20);
ellipse(300, y, y, y);   // Left
fill (0,0,10);
ellipse(400, y, y, y);  // Middle
}


void draw(){
stroke(mouseX, 80 , mouseY); 
float distance = dist(pmouseY, pmouseX, mouseY, mouseX);
float maxStroke = 20;
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
line(pmouseX, pmouseY, mouseX, mouseY);
}


void keyPressed(){
//presiona tecla para borrar el Background
background(40);

}















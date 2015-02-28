
void setup() {
  size(400,400);  //Set the size at 400x400 pixels, the limit for the static
  smooth(); //Enablle anti-aliasing
  background(#5CCB63); //Makes a green-ish color background
}

void draw() {
 fill(#B542D8); //Makes a light purple-ish fill
 strokeWeight(3); //Outlines the following desks
 rect(30,180,130,50,20);
 rect(30,300,130,50,20);
 rect(210,180,130,50,20);
 rect(210,300,130,50,20); //Creates the 4 desks
 strokeWeight(6); //Increases the outline to something more pronounced
 fill(#030202); //
 arc(70,238,30,25,0,PI);
 arc(115,238,30,25,0,PI);
 arc(250,238,30,25,0,PI);
 arc(295,238,30,25,0,PI); //Chairs of the first row
 
 arc(70,358,30,25,0,PI);
 arc(115,358,30,25,0,PI);
 arc(250,358,30,25,0,PI);
 arc(295,358,30,25,0,PI); //Chairs of the second row
 
 fill(255);
 strokeWeight(5);
 rect(80,50,230,70); //Creates a smartboard
}
 
/* for (int y = 10; y < height; y += 10) {
  for (int x = 10; x < width; x += 10) {
    strokeWeight(8);
    point(x, y); }}
 % = modul, divides and gives the remainder
 */



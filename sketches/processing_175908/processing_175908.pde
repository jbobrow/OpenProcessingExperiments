
// Windows
// by Karine Yenk
// "license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"
// Cette œuvre est mise à disposition selon les termes de la Licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 4.0 International.
 
// Inspired by Mariano Carrasco Maldonado 
//  
// Pressing 's' will cause the program to stop


//Variables

color[] palette = { #EFBBFF, #D896FF, #BE29EC, #800080, #660066};
int x = 0;
 
 
void setup() {
size(800, 600);
background(palette[0]);
frameRate(1);
}
 
 
void draw() {
 
//Randomly choose one colour in the palette  
  float r = random(5);
  
//Draw series of rectangles
  for (x=0;x<height;x+=50)
  {    
 noFill();
 strokeWeight(random(20));
 stroke(palette[int(r)]);
 rect(x, random(height), random(300), random(300));
  }
 
//Press the s key to stop  
  if (key=='s')
  {
    stop();
  } 
 } 







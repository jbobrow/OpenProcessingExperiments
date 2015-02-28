
int x = 220;

void setup () {
size (600, 200);
rectMode (CENTER);
noStroke ();

} 



void draw () { 
  println (mouseX + "  " + mouseY); 
  background (#81D8D0);
  fill (255);
  
  rect (100,100,25,100); 
  rect (125,100,28,25); 
  rect (150,100,25,100); 

  rect (220,63,80,25); 
  rect (220,105,25,90); 
  
}




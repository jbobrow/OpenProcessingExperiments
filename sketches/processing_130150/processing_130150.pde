
/* This little sketch draws colourfuls rows to reveals a
text written in background colour. Contains a little function 
that ensures that rows are not overlapping */ 

int b; // defines width of drawn row
float h; // random value for hue
int x1; // x1 + x2 are parameters to set rows drawn apart
int x2;
void setup ()
{
  size (500, 500);
  background (0);
  b = 0; 
  h = 0;
  noStroke ();
}
void draw ()
{
  if (mousePressed && (mouseButton == LEFT))
   {
      for (int b= 0; b < width; b=b+10)
   {
     // the following lines make sure that there
     // are no overlapping squares
  int x1 = round (mouseY / 10); 
    x2 = (x1*10);    
    // selects random colours from a blue-spectrum    
  float h = random (40, 80); 
  colorMode (HSB, 100);
  fill (h, 100, 100);
  rect (b, x2, 10, 10);
   }
  textSize (72); // text to be revealed
  fill (0);
  text ("Perseverance", 25, 100);
  text ("is the key", 75, 200); 
  text ("to", 200, 300);
  textSize (24);
  text ("Oh well, I can't be bothered anymore", 25, 350);
  text ("Just kidding, it's", 150, 400); 
  textSize (72);
  text ("Success", 125, 475);
}
}




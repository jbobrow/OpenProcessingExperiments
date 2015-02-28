
//Code by Joyce Shin
size (250, 250);
background (255);
  
 smooth ();
 noStroke ();
  
rectMode(CENTER);
translate (125, 125);

for(int x = 190; x>0; x=x-8){
   fill(200-x, 100-x, 130-x);
   rect(0, 0, x, x);
   rotate (0.6);
}




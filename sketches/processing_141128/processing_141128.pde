
void setup(){
  size(600,578);
  background(21,25,116);
  fill(200);
  ellipse(80,60,80,80);

for(int i =7; i< height; i+=7){
  stroke(255);

point(random(0, 1000), random(0, 400));
}

 stroke(0);
fill (0);
ellipse (213, 533, 14, 14); 
fill (240, 15, 15);
fill(0);
ellipse (213, 550, 7, 23);
pushMatrix ();
rotate (-PI*25/360);
ellipse (93, 585, 2, 14);
popMatrix ();
pushMatrix ();
translate (40, 0);
rotate (PI*25/360);
ellipse (283, 500, 2, 14);
popMatrix ();
pushMatrix ();
translate (0, 50);
rotate (-PI*25/360);
ellipse (100, 550, 3, 18);
popMatrix ();
pushMatrix ();
translate (0, 50);
rotate (PI*25/360);
ellipse (315, 458, 3, 18);


}


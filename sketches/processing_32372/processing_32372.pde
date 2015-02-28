
void setup() {
  size(500,500);
}

void draw() {
  println(mouseX);
   if (mouseX > 250) {
     background (105,139,24);
   } else  {
     background (121,205,205);
   }
 println(mouseX);
 if (mouseX < 250) {
   fill (105,139,24);
 } else {
   fill (127,255,212); 
 }
  triangle(125,250,250,125,375,250);  

 println(mouseX);
 if (mouseX< 250) {
   fill (178,238,58);
 } else {
   fill (54,100,139); 
 }
  rect(125,255,250,100);
  
fill(139,0,0);
rect(225,300,40,55);

}


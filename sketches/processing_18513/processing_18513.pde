
void setup () {
  size(250,250);
  background(#000000);
  
  smooth ();
noStroke ();

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (207,249,252,50);
    rectMode (CENTER);
    rect (x, y, 60, 60);
    //repetitive rectangles
  }}
    smooth ();
noStroke ();

for(int a=0; a<=height; a+=40) {
  for(int b=0; b<=width; b+=40) {
    fill (250,197,210, 100);
    ellipse (b, a, 50, 50);
    //repetitive circles
  }
}
  
      strokeWeight(1);
    
stroke(240,70);
for(
int a=0; a<280; a+=5)
for(
int b=0; b<280; b+=5)
{
  line(a, b, a + random (5, 5), b+5);
  line(a, b, a + random (1, 5), b+5);
}
//randome lines to create rough texture

stroke(209, 209, 209, 120);
for(
int a=0; a<280; a+= 5)
for(
int b=0; b<280; b+= 5)
{
  line(a, b, a + random (5, 5), b-1);
  line(a, b, a + random (1, 5), b-1);
}
}

void draw(){
  
 if (mousePressed) {
   stroke (0);
 } else {
   strokeWeight (1);
    stroke (random (100,250));  
   //color randomly changing before mouse press 
 }  

for(int i=20; i<600; i +=40){
  line (i, 0, i, 250);
  
}
}









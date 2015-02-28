
void setup () {

  size (800, 600);
background (0);
strokeWeight(2);
smooth ();
 
 for(int i=50; i<height; i+=100) {
for (int a= 50; a<width; a+=100){
fill(random (255),random (255),random (255));
ellipse (a, i, 100, 100);

}
}
 

}

void mousePressed(){
background (0);
strokeWeight(2);
smooth ();

  for(int i=50; i<height; i+=100) {
for (int a= 50; a<width; a+=100){
fill(random (255),random (255),random (255));
ellipse (a, i, 100, 100);

}
}

}

void draw () {
rectangulos();
}

void rectangulos(){
  frameRate (10); 
for(int i=0; i<height; i+=10) {
for (int a= 0; a<width; a+=10){
fill(0,random(255));
rect (a, i, 10, 10);

}
}

}




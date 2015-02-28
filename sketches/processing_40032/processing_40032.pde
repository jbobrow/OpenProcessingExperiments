
int space=10;

size(800, 800);
smooth();
background(50);
noFill();

for(int x=0;x<width;x=x+space) {
 for (int y=0;y<width;y=y+10) {
 stroke(255);
 strokeWeight(1);
 ellipse(x*2, y*2, 10*space/2, 10*space/2); 
 } 
}

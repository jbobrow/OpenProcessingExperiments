
void setup () {
size(300,300);
smooth(); 
rectMode(CENTER);  
}

void draw() {
  background (204);
  int x = mouseX; 
if (x > width/2) {
  fill(250,243, 35);
 ellipse (width/2, height/2,136,136); 
}

if (x < width/2) {
 fill(237,138,45);
 rect (width/2,height/2,130,130); 
}

line (width/2,0,width/2,height);

}

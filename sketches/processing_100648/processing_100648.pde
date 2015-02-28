
void setup() {
  size(600, 600); 
  stroke(255);
  background(#FFFFFF);
  noFill();
}

void draw() {
if (abs (mouseY) < 5* height/6)
stroke((mouseX % 255), (mouseY % 255), ((mouseX * mouseY) % 255));
  strokeWeight(5);
line((width/2)-abs (width/2-mouseY), (height/2)-abs (width/2-mouseY), (width/2)-abs (width/2-mouseY), (height/2)+abs (width/2-mouseY));


line((width/2)-abs (width/2-mouseY), (height/2)-abs (width/2-mouseY), (width/2)+ abs (width/2-mouseY), (height/2)-abs (width/2-mouseY));


line((width/2)+abs (width/2-mouseY), (height/2)+abs (width/2-mouseY), (width/2)-abs (width/2-mouseY), (height/2)+abs (width/2-mouseY));
line((width/2)+abs (width/2-mouseY), (height/2)+abs (width/2-mouseY), (width/2)+abs (width/2-mouseY), (height/2)-abs (width/2-mouseY));

}

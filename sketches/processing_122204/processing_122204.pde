
void setup() {
  size(600, 600);
 
  background(#671111);
  noFill();
}
 
void draw() {

stroke((mouseX - 255), (mouseY * 255), ((mouseX * mouseY) - 255));
  stroke  (random (255), random (255), random (255));
ellipse((width-300)+ (width-300-mouseY), (height-300)- (width-300-mouseY), (width-300)- (width-300-mouseY), (height-300)+ (width-300-mouseY));
 
 

 
 stroke (random (255), random (255), random (255));
ellipse((width-300)+ (width-300-mouseY), (height-300)+(width-300-mouseY), (width-300)- (width-300-mouseY), (height-300)+(width-300-mouseY));
stroke (#2015C1);

}


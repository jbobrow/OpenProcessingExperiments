
//mousePressedDemo
PImage closed;
PImage open;
  
void setup() {
size(400,400);
closed = loadImage("http://33.media.tumblr.com/514d7644d2e0a436c3b80d9a99e78722/tumblr_nc3ry7AHWn1s8009mo2_400.jpg");
open = loadImage("http://www.blitzwebdesign.com/wp-content/uploads/2014/07/tumblr_inline_n8ggnxU15r1sct83q.jpg");

 
}
void draw(){
if(mousePressed==true){
image(closed,0,0,400,400);
}else{
image(open,0,0,400,400);
}
if(mousePressed==false){
textSize(15);
text("Drink Tea", 200, 35);
fill(random(0,265));
}
}


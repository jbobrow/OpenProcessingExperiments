
PImage kick1, kick2;
  
void setup() {
size(500,300);
background(0,0,0);
kick1 = loadImage("http://replygif.net/thumbnail/586.gif");
kick2= loadImage("https://i.imgflip.com/wczz.jpg");
 
   
}
   
void draw() {
   
rect(180,180,50,50);
fill(0,255,255);
  
if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
}
if(mousePressed && (mouseButton == LEFT)){
image(kick1, 0, 0);
 
}
  
if (mousePressed && (mouseButton == RIGHT)) {   
image (kick2, 0,0);
}
  
}

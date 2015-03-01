
//certain things happen when mouse is in certain area//
PImage smiley, grin;

void setup() {
size(400,400);
background(255,255,0);
smiley = loadImage("http://www.migrelief.com/wp-content/uploads/2011/05/happy-face1.jpg");
grin = loadImage ("http://4.bp.blogspot.com/-YL6wcpbWq1c/To4tcyDGGMI/AAAAAAAAAa4/UTHTLKPFkWM/s1600/smiley+4.gif");
 
} 
 
void draw() {
 
rect(180,180,50,50);
fill(0,255,255);

if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
}
if(mousePressed && (mouseButton == LEFT)){
image(smiley, 0, 0);
}

if (mousePressed && (mouseButton == RIGHT)) {     
image (grin, 0,0);
}

}

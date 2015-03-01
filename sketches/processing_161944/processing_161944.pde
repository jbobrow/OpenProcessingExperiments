
//certain things happen when mouse is in certain area//
PImage smiley;
 
void setup() {
size(400,400);
background(255,255,0);
smiley = loadImage("http://www.migrelief.com/wp-content/uploads/2011/05/happy-face1.jpg");
 
 } 
 
void draw() {
 
rect(180,180,50,50);
fill(0,255,255);
 
if ((mouseX>180)&&(mouseY>180)&&(mouseX<230)&&(mouseY<230)){
fill(255,0,0);
if(mousePressed==true){
image(smiley, 0, 0);
}
}
}



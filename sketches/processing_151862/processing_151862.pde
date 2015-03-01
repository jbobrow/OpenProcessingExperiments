
//set up
void setup(){
//canvas size
size(600,400);
//trazo de elipse centro de canvas
ellipse (width/2,height/2,150,150);
//draw
void draw() {
ellipse( random(width), height/2, 150, 150);
//elipse en el puntero del mouse
ellipse( mouseX, mouseY, random(35,40), random(35,40));

}

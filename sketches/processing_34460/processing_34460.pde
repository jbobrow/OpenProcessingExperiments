
//void setup provides an original screen for setup
void setup() {

size(1000,400);
colorMode(RGB);
background(69,138,194);
}

//void draw initiates the repetition of commands
void draw() {


background(69,138,194);
//background function within draw recreates the background color
//background(69,138,194);
strokeWeight(10);
line(mouseX,mouseY,width/2,height/2);
//line follows the coordinate of the mouse for the first point position

noFill();
ellipse(width/2,height/2,100,100);


}






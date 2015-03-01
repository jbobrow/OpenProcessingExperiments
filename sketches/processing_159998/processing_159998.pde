
//Variables
int WIDTH = 600;
int HEIGHT = 600;
color color2 = (255);
color color3 = (0);

//Setup Structure
void setup(){
 size(WIDTH, HEIGHT);
 background(color2);
}

//Draw
void draw(){
 frameRate(60); 
 smooth();
 strokeWeight(20);
 stroke(random(0, 100), random(190, 235),random(200, 255));
 fill(random(0, 255), random(0, 255),random(0, 255));
 line(mouseX, mouseY, WIDTH/2, HEIGHT/2);
}




//Variables
int WIDTH = 600;
int HEIGHT = 600;
color color2 = (255);
color color3 = (0);
color [] col1 = {#1005FF, #FF007F};
color [] palette1 = col1;

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
 stroke(palette1[1], 60);
 line(mouseX, mouseY, WIDTH/2, HEIGHT/2);
 stroke(palette1[0], 60);
 line((pmouseX-10), (pmouseY-10), WIDTH/2, HEIGHT/2);
}



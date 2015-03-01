
int x = 600;
int y = 400;

void setup(){
size(600, 400);
}

void draw(){
background(0);

rectMode(CENTER);

if((mouseX < width / 2) && (mouseX > width / 4) && (mouseY > height / 4) && (mouseY < height * .75)) {fill(255, 0, 0);}
if((mouseX > width / 2) && (mouseX < width * .75) && (mouseY > height / 4) && (mouseY < height * .75))  {fill(0, 0, 255);}
rect(x/2, y/2, x/2, y/2);



}








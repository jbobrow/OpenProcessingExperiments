
int x = 500;
int y = 200;
 
void setup(){
size(500, 200);
}
 void draw(){
background(75);
 
rectMode(CENTER);
 
if((mouseX < width / 2) && (mouseX > width / 4) && (mouseY > height / 4) && (mouseY < height * .75)) 
{fill(#009999);}
if((mouseX > width / 2) && (mouseX < width * .75) && (mouseY > height / 4) && (mouseY < height * .75))  
{fill(#3399FF);}
rect(x/2, y/2, x/2, y/2);
 
 
 
}





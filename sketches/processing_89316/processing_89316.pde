
color[] rainbow = {#FFFFCD, #CC5C54, #F69162, #85A62, #7AB5DB};
color[] chamistry = {#0C2550, #A3D0C1, #FDF6DD, #FEE406, #F4651C};
color[] minard = {#666666, #607F9C, #E9CCAE, #FFFFF3, #DO1312};
color[] palette = minard

int choice;
int p1 = 1;
int p2 = 2;

float x;
float y;
float d = 150;
float b = 30;

void setup(){
 size(600, 200);
 smooth();
 x = width/2;
 y = height/3;
 
 }
 
 void draw(){
 background(palette[0]);
 fill(palette[1]);
 stroke(palette[2]);
 strokeWeight(b);
 ellipse(x, y, d, d);
 
if(mouseX > width/2){
 d += 5;
} else {
 d -= .5;
}

b = (mouseY > (height/4)) ? b + 2 : b - 4;
b = contrain(b, 0, 100);
}

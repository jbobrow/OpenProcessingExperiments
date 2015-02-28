
void setup(){
size(800, 400);
translate(width/2, height/2);
} 

void draw(){

float headX = mouseX;
float headY = mouseY;

background(#2E6DA2);


fill(#FFDCB2);
noStroke();
ellipse(headX, headY, 190, 220);

fill(#7E5C28);
arc(headX, headY-80, 150, 75, radians(150), radians(390));

stroke(0,0,0);
fill(255, 255, 255);
ellipseMode(CENTER);
ellipse(headX-35, headY-20, 35, 15);
ellipse(headX+35, headY-20, 35, 15);


fill(0,0,0);
stroke(0.5);
ellipse(headX-35, headY-20, 15, 15);
ellipse(headX+35, headY-20, 15, 15);

noFill();
strokeWeight(6);
stroke(#AD6452);
arc(headX, headY + 35, 100, 50, 0, PI);
//arc(headX, 235, 100, 50, 0, PI);

strokeWeight(4);
stroke(#ffcc33);
ellipse(headX, headY-100, 150, 60);

}



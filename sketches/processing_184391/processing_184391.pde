
int x=250;
int y=250;

void setup() {
size(500,500);

}

void draw() {
rectMode(CENTER);

fill(255,0,0); //Left Square Base Fill

if(mouseX<x && mouseX>150 && mouseY>y-50 && mouseY<y+50) {
  fill(0,0,255); //Left Square affected fill
}
rect(x-50,y,100,100);

fill(255,0,0); //Right Square base fill

if(mouseX>x && mouseX<350 && mouseY>y-50 && mouseY<y+50) {
  fill(0,0,255);
}


rect(x+50,y,100,100);

}

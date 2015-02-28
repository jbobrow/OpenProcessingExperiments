
int x = 50;
int y = 50;
int w = 100;
int h = 75;

void setup(){
size(200,200); //set window size
}

void draw() {
background(0);
stroke(255);
if (mouseX > 50 && mouseX < 150 && mouseY > 50 && mouseY < 125) {
fill (250,50,50);
} else {
fill (0);
} 

rect (x,y,w,h);

}

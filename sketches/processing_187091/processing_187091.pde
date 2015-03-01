
//week 4 assignment
//Drawing patterns using for function that can be displayed with interaction
//Code by James Lamb
int x = 300;
int y = 300;

int size = 10;
int rote = 0;
int rad = 50;
int yes = 0;

int cY =0;


void setup() {
  size(600,600);
  noStroke();
  smooth();
 
  frameRate(10);

}
 
void draw() {
   background(0);
  if (yes == 1){
for (int n = 0; n < 8; n = n + 1){ 
    pushMatrix();
    translate(x,y);
    rotate(degrees(rote));    
    translate(rad,0);
    for(int c = 0; c < 250; c = c + 10){
    fill(c/4,0,c/2);
    rect(0,cY,size,size);
    cY = cY - 2;
    }
    size += 1;
    rote += 1;
    rad += 3;
    popMatrix();
    cY = 0;
}
  }
  if (rad > 600){
    size = 10;
    rote = 0;
    rad = 1;
    yes = 0;
  }
}
void mouseClicked(){
yes = 1;
x = mouseX;
y = mouseY;
}







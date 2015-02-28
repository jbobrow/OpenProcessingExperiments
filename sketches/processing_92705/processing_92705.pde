
int circ = 200;
float n = 0.8;
float incr = 0.01;

//int x;
int y;
int z;


void setup() {
  size(1280, 768);
  smooth();
  background(10, 10, 10);
  stroke(255, 255, 255, 100);
}

void mousePressed(){

    
    drawRoot(mouseX, mouseY, 500);
    drawRoot(mouseX, mouseY, 500);
}

void drawRoot(int a, int b, int l){
    x = a;
    y = b;
    

    for(int i = l; i>0; i--){
        run();
        updatePosition();
        if(i = l/2){
            drawRoot(x, y, 200);
        }
    }
}



void updatePosition(){
    int down = random(4)-2;
    y += down+2;
    x = x-4+random(8);
}

void run(){
    if (circ > 0 && circ < 10) {
      circ = 1;
    }
    circ--;
    fill(noise(n)*255, noise(n)*255, 0, 20);
    ellipse(x, y, noise(n)*circ, noise(n)*circ);
    n+=incr;
}

void draw() {


  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      background(10, 10, 10);
    }
  }
}

void mouseReleased() {
  if (circ<40) {
    circ=200;
  }
}


void setup() {
  size(320, 480);
 frameRate(10);

 
}

void draw() {

//background(255);
stroke(3);
strokeWeight(3);
//line(0,0,320,480);
//line(320,0,0,480);

int w = width;
int h = height;


int rx = random(w)-40;
int ry = random(h)-80;
int rw = random(w/3)+10;
int rh = random(h/3)+10;


fill(255);
rect(rx,ry,rw,rh);

    

}

draw();
draw();
draw();


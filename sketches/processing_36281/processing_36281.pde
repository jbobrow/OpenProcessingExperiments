
int NUM = 300;
PVector[] pos;
PVector[] vel;

int[] ttl;
boolean value = false;
boolean first = true;

void setup() {
    size(700,400);
    frameRate(25);

    pos = new PVector[NUM];
    vel = new PVector[NUM];
    ttl = new int[NUM];
    for( int i = 0; i < NUM; i++) {
        pos[i] = new PVector(0,0);
        if (i < NUM/2) {
            vel[i] = new PVector(random(-2,2), random(-10,-5));
            ttl[i] = int(random(50,100));
        } else {
            vel[i] = new PVector(0,0);
            ttl[i] = int(random(0,50));
        }
    }
}

void draw() {
    background(0);
    stroke(255,255,255,10);
    strokeWeight(70);
    int x = mouseX;
    int y = mouseY;
  if(value == true){
    for( int i = 0; i < NUM; i++) {
      point( pos[i].x + x, pos[i].y + y );
    //    point( pos[i].x + width/2, pos[i].y + height );
   }
   first = false;
  }
 
    for( int i = 0; i < NUM; i++) {
        pos[i].add( vel[i] );
        ttl[i]--;
        if (ttl[i] < 0) {
            vel[i] = new PVector(random(-5,5), random(-5,5));//changes how the particles spread accross the canvas
            pos[i] = new PVector(0,0);
            ttl[i] = int(random(50,100));
        }
    }
  }


void mousePressed() {

}

void mouseReleased(){
value = true;
}



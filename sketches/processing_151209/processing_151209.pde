
Limb[] limb = new Limb[300];
float ossilation=0;
float ossilationInc=1;


void setup() {
    size(800, 600);
//  size(1336, 768);
  for (int i=0;i<limb.length;i++) {
    limb[i]= new Limb( int(random(200, width-300) ), height/2, (int)random(1, 7) );
  }
}

void draw() {

  if (ossilation > 50 || ossilation < -50) {
    // ossilationInc*=(-1);
  }
  ossilation+=ossilationInc;
  background(255);

  for (int i=0;i<limb.length;i++) {
    limb[i].render();
  }
}

class Limb {
  int x=0;
  int y=0;
  int links=1;
  float len=50;
  int a=0;
  int d=0;
  
  public Limb(int x, int y, int links) {
    this.x=x;
    this.y=y;
    this.links=links;
    len=random(25, 50);
    a=(int)random(-25, 25);
    
    if(random(100) <50){
     d=-1; 
    }else{
      d=1;
    }
  }

  public void render() {

    pushMatrix();

    fill(0, 0, 0, 30);
    translate(x, y);
    
    for (int i=0;i<links;i++) {
      translate(len, 0);
      rotate( radians(a+(ossilation*d) ) );  
        rect(0, 0, len, 1);
    }
    
    noStroke();
    if (random(100) >90) {
      fill(255, 0, 0, 60);
    }
    else {
      fill(0, 0, 0, 30);
    } 
    ellipse(len, 0, 10, 10);
    popMatrix();
  }
}


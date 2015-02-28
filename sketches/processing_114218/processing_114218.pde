
/**
 * 'Radar' style display of 32 bytes of data from a Sharp IR detector
 *  faked out until socketio works...
 */

int irRange[] = new int[32];
int sc = 10;
int maxIR = 250;
int minIR = 50;

void setup() {
  size(640, 360);

  // walk the array somewhat randomly
  randomSeed(second());
  
  int delta = 10;
  int last = int(random(200)+40);
  
  for (int i = 0; i < 32; i++) {
    //irRange[i] = int(random(200));
    int next = last + int(random(delta)-(delta/2));
    if ( irRange[i] + next > 280 ) {
      irRange[i] = irRange[i] - next;
    } else {
      irRange[i] = irRange[i] + next;
    }
    last = irRange[i];
  }
}

void draw() {
  updateIR();
  
  background(0);  

  fill(color(255,0,0));
  stroke(color(255,0,0));
  
  arc(mouseX, mouseY, 280, 280, radians(26+180), radians(128+206));

  //fill(color(127,0,0));
  //for (int i = 0; i < 32; i++) {
    //int rx = int( mouseX + irRange[i] * cos(radians(((i+1)*4)+206) ) );
    //int ry = int( mouseY + irRange[i] * sin(radians(((i+1)*4)+206) ) );
    //line(mouseX,mouseY,rx,ry,);
    // or this...
    //arc(mouseX,mouseY,irRange[i],irRange[i],radians(((i)*4)+206),radians(((i+1)*4)+206));
  //}
  
  for (int i = 0; i < 32; i++) {
    //int rx = int( mouseX + irRange[i] * cos(radians(((i+1)*4)+206) ) );
    //int ry = int( mouseY + irRange[i] * sin(radians(((i+1)*4)+206) ) );
    //line(mouseX,mouseY,rx,ry,);
    int green = irRange[i];
    if ( green > 255 ) { green = 255; }
    int red = 255 - green;
    int blue = 0;
    
    if ( irRange[i] > maxIR ) { 
      red = 0;
      green = 0;
      blue = 0; 
    }

    if ( irRange[i] < minIR ) { 
      red = 255;
      green = 0;
      blue = 0; 
    }    
    
    
    fill(red,green,blue);
    stroke(255);
    rect((i*sc)+sc,sc,sc,sc);
    
    stroke(0);
    arc(mouseX,mouseY,irRange[i],irRange[i],radians(((i)*4)+206),radians(((i+1)*4)+206));
  }
  
  stroke(color(0,0,255));
  noFill();
  arc(mouseX, mouseY, maxIR, maxIR, radians(26+180), radians(128+206));
}

void updateIR () {
  // walk the array somewhat randomly
  for (int i = 0; i < 32; i++) {
    int rand = int(random(6)-3) ;
    irRange[i] = irRange[i] + rand;
    if ( irRange[i] < 0 ) { irRange[i] = 0; }
    if ( irRange[i] > 280 ) { irRange[i] = 280; }
  }
}

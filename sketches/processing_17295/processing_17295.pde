

int num = 90;

int tresh = 10; 

Field field;
Signal s[];

void setup() {
  size(480,240,P2D);

  background(0);

  rectMode(CENTER);

  loadPixels();

  field = new Field();
  s = new Signal[num];

  for(int i = 0;i<num;i++)
    s[i] = new Signal();
}

void mousePressed(){
  background(0); 
}


void draw() {
  loadPixels();
  for(int i = 0;i<s.length;i++)
    s[i].update();
    
   // tint(255,5);
   // image(g,2,0);
}


class Field {
  int [] udaj;

  Field() {
    udaj = new int[width*height];
    for(int i = 0 ;i<udaj.length;i++) {
      udaj[i] = floor(random(1,4));
    }
  }
}

class Signal {
  int x,y,sx,sy;
  int w = 10;
  int [] ns = new int[8];
  int smer;

  Signal() {
    x = floor(random(width)); 
    y = floor(random(height));
    smer = 6;
    getNeighs();
  }

  void update() {

    sx = x;
    sy = y;

    getNeighs();


    int cnt = 0;

    if( ns[smer] > tresh ) {
      w++;
      w=w%255;
      
      while(ns[smer] > tresh && cnt < 7) {

        smer = (smer+3)%7;
        cnt++;
      }
      
      
      
      // reset x y if no way
      /*
      if(cnt>=7) {
        
        x = floor(random(width));
        y = floor(random(height));
        getNeighs();
        
      }*/
    }
    else {

      switch(smer) {
      case 0: 
        x--; 
        y--; 
        break;
      case 1: 
        y--; 
        break;
      case 2: 
        x++; 
        y--; 
        break;
      case 3: 
        x--; 
        break;
      case 4: 
        x++; 
        break;
      case 5: 
        x--; 
        y++; 
        break;
      case 6: 
        y++; 
        break;
      case 7: 
        x++; 
        y++; 
        break;
      default: 
        ;
      }
    }

    nekonecno();



    noStroke();
    fill(0,20);
    ellipse(x,y,7,7);
    stroke(255,200);
    point(x,y);
  }

  void nekonecno() {
    if(x>width) {
      x = 0;
    }
    else if(x<0) {
      x = width;
    } 


    if(y>height) {
      y = 0;
    }
    else if(y<0) {
      y = height;
    }
  }

  void getNeighs() {
    ns[0] = floor(brightness(get((x+width-1)%width,(y+height-1)%height)));
    ns[1] = floor(brightness(get(x,(y+height-1)%height)));
    ns[2] = floor(brightness(get((x+1)%width,(y+height-1)%height)));

    ns[3] = floor(brightness(get((x+width-1)%width,y)));
    ns[4] = floor(brightness(get((x+1)%width,y)));

    ns[5] = floor(brightness(get((x+1)%width,(y+1)%height)));
    ns[6] = floor(brightness(get((x+1)%width,(y+1)%height)));
    ns[7] = floor(brightness(get((x+1)%width,(y+1)%height)));
  }
}




int num = 15;
int num2 =5;
lines[] l;
ellis[] e; 
float cnt;

//================================= init

void setup() {
  size(500, 300);
  background(0);
  frameRate(60);
  smooth();
  strokeCap(PROJECT);
  cnt = 0;
  fill(0,0);

  l = new lines[num];
  e = new ellis[num];
  for(int i = 0; i<num; i++){l[i]=new lines(i);}
  for(int i = 0; i<num2; i++){e[i]=new ellis(i);}

}

//================================= frame loop

void draw() {
  for(int i = 0; i<num; i++){l[i].update();}
  for(int i = 0; i<num2; i++){e[i].update();}

//  cnt ++ ;
//  if(cnt > frameRate/2){background(0);cnt=0;}
}

//================================= interaction

void mousePressed() { 
//  save("tmp.jpg");
  background(0);
}


//================================= objects

class lines {
  int id;
  
  float x, y;
  int rd, gr, bl, alph;
  
  lines (int num) {
    id = num;
    init();
  }
  
  void init() {
    if ((rd == 0) || (rd == 255)) {
      rd = int(random(255));
      gr = int(random(255));
      bl = int(random(255));
    } else {
      if (rd > 125) {
        rd=255; gr=255; bl=255;
      } else {
        rd=0; gr=0; bl=0;
      }
    }
    alph = int(random(10) + 90);

  }
  
  void update() {
    strokeWeight(random(10));
    stroke(rd,alph);
    y = (random(height)) ;     
    line(0, y, width, y);
  }
}


class ellis {
  int id;
  
  float x, y;
  int rd, gr, bl, alph;
  
  ellis (int num2) {
    id = num2;
    init();
  }
  
  void init() {}
  
  void update() {
    
    if ((rd == 0) || (rd == 255)) {
      rd = int(random(255));
      gr = int(random(255));
      bl = int(random(255));
    } else {
      if (rd > 125) {
        rd=255; gr=255; bl=255;
      } else {
        rd=0; gr=0; bl=0;
      }
    }
    alph = int(random(10) + 90);

    strokeWeight(random(2));
    stroke(rd, gr, bl, alph);
    ellipse(width/2+random(10),height/2+random(10),
    random(height),random(height));
  }
}


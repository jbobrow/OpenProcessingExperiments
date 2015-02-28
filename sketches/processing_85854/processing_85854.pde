
dumbObj[] objs = new dumbObj[10];

 PFont leachface;


void setup() {
  size (1000,500); 
  background(0,99,99);
  smooth();   
 //noLoop(); 
  leachface = loadFont("Cracked-48.vlw");  // i didn't have your vlw file so i used one i had
  for (int i=0; i<objs.length; i++) {
    objs[i] = new dumbObj(int(random(width)), int(random(height)));   
  }
}

void mousePressed() {
  //saveFrame();
  setup();
}

void draw() {
  for (int i=0; i<objs.length; i++) {
    objs[i].update();   
  }  
}


class dumbObj {
  // fields...
  int x; 
  int y; 

  
  // constructor...
  dumbObj(int _x, int _y) {
    x = _x; 
    y = _y; 
  }
        
  // methods...
  void update() {
    
    drawMe();
  }
  
  void drawMe() {
 //     background(0,99,99,150);
    pushMatrix(); 
      textFont(leachface);
      translate(x,y);
      stroke(0,89,89,55); 
      fill(205,0,0,100); 
   //   ellipse(0,0,10,10);
  //    text("m", 0, 0); 
    
      for (int i=0; i<20; i++) {
  //      fill(5,200,24, 255 - i*20 );
        fill(205,0,0,2);
        translate(i*15,0);
        rotate( radians(8) );
        scale (0.95); 
  //      text("m", 0,  -i*15);
        ellipse(i*15, 0, int(random(300)),int(random(300)));
      }
   
    popMatrix(); 

  }
}

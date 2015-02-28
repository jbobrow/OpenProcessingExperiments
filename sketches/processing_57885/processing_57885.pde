
/*
Sara Humel
andrewid: shumel
copyright @2012


press c, v, b, or ,n to make the design appear in different color combinations.
press the mouse buttons to make the boxes appear

*/

boolean Npress = false;
boolean Bpress = false;
boolean Vpress = false;
int x1, x2, y1, y2, x, y;
int b = 80;
int s = 5;
int z = 0;





void setup ( ) {
  size (400,400);
  smooth();
  background (0);
  stroke(255,255,255);
  strokeWeight(.5);
  
}

void draw ( ) {
 
}

void mousePressed(){
  fill(0);
  float z = random(width);
  int Z = int(z) ;
  float d = random(30);
  int D = int(d);
  rect(Z,Z-30,D,D);
   z = random(width);
  Z = int(z) ;
  d = random(30);
  D = int(d);
  rect(Z,Z-30,D,D);
     z = random(width);
  Z = int(z) ;
  d = random(30);
  D = int(d);
  rect(Z,Z-30,D,D);
     z = random(width);
  Z = int(z) ;
  d = random(30);
  D = int(d);
  rect(Z,Z-30,D,D);

   
}

void keyPressed( ){
if (key == 'c'){
  z++;
  
 drawBoxes(); 
}
if (key == 'n') {
  Npress=true;
  drawBoxes();
  Npress=false;
}
if (key == 'b') {
  Bpress=true;
  drawBoxes();
  Bpress=false;
}
if (key == 'v') {
  Vpress=true;
  drawBoxes();
  Vpress=false;
}
}



void drawBoxes() {

  while (x <= width){
  drawlines(x,y,b,s);
  x = x + b;
  y = y + b;
  }
  
  y = 0;
  x = 0;

  
  
}

void drawlines(int x, int y, int b, int s) {
  x1 = x;
  int count = 0;
  int c = 255; 
  if (Npress == true){
  stroke(random(255),random(255),random(255));
  }
  
  while (x <= x1+b){

     if (Bpress == true){
  stroke(random(255),random(255),random(255));
  }
  if (Vpress == true){
  stroke(255);
  }
    line(x,y,x1+b,y+b);
    line(x1,y,x,y+b);
    line(x+b,y,x1+b,y+b);
    line(x+b+b,y,x+b,y+b);
    x = x + s;
    
  
    
  }
}



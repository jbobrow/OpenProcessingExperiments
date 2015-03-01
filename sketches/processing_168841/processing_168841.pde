
float _x = 0;
float _y = 0;

void setup() {
 size(500,500);
 smooth();
 noCursor();
 
}

void draw() {
  background(0);
  _x = random(0,width);
  _y = random(0,height);
  //_x = mouseX;
  //_y = mouseY;
    for ( int i = 0; i<height; i+=15) {
      stroke(255,0,i); 
      line ( _x, _y, height , i);
      line ( i, 0, _x , _y);
      line ( 0, i, _x , _y);
      line ( i,width, _x,_y);
      
    }
  
  
}




void setup() {
  size(640,480);
  background(40);
}

int x=20;
int z=25;
int y=255-z;
int step = 0;

void draw() {
  noFill();
  
 
  stroke(0);
  bezier(4*x+320,0,4*x+30,220,4*x+100,400,4*x+320,240);
  bezier(4*x+320,240,4*x+580,30,4*x+10,250,4*x+320,480);
  x=0;


  
  stroke(255);
  stroke(255-(z*step));
  strokeWeight(15);
  bezier(320,0,30,220,100,400,320,240);
  bezier(320,240,580,30,10,250,320,480);
  //stroke(230);
  bezier(x+320,0,x+30,220,x+100,400,x+320,240);
  bezier(x+320,240,x+580,30,x+10,250,x+320,480);
  stroke(255-(z*step));
  bezier(2*x+320,0,2*x+30,220,2*x+100,400,2*x+320,240);
  bezier(2*x+320,240,2*x+580,30,2*x+10,250,2*x+320,480);
  x=x+20;
  step = step+1;
  if(x>480) {
    x=-320;
  }
}



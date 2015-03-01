
//doubling green bar movement


int x = 2;
int y = 3;

void setup(){  
  size(250, 250);
  frameRate(3);
}

void draw(){  //draw function loops 
 background(255,255,0); 
  fill(0,255,0);
   rect(x,y,240,10,10);
 x= x+1;
 y= y+x;
 println(x);
 }

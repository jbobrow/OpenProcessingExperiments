
int y = 0;
int x = 1920;
int w = 0;
int z = 1080;

void setup(){


size(1920,1080);
background (20,60,150);
/*
  fill(0);
  triangle(0,0,1920,0,1920,1080);
  fill(255);
  triangle(0,1080,1920,1080,0,0);*/
}


void draw (){
  
  stroke(255,160);
  line(0,0,x,y);
  stroke(0,160);
  line(w,z,1920,1080);
  
  y = y + 6;
  z = z - 6;


}


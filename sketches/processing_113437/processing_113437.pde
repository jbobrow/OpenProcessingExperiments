
int nw = 500; //number of horizontal objects 
int nh = 250; //number of vertical objects 

void setup(){
  size(1000, 500, P2D);
  background(255);
  colorMode(RGB,height,width,height);
  noStroke();
}

void draw(){
  background(255);
  int w = width/nw;
  int h = height/nh;

  for (int x = 0 ; x <= width ; x = x + w){    
  for (int y = 0 ; y <= height ; y = y + h){
    if((mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h)){
      fill(height,width,height);
    }
    else {
   fill(-y,x,y); //changing it is cool
    }

   rect(x,y,w,h);
  }
  }

}

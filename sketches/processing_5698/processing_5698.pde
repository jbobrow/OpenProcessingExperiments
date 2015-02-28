
int x;
int y;
float c;
int pixel_size = 5;
void setup(){
  size(400,400);
  
  
}

void draw(){

  for(x=0; x<=width; x=x+pixel_size){
    for(y=0;y<=height;y=y+pixel_size){
      c=random(10,255);
      stroke(c);
      fill(0);
      quad(x-pixel_size/2,y-pixel_size/2,x+pixel_size/2,y-pixel_size/2,x+pixel_size/2,y+pixel_size/2,x-pixel_size/2,y+pixel_size/2);
    }
  }
}


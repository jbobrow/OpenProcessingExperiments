
void setup(){
  size (400,400);//set up the size of canvas
  background (255);//set the background color to white
  smooth();
  frameRate(1);//set the frame rate
}

void draw(){
  float r;
  float g;
  float b;

  r=random(255);
  g=random(255);
  b=random(255);

  int y=0;
  for (int x=0;x<400;x=x+10) {
    line(x,y+1,400,y+1);
      stroke(r,g,b);//random color of lines
   
    for (y=0;y<400;y=y+10){
       line(x+1,0,400,x+1);
             
    }

  }
  

  
}

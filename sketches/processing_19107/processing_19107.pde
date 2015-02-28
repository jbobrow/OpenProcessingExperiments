
Star [] pixel;
int v=9;

void setup(){  
  size(1200,750);
   
  pixel = new Star[500];
  for(int i = 1; i < pixel.length; i++)
  pixel[i] = new Star();
}    

void draw(){    
  background(0);  
  for (int i=1;i<pixel.length;i++){
    pixel[i].orbit();
    pixel[i].display();
  } 
}    

class Star{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float size;
  
  Star(){
    c = color(random(0, 255));
    size = random(.1,2);
    xpos = random(1,width);
    ypos = random(1,height);
    yspeed = random(0,.3);
    xspeed = yspeed + random(0,.5);
  }
  
  void display(){
    rectMode(CENTER);
    stroke(c+5);
    fill(c);
    rect ((xpos-mouseX/v),(ypos-mouseY/v),size,size);
  }   
  
  void orbit(){
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
    if (ypos-mouseY/v > height){
       ypos = 0+ mouseY/v;
    }
    if (xpos-mouseX/v > width){
      xpos = 0 + mouseX/v;
    }
    if (ypos - mouseY/v < 0){
       ypos = height + mouseY/v;
    }
    if (xpos  - mouseX/v < 0 ){
      xpos = width + mouseX/v;
    }
  }
  
}                               

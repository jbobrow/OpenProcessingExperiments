
int x;
int y;

void setup(){
  size(600,600);
}

void draw(){
  background(11,59,4);

  x= 0;
  y= 0;

  while (y<600){
    x = 0;
    while (x<600){
      stroke(0);
      fill(255,y-200,0);
      ellipse(x,y,25,35);
      line(x,y-10,x,y+17);
      line(x-10,y-10,x+10,y-10);
      fill(0,0,y);
      
      ellipse(x-5,y-5,3,3);
      ellipse(x+5,y-5,3,3);
      ellipse(x-7,y+2,3,3);
      ellipse(x+7,y+2,3,3);
      ellipse(x-5,y+9,3,3);
      ellipse(x+5,y+9,3,3);
      fill(255);
      ellipse(x-5,y-22,4,4);
      ellipse(x+5,y-22,4,4);
    
      fill(0);
      ellipse(x,y-13,12,6);
      
      fill(255);
      ellipse(x-5,y-15,3,3);
      ellipse(x+5,y-15,3,3);
      
      
      stroke(255);
      line(x-5,y-22,x-2,y-17);
      line(x+5,y-22,x+2,y-17);
      
      stroke(165,113,60);
      line(x-10,y-10,x-15,y-20);
      line(x+10,y-10,x+15,y-20);
      line(x-12,y-8,x-17,y-4);
      line(x+12,y-8,x+17,y-4);
      line(x-12,y+4,x-15,y+14);
      line(x+12,y+4,x+15,y+14);
      
      x=x+37;
    }
    y=y+45;
  }
}



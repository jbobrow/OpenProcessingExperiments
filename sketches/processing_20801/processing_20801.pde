

void setup () {
    background(0,0,0);
  size(300,300);
 
  frameRate(25);
  smooth();
}
int x = 0;
int y = 0;

void draw(){

strokeWeight(2);
stroke(150, x,y/2, 30);
  noFill();
ellipseMode(CENTER); 
 ellipse(width/2,height/2,x, y);
  ellipse(width,height/2,x, y);
    ellipse(width/3,height/2,x, y);
    ellipse(width-100,height/2,x, y);
    ellipse(0,height/2,x, y);
      ellipse(width/2,height/4,x, y);
       ellipse(width/2,height-75,x, y);
    ellipse(width/2,0,x, y);
      ellipse(width/2,300,x, y);
    
 x++;
 y++;
 if (x>200){
 x=0;
 if (y>200){
 

 }
}
}




int x;
int y;

void setup(){
 size(500,500);
 noStroke();
 noFill();
 smooth();
 background(255);
 frameRate(5);
 x=20;
 y=80;

}

void draw(){
  background(255);
  
 fill(8,252,164);
  x=x+1;
  y=y+1;
 rect(x,y,150,50);
 
 fill(8,252,164);
  x=x+1;
  y=y+1;
 rect(x+150,y-30,40,40);
 
 fill(0);
 x=x+1;
 y=y+1;
 ellipse(x+20,y+50,50,50); 
 
 fill(0);
 x=x+1;
 y=y+1;
 ellipse(x+70,y+50,50,50);
 
 fill(0);
 x=x+1;
 y=y+1;
 ellipse(x+120,y+50,50,50);
}


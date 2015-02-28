
float x = 300;
float y = 400;
float r = 0;

void setup() {
  size(1100, 800);
  background(0);
  strokeWeight(40);
  frameRate(20);
}

void draw() {
  noStroke();
  fill(0,20);
  rect(0,0,1100,800);
 stroke(252,252,0);
  point(x, y);
    r=random(4);
    
    if (r<=1) {
      x = x+35;
    }
    else if (r<=2) {
      x = x-35;
    }
    else if (r<=3) {
      y = y+35;
    }

    else {
        y = y-35;
      
    }
  
if(x>1100){
    x=0;
}

if (x<0){
   x=800;
}
if(y>800){
  y=0;
}
if(y<0){
  y=800;
}



}






float col = 512;
float fatnessX;
float fatnessY;

void setup() {
  background(0);
  size(1024,300);
}

void draw () {
  ellipseMode(CENTER);
  col = col+fatnessX;
  fatnessX = 5;
  fatnessY = mouseY/3;
  
    if (col > 1024) {
      col = 512;
    }
      //fill(0,0,0,190);
      fill(0);
      rect(0,0,width,height);
      fill(255);
      if (col > 512) {
      //print("not first");
      ellipse( (512 -( col - 512)),height/2,fatnessX,fatnessY);
    }
    
          ellipse(col,height/2,fatnessX, fatnessY);
          
    }



float inc_x = 0;
float inc_y = 400;
boolean over = false;
boolean isF = false; 
boolean jump = false;
int count = 0;
human h;

void setup() {
  size(600, 600, P3D);
  
}


void catmullRom (float x1, float y1, float x2, float y2, 
float x3, float y3, float x4, float y4) { // equivalent to Processing curve() function
  beginShape();
  for (float t=0; t<=1; t+=0.02) {
    float t2 = t*t;
    float t3 = t2*t;
    float x= (-.5*x1 + 1.5*x2 -1.5*x3 + .5*x4)*t3 + (x1 -2.5*x2 +2*x3 -.5*x4)*t2 + (-.5*x1 + .5*x3)*t + x2;
    float y= (-.5*y1 + 1.5*y2 -1.5*y3 + .5*y4)*t3 + (y1 -2.5*y2 +2*y3 -.5*y4)*t2 + (-.5*y1 + .5*y3)*t + y2;
    vertex(x, y);
  }
  endShape();
}


void draw() {


  background(255);

  h = new human();
  

  strokeWeight(10);
  stroke(0);
  noFill();
  catmullRom(0, 0, -50, 500, width/2, inc_y, width+50, 500 );
  catmullRom(-50, 500, width/2, inc_y, width+50, 500, width, 0);

  
    if (inc_y > height || inc_y < 400) { 
      over = !over;
    }

    if (over == true) inc_y -= 6;
    if (over == false) inc_y += 6;

    if (inc_y > height - 25) {
      h.moveup();
    }

    if (inc_y < height - 50) {
      h.movedown();
    }

    h.jump();
    
    textSize(20);
    if (jump == true){
      count ++;
      text(count/10,25,50);
      
    }
    
    else if (jump == false) text(count/10, 25, 50);
  
}


class human {

  float x, y;
  float xl, yl;
  float size;
  float theta = 0;

  human() {
    x = width/2;
    y = 450;
    size = 80;
    xl = x;
    yl = y;
  } 

  void jump() {
    
    noStroke();
    fill(150, 100, 100);
    ellipse(x, y, size, size);
    
    stroke(150,100,100);
    line(x,y+40,x,y+100);
    line(x,y+100,xl-20,yl+150);
    line(x,y+100,xl+20,yl+150);
    
    
  }

  void moveup() {
    y -= 30;
    xl -= 10;
    yl -= 10;
    jump = !jump;
  }

  void movedown() {
    y += 30;
    xl += 10;
    yl += 10;
    jump = false;
  }
}

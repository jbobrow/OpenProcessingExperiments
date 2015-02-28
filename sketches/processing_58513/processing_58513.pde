
int a = 200;
float movmax = 10;
float movmin = 1;
Snake mysnake;
int snakelength = 100;

void setup() {
  size (600, 600);
  background(0);
  mysnake = new Snake();

    mysnake.xmov = random(-3, 3);
    mysnake.ymov = random(-3, 3);
}


void draw() {
  background(0);
    mysnake.movesnake();
    mysnake.display();
}

void mouseClicked (){
    mysnake.xmov = random(-5, 5);
    mysnake.ymov = random(-5, 5); 
}

class Snake {
  color c;
  float xpos;
  float ypos;
  float xmov;
  float ymov;
  Box[] tail;

  Snake() {                //Constructor
    c = color (0,255,0);
    xpos = width/2;
    ypos = height/2;
    xmov = 0;
    ymov = 0;
    tail=new Box[snakelength];
    
    for (int i = 0; i<snakelength; i++) {
      tail[i] = new Box();
      tail[i].xpos = 0;
      tail[i].xpos = 0;
      tail[i].c = c;
    }
    c = color (0,150,0);
  }

  void display() {
    for (int i = 0; i<snakelength; i++) {
      tail[i].display();
    }
    
    ellipseMode(CENTER);
    noStroke();
    fill(c);
    ellipse(xpos, ypos, 15, 15);
    
    
  }

  void movesnake() {
    movetail(xpos,ypos);
    xpos = xpos + xmov;
    ypos = ypos + ymov;
    if (xpos > width) {
      xpos = width;
      xmov = random(2, 5) * -1;
    }
    else {
      if (xpos < 0) {
        xpos = 0;
        xmov = random(2, 5);
      }
    }

    if (ypos > height) {
      ypos = height;
      ymov = random(2, 5) * -1;
    }
    else {
      if (ypos < 0) {
        ypos = 0;
        ymov = random(2, 5);
      }
    }
  }
  
  void movetail(float x,float y){
    for (int i=0;i<snakelength; i++){
      if(i+1 < snakelength) {
        tail[i].xpos = tail[i+1].xpos;
        tail[i].ypos = tail[i+1].ypos;
      }else{
        tail[i].xpos = x;
        tail[i].ypos = y;
      }
    }
  }
}


class Box {
  color c;
  float xpos;
  float ypos;
  float xmov;
  float ymov;

  Box() {
    c = color (255);
    xpos = width/2;
    ypos = height/2;
  }

  void display() {
    noStroke();
    ellipseMode(CENTER);
    fill(c);
    ellipse(xpos, ypos, 10, 10);
  }
}



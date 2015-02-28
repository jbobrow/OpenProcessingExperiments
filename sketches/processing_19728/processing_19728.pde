
Ball[] ball = new Ball[1];
Lane laneline1, laneline2, laneline3, laneline4,laneline5;
float r;
float g;
float b;
float hole;
boolean bStop;
float holeDISTX;
float holeDISTY;
float mouth;

void setup() {
  size(400,600);
  smooth();
  strokeWeight(3);
  laneline1 = new Lane(width*1/5,0,width*1/5,height);
  laneline2 = new Lane(width*2/5,0,width*2/5,height);
  laneline3 = new Lane(width*3/5,0,width*3/5,height);
  laneline4 = new Lane(width*4/5,0,width*4/5,height);
  laneline5 = new Lane(width,0,width,height);


  ball [0] = new Ball(mouseX+30, mouseY+30, random(2,10), random(255), g, random(255),random(255), hole, holeDISTX,holeDISTY, mouth);
}

void mousePressed() {

  Ball b = new Ball (mouseX, mouseY, random(2,10), random(255), g, random(255),random(255), hole, holeDISTX,holeDISTY, mouth);
  ball = (Ball[]) append(ball, b);
}
  
void keyPressed() {
  bStop = !bStop;
  if (bStop) {
     
    noLoop();

  }else
    loop();

   }




void draw() {
  background(255,213,121);
  laneline1.display();
  laneline2.display();
  laneline3.display();
  laneline4.display();
  laneline5.display();

  for (int i = 0; i < ball.length; i++) {
    ball[i].move();
    ball[i].display();
  }
}



class Lane { // the variables that make up the class lane.
  // fields
  float x;
  float y;
  float HEIGHT;
  //lane variables
  float lanelineY = 0;
  float laneline1 = width*1/5;
  float laneline2 = width*2/5;
  float laneline3 = width*3/5;
  float laneline4 = width*4/5;
  float laneline5 = width;

  //constructor // parameters/variables for creating a lane
  Lane(float tempX, float tempY, float tempX2, float tempHEIGHT) {
    x = tempX;
    x = tempX2;
    y = tempY;
    HEIGHT = tempHEIGHT;
  }

  //method
  void display() {
    stroke(170,123,121);
    strokeWeight(5);
    line(laneline1,lanelineY,laneline1,HEIGHT);
    line(laneline2,lanelineY,laneline2,HEIGHT);
    line(laneline3,lanelineY,laneline3,HEIGHT);
    line(laneline4,lanelineY,laneline4,HEIGHT);
    line(laneline5,lanelineY,laneline5,HEIGHT);
  }
}

class Ball {
  float r;
  float g = 0;
  float b; 
  float x;
  float y;
  float speed;
  float DIAM = random(50,200); 
  float hole = random(4,7);
  float holeDISTX = random(10,20);
  float holeDISTY = random(7,15);
  float mouth = random(10,30);


  Ball(float tempX, float tempY, float tempSpeed, float tempR, float tempG, float tempB, float DIAM, float hole, float holeDISTX, float holeDISTY, float mouth) {
    x = tempX;
    y = tempY;
    speed = tempSpeed;
    r = tempR;
    g = tempG;
    b = tempB;
    DIAM = DIAM;
    hole = hole;
    holeDISTX = holeDISTX;
    holeDISTY = holeDISTY;
    mouth = mouth;
  }

  void display() {
    noStroke();
    fill(r,g,b);
    ellipse(x, y,DIAM,DIAM);
    fill(255);
    ellipse(x-holeDISTX*1.5,y-holeDISTY*.35,hole,hole); //holes
    ellipse(x,y+holeDISTY*1.5,mouth,mouth);
    ellipse(x+holeDISTX*1.5,y-holeDISTY*.35,hole,hole);
  }

  void move() {
    y = y + speed; 
    {
      if (y < 3 || y > height+3) {
        speed = speed*-1;
      }
    }
  }
}



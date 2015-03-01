
//A snake made of quads that swims around in 2 d space.


int count=20;
snake[] snakes;

snake s1, s2; 

void setup() {
  colorMode(HSB);
  size(1024, 576);
  frameRate(15);
  background(0);

  snakes = new snake[count];
  int index = 0;
  for(int i=0;i<count;i++){
   snakes[i]=new snake(random(width),random(height),int(random(40,90)));
  }
}

void draw() {
  background(0);
  //fill(10,10,10, 2);
  //rect(0, 0, width, height);
  for (int i=0; i< count; i++){
   snakes[i].swim();
  snakes[i].display();
  }
}

class snake {

  int pieces;//how many triangles make up the snake
  float[] []x;//position
  float c;
  float[]v;//velocity


  //constructor
  snake(float x_, float y_, int p_) {
    pieces = p_;
    x = new float[pieces][2];
    v = new float[2];

    for (int i=0; i<pieces; i++) {
      x[i][0] =x_;
      x[i][0]=y_;
    }
    c = random(255);
  }

  void swim() {

    for (int i=pieces-1; i>0; i--) {

      x[i][0] = x[i-1][0] + sin(frameCount/100)*10;
      x[i][1] = x[i-1][1] + sin(frameCount/24)*4;
    }
    
    if (x[0][0] < 200) {
      v[0]=10;
    }
    if (x[0][0]>width-200) {
      v[0]=-10;
    } else {
      v[0] += random(-1, 1);
    }
    if (x[0][1]<50) {
      v[1]=10;
    }
    if (x[0][1]>height-50) {
      v[1]=-10;
    } else { 

      v[1] += random(-1, 1);
    }


    x[0][0]  = x[0][0]  + v[0];
    x[0][1] = x[0][1] + v[1];
  }

  void display() {
    noStroke();
    
    
    fill(c,200,200, 185);
    
    beginShape(TRIANGLE_STRIP);
    
    for (int i=0; i<pieces; i++) {
      //fill((c + i)%255,200,200, 255);
      vertex(x[i][0] + random(-5,5)  + i%23-12,x[i][1] + random(-5,5) + i%33 - 16);
      //quad(x[i][0],x[i][1],x[i+1][0],x[i][1],x[i+1][0],x[i+1][1],x[i][0],x[i+1][1]);
      //fill((120+c+2*i)%255,200,200,125);
      //quad(x[i+1][0]-20,x[i][1],x[i][0]+20,x[i][1],x[i][0]+20,x[i+1][1],x[i+1][0]-20,x[i+1][1]);
    }
    endShape();
  }
}





//Raindrops
//By: Johnny Dunn
//Coding for rain for loops used from Daniel Shiffman



Rain[] rain = new Rain[1000];

int totalRain = 0;
float k = 0;

void setup() {
  size(600,600);
  smooth();
  background(0);
  noStroke();

}

void draw() {
rectMode(CENTER);
fill(0,0,0,20+k);
rect(width/2,height/2,width,height);

  rain[totalRain] = new Rain();

  totalRain++ ;

  if (totalRain >= rain.length) {
    totalRain = 0; //Start over
  }

   for (int i = 0; i < totalRain; i++ ) { 
    rain[i].drop();
    rain[i].display();
  }

}


void keyPressed()
  {
    if (keyCode == UP) {
      k+=3;
    } else if (keyCode == DOWN) {
      k-=3f;
    }
  }

class Rain { 
  float x, y;
  float r;
  float gravity;
  color c;

  
  Rain () {
    r = 4;
     x = random(width);
   y = 0;
   c = color(50,100,150);
    gravity = random(1.5f,3.5);
  }
  
  void drop() {
    y += gravity;
  }
    
    void display() {
      for (int i=2; i<8; i++) { 
      noStroke();
      fill(5,100,150);
      ellipse(x,y , r,r);
      }
    }

}




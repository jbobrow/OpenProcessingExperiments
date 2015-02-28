
int num_part = 320;
hibana[] cuties = new hibana[num_part];
Boolean isSetup = false;

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB, 360);
  

 smooth();
}


void draw() {
  if (mousePressed) {
    for (int i=0; i<num_part; i++) {
      cuties[i] = new hibana(mouseX, mouseY);
    }
    isSetup = true;
  }
  if (isSetup == true) {
    for (int i = 0; i<num_part; i++) {
      cuties[i].update();
  
      
    }
  }
}


//hibana no sekkeizu
class hibana {
  float x_pos;
  float y_pos;
  float x_speed;
  float y_speed;
  int w;
  //int c;

  hibana(int x, int y) {
    x_pos = x;
    y_pos = y;
    x_speed = random(-1,1);
    y_speed = random(-12,-5);
    w = int( random(5) );
  }

  void update() {
    x_pos = x_pos + x_speed;
    y_pos = y_pos + y_speed;
    y_speed -= -0.1;

    //c = (int)random(255); 
    fill(random(190,320),random(270,360) ,random(300,360),80);
    noStroke();
    ellipse(x_pos, y_pos, w-2, w+4);
  }
}

void reset(){
background(0);
}

void keyPressed(){
  reset();
}


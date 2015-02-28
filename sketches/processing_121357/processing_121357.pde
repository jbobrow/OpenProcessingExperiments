
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/85162*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int num_part = 320;
hibana[] cuties = new hibana[num_part];
Boolean isSetup = false;

void setup() {
  size(300, 700);
  background(70);
  colorMode(HSB, 100);
  

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
    x_speed = random(-300,1);
    y_speed = random(-1,-5);
    w = int( random(50) );
  }

  void update() {
    x_pos = x_pos + x_speed;
    y_pos = y_pos + y_speed;
    y_speed -= -0.1;

    //c = (int)random(255); 
    fill(random(1,320),random(1,360) ,random(1,360),90);
    noStroke();
    ellipse(x_pos, y_pos, w-2, w+4);
  }
}

void reset(){
background(100);
}

void keyPressed(){
  reset();
}



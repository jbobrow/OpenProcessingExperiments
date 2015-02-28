
//Trig Strings : By Drew Ratliff


//trig stuff
float angle = 0.0;
float speed = .05;
//radius
float range = 300;
int num = 3;
boolean dir = true;
String cut = "add/cut-strings(spacebar/delete)";
PFont font;



Wave[] wavers;

void setup() {
  font = loadFont("KravitzThermal-48.vlw");
  textFont(font);
  smooth();
  size (750,300);
 
  wavers = new Wave[300];
  
  for(int i = 0; i < 300; i++) {
    //random set x for...       bezier1           bezier2
    wavers[i] = new Wave(int(random(width)),int(random(width)));
  }

}


void draw () {
  //set background, make random same, translate to middle
  background(0);
  randomSeed(6);
  translate(0,height/2);
  
  for(int i = 0; i < num; i++) {

    wavers[i].display();
    //wavers[i].update();
    
    if(i == num/4) {
      fill(255);
      //text("by: drew ratliff",width/2,28);
      textSize(48);
      text("strings", width/2-200,0);
       
    }
  }
  if(dir == true) {
          textSize(24);
          text("directions (d)", width/2-200,20);
          text("speed(left/right)", width/2-200,40);
          text("range(down/up)", width/2-200,60);
          text(cut, width/2-200,80);
      }
  
  angle += speed;
  println(dir);
}



class Wave {
  float b1x;
  float b1y;
  float b2x;
  float b2y;
  float sinval;
  float cosval;
  color neons;
 
  
  Wave(float x1, float x2) {

    b1x = x1;
    b2x = x2;
    neons = color(random(255),random(255),random(255),random(150,255));
  }
  
  void display() {
    
    //Trig Math for motion
    sinval = sin(random(angle));
    cosval = cos(random(angle));
    float b1y =  (sinval * range);
    float b2y = (cosval * range);
    
    stroke(neons);
    
    //draw string
    noFill();
    beginShape();
    vertex(0,0);
    bezierVertex(b1x,b1y,b2x,b2y,width,0);
    endShape();    
  }
}
  

  /*void update() {
    
    sinval = sin(random(angle));
    cosval = cos(random(angle));
    float b1y =  (sinval * range);
    float b2y = (cosval * range);
  }*/


void keyPressed() {
    if (key == 'd') {
      if (dir == true) {
        dir = false;
      } else {
        dir = true;
      }
    }
      
  if (key == BACKSPACE) {
    if (num > 2) {
    num = num - 2;
    }
  }
  if (key == ' ') {
    if (num < 150) {
      num = num + 2;
    }
  }
    if (key == CODED) {
        if (keyCode == RIGHT) {
          if(speed < .15) {
          speed = speed + .002;
          }
        }
        else if (keyCode == LEFT) {
          if(speed > 0) {
          speed = speed - .002;
          }
        }
        else if (keyCode == UP) {
          if (range < 700) {
          range = range + 10;
          }
        }
        else if(keyCode == DOWN) {
          if (range > 75) {
          range = range - 10;
          }
        }
    }
}


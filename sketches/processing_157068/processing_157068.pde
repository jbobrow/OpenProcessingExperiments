
int numb = 10;

//int diameter = 60;
int[] diameter = new int[numb];

PVector[] pVect = new PVector[numb];
boolean[] doLerp = new boolean[numb];

boolean jumpSize;

color[] randoFill = new color[numb];

float pulse;
float count;

void setup() {
  size(800, 800);
  colorMode(HSB);
  textSize(20);

  for (int i = 0; i < numb; i++) {
    pVect[i] = new PVector(random(width), random(height));

    randoFill[i] = color(100, 255, random(0,100));
    diameter[i] = 60;
  }
  //println(pVect);
  count = 1;
}

void draw() {
  background(250);
  
  pulse = sin(millis() * 0.002);
  

  for (int i = 0; i < numb; i++) {
    fill(randoFill[i], 30);
    stroke(randoFill[i], 10); //same color stroke
    strokeWeight(10); //thicker lines

    if (doLerp[i]) { //check to see if this particular one should be moved
      jump(i);
      
      pVect[i].lerp(mouseX, mouseY, 0.0, 0.25); //lerp is an easy way to do easing, which we learned about before (the ellipses are being dragged with a suble delay)
      
      //fill(80); //use black text
      text("(" + pVect[i].x + ",   " + pVect[i].y + ") " + diameter[i], pVect[i].x, pVect[i].y + 80); //show us what our position is on-screen
    } else {
    diameter[i] = int(map(pulse, -1, 1, 60, 70));
      
    }
    
    ellipse(pVect[i].x, pVect[i].y, diameter[i], diameter[i]);
  }
}


void mouseDragged() {
  for (int i = 0; i < numb; i++) {
    if (dist(mouseX, mouseY, pVect[i].x, pVect[i].y) < diameter[i]/2) {
      //println("drag");
      count += .0002;
       // println(count);
      doLerp[i] = true;
    }
  }
}
/*
void mouseReleased() {
  for (int i = 0; i < numb; i++) {
    doLerp[i] = false;
  }
}*/

void jump(int size){
  diameter[size] = int(    map(sin(millis() * 0.01), -1, 1, 60, 90 + count)    );
  //println(diameter[size]);
  //diameter[size] += 30;
}


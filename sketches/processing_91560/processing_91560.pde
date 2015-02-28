
float[] xfood = new float[20];
float[] yfood = new float[20];
float[] xMine = new float[0];
float[] yMine = new float[0];
float[] enemyX = new float[0];
float[] enemyY = new float[0];
float[] angle = new float[0];
float[] x = new float[1];
float[] y = new float[1];
float[] prevx;
float[] prevy;
boolean lost = false;
float score = 0;
float multiplier;

int foodNum = 0;
float segLength = 10;

int counter = 0;
int loc = -1;
boolean clicked = false;

float enemySpeed = 5;
float dirCounter = 0;

void setup() {
  size(800, 800);
  strokeWeight(10.0);
  stroke(255, 100);
  noCursor();
}


void draw() {
if(!lost){
  
  background(0);
    lose();
  drawEnemy();
  drawFood();
  drawMines();
 // contactMine();
  contactMine2();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255);
  dragSegment(0, mouseX, mouseY);

  for (int i=0; i<x.length-1; i++) {
    stroke(0,50,255, 100);
    dragSegment(i+1, x[i], y[i]);
    stroke(255, 100);
    /*if(i+1 >= x.length-1){
      fill(0, 50, 200);
      ellipse(x[i], y[i], 25,25);
      fill(255);
    }*/
  }

  if (random(0, 100)>(100-multiplier/10-1)) {
    createEnemy();
  }

  if (counter>random(40, 100)) {
    if (foodNum <= 1000) {
      makeFood();
      //createEnemy();
      counter = 0;
    }
  }
  counter++;

  if (contact()) {
    x = newArray(x, 0);
    y = newArray(y, 0);
    xfood[loc] = 0;
    foodNum--;
    multiplier++;
  }
  
//poooooooooooooooooooooop
  if (x.length>1 && clicked) {
    if (hasSpace(xMine)) {
      addMine(x[x.length-1], y[y.length-1]);
    } 
    else {
      xMine = newArray(xMine, x[x.length-1]);
      yMine = newArray(yMine, y[y.length-1]);
    }
    x = shrinkArray(x);
    y = shrinkArray(y);
    multiplier--;
  }

  clicked = false;

  score = score + multiplier +1;
} else{
    text("you lose", 400, 400);
}
  text("Score: " + score, 10, 20);
  text("Multiplier: " + multiplier, 10, 35);
}




void addMine(float xx, float yy) {
  for (int i = 0; i < xMine.length; i++) {
    if (xMine[i] == 0) {
      System.out.println(xMine[i]);
      xMine[i] = xx;
      yMine[i] = yy;
      break;
    }
  }
}


boolean hasSpace(float[] arr) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == 0) {
      return true;
    }
  }
  return false;
}



void mousePressed() {
  clicked = true;
}

void makeFood() {
  for (int i = 0; i < xfood.length; i++) {
    if (xfood[i] == 0) {
      xfood[i] = random(0, 800);
      yfood[i] = random(0, 800);
      foodNum++;
      break;
    }
  }
}

void drawFood() {
  strokeWeight(0);
  for (int i = 0; i < xfood.length; i++) {
    if (xfood[i] != 0) {
      fill(0, 0, 255);
      ellipse(xfood[i], yfood[i], 5, 5);
    }
  }
  strokeWeight(10.0);
  fill(255);
}


void drawMines() {
  strokeWeight(0);
  
  for (int i = 0; i < xMine.length; i++) {
    fill(100, 100, 255);
    if (xMine[i] != 0) {
      ellipse(xMine[i], yMine[i], 10, 10); 
      noFill();
      stroke(0, 50, 255);
      ellipse(xMine[i], yMine[i], 100, 100);
    }
  }
  strokeWeight(10.0);
  stroke(255, 100);
  fill(255);
}


boolean contact() {
  for (int i = 0; i < x.length; i++) {
    for (int j = 0; j < xfood.length; j++) {
      if ((xfood[j]+5) > x[i] && x[i] > (xfood[j]-5) && y[i] > (yfood[j]-5) && y[i] < (yfood[j]+5)) { 
        loc = j;
        return true;
      }
    }
  }
  return false;
}



float[] newArray(float[] arr, float input) {
  float[] newThing = new float[arr.length+1];
  for (int i = 0; i < arr.length; i++) {
    newThing[i] = arr[i];
  }
  newThing[newThing.length-1] = input;
  return newThing;
}


float[] shrinkArray(float[] arr) {
  float[] arra = new float[arr.length-1];
  for (int i = 0; i < arra.length; i++) {
    arra[i] = arr[i];
  }
  return arra;
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}


//////////////

void createEnemy() {
  float newX = random(1, 800);
  float newY = random(1, 800);
  if (hasSpace(enemyX)) {
    makeEnemy(newX, newY);
  } 
  else {
    enemyX = newArray(enemyX, newX);
    enemyY = newArray(enemyY, newY);
    angle = newArray(angle, random(0, 360));
  }
}


void makeEnemy(float newX, float newY) {
  for (int i = 0; i < enemyX.length; i++) {
    if (enemyX[i] == 0) {
      enemyX[i] = newX;
      enemyY[i] = newY;
      angle[i] = random(0, 360);
      break;
    }
  }
}




void drawEnemy() {
  background(0);
  //fill(random(255), random(255), random(255));
  fill(255, 0, 0);
  for (int i = 0; i < enemyX.length; i++) {
    if (enemyX[i] != 0) {
      ellipse(enemyX[i], enemyY[i], 20, 20);
      enemyX[i] = enemyX[i] + enemySpeed*cos(angle[i]);
      enemyY[i] = enemyY[i] - enemySpeed*sin(angle[i]);
    }
  }
  if (dirCounter > random(20,40)) {
    for (int i = 0; i < angle.length; i++) { 
      angle[i] = random(0, 360);
    }
    dirCounter = 0;
  }
  dirCounter++;
  fill(255);
}


void contactMine2() {
  for (int i = 0; i < xMine.length; i++) {
    for (int j = 0; j < enemyX.length; j++) {
      if ((enemyX[j]+50) > xMine[i] && xMine[i] > (enemyX[j]-50) && yMine[i] > (enemyY[j]-50) && yMine[i] < (enemyY[j]+50)) { 
        xMine[i] = 0;
        yMine[i] = 0;
        enemyX[j] = 0;
        enemyY[j] = 0;
        angle[j] = 0;
        score = score + multiplier*5;
      }
    }
  }
}
/*void contactMine() {
  //for(int i = 0; i < x.length; i++){
     for (int j = 0; j < enemyX.length; j++) {
       if ((enemyX[j]+15) > x[x.length-1] && x[x.length-1] > (enemyX[j]-15) && y[x.length-1] > (enemyY[j]-15) && y[x.length-1] < (enemyY[j]+15)) { 
        // xMine[i] = 0;
        // yMine[i] = 0;
         enemyX[j] = 0;
         enemyY[j] = 0;
         angle[j] = 0;
       }
    }
 // }
}*/

///////////

/*void lose() {
  for (int i = 0; i < x.length; i++) {
    if(x[i] != 0){
      for (int j = 0; j < enemyX.length; j++) {
        if (x[i] < (enemyX[j]+10) && x[i] > (enemyX[j]-10) && y[i] > (enemyY[j]-10) && y[i] < (enemyY[j]+10)) {
          delay(30000);
        }
      }
    }
  }
}*/

void lose() {
  for(int i = 0; i < x.length; i++){
      for (int j = 0; j < enemyX.length; j++) {
        if (mouseX < (enemyX[j]+15) && mouseX > (enemyX[j]-15) && mouseY > (enemyY[j]-15) && mouseY < (enemyY[j]+15)) {
          lost = true;
        }
        if(x[i] != 0 && x[i] < (enemyX[j]+12) && x[i] > (enemyX[j]-12) && y[i] > (enemyY[j]-12) && y[i] < (enemyY[j]+12)){
          lost = true;
        }
      }
  }
}


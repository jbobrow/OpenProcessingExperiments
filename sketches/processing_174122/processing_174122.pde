
float originX, originY;
float unitX, unitY;
float[] pointsX, pointsY;
float a = 1.0;
float b = .7;
int barHeight;

int numPoints = 1000;
int numTrials = 10000;
void setup(){
  size(600, 800);
  background(255);
  stroke(0);
  barHeight = height/8;
  
  originX = width/8;
  originY = 0.9 * height;
  
  unitX = 300;
  unitY = 300;
  
  pushMatrix();
    translate(originX, originY);
    strokeWeight(1);
    line(-originX, 0, width - originX, 0);
    line(0, -originY, 0, height - originY);
  popMatrix(); 
 
  stroke(255, 0, 0); 
  strokeWeight(2);
  fill(255, 0, 0, 1);
  rectMode(CORNER);
  rect(dispX(0), dispY(1), unitX, unitY);
  
  pointsX = new float[numPoints];
  pointsY = new float[numPoints];
  randomArray(pointsX, 0, 1);
  randomArray(pointsY, 0, 1);
  showPoints(pointsX, pointsY);
  
  graphF();
  //drawLine();
  
 // strokeWeight(10);
 // stroke(0, 255, 0);
 // point(dispX(coordX(originX + unitX)), dispY(f(coordX(originX + unitX))));
 displayBar();
 displayInfo();
 
 
 
 
}

void draw(){
}

void mouseClicked(){
  setup();
}

float f(float x_){
  //return a*x_ + b;
  return x_ * x_;
}



float dispX(float x_){
  return originX  + x_ * unitX;
}

float dispY(float y_){
  return originY - y_ * unitY;
}

float coordX(float x_){
  return (x_ - originX)/unitX;
}
float coordY(float y_){
  return -(y_ - originY)/unitY;
}

void randomArray(float[] m, float a, float b){
  for(int i = 0; i < m.length; i++){
    m[i] = random(a, b);
  }
}

void showPoints(float[] x, float[] y){
  for(int i = 0; i < x.length; i++){
    if(inRange(x[i], y[i])){
      stroke(0, 0, 255);
    }else{
      stroke(0);
    }
    point(dispX(x[i]), dispY(y[i]));
  }
}



void graphF(){
  strokeWeight(3);
  stroke(0, 255, 0);
  for(int i = int(0); i < int(width); i++){
    point(i, dispY(f(coordX(i))));
  }
}

void drawLine(){
  stroke(0, 255, 0);
  strokeWeight(1);
  line(dispX(coordX(0)), dispY(f(coordX(0))), dispX(coordX(width)), dispY(f(coordX(width))));
  
}

boolean inRange(float x, float y){
  return y > f(x);
}

int countPoints(float[] x_, float[] y_){
  int counter = 0;
  for(int i = 0; i < x_.length; i++){
    if(inRange(x_[i], y_[i])){
     counter++; 
    }
  }
  return counter;
}

void displayBar(){
  rectMode(CORNER);
  fill(190);
  stroke(230);
  strokeWeight(5);
  rect(0, 0, width - 2, barHeight);
}

void displayInfo(){
  float textH;
  textH = barHeight/6;
  textSize(textH);
  fill(0);
  float goodPoints;
  goodPoints = countPoints(pointsX, pointsY);
  textAlign(LEFT, CENTER);
  text("The total number of points: " + numPoints, 10, 1.1 * textH );
  text("The number of points satisfying the condition: " + goodPoints, 10, 2.2 * textH);
  text("The probability is approximately:" + goodPoints/numPoints * 100 + "%", 10, 3.3 * textH);
  text("Average probability from " + numTrials + " trials: "
                  + averagedProb(numTrials) * 100 + "%.", 10, 4.4 * textH);
  //text("The exact probability is: " + exactProbability(a, b)+ ".",10,  4.4 * textH);
}

float averagedProb(float n){
   float sumInRange = 0;
   for(int i = 0; i < n; i++){
   randomArray(pointsX, 0, 1);
   randomArray(pointsY, 0, 1);
   sumInRange += countPoints(pointsX, pointsY);
 }
 return sumInRange / (n * numPoints) ;
}




float exactProbability(float a_, float b_){
  float answer;
  
  answer = 999999; 
  
  if(a > 0){
    if(b >= 1){
      answer = 0;
    }else if(b >= 0){
      if(b >= 1 - a){
        answer = 0.5 * (1 - b) * (1 - b)/ a; 
      }else{
        answer = 1 - 0.5 * (b + a + b);
      }
    }else if(b < -a){
      answer = 1;
    }else{
      answer = 0.5 * (-b/a + (1 - b)/a);
    }
  }else if(a < 0){
    if(b <= 0){
      answer = 1;
    }else if(b < 1){
      if(b < -a){
        answer = 1 - 0.5 * b * (-b / a);
      }else{
        answer = 1 - 0.5 * (b + a + b);
      }
    }else if(b > 1 - a){
      answer = 0;
    }else{
      answer = 0.5 * (1 - b)/a * (1 - (a + b));
    }
  }else if(a == 0){
    if(b > 1){
      answer = 0;
    }else if(b < 0){
      answer = 1;
    }else{
      answer = 1 - b;
    }
  }
  return answer;
}



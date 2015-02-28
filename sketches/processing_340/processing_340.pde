
float v = 0;
float inc = .01;

float v2 = 1;
float inc2 = -.01;

float[] xes = new float[100];
float[] yes = new float[100];

int counter = 0;
int flag = 1;

int factor;

void setup(){
  size(500, 500);
  background(0);
  smooth();
  noStroke();
}

void draw(){
  noStroke();
      
  if (counter % 4 == 0){
     switchFill(flag);
  }
  if (counter % 12 == 0  && counter != 0){
    delay(4000);
    fill(0);
    rect(0, 0, 500 ,500);
    fill(255);
  }

  if (flag == 2){
    factor = 600;
  }
  else{
    factor = 400;
  }
  
  beginShape();
  for (int i = 0; i < 100; i++){
    xes[i] = noise(v) * factor;
    yes[i] = noise(v2) * factor;
   vertex(xes[i], yes[i]);
    v += inc;
    v2 += inc2;
  }
  endShape();

  translate(500, 500);
  rotate(PI);

  
  beginShape();
  for (int i = 0; i < 100; i++){
    vertex(xes[i], yes[i]);
  }
  endShape();
  
  delay(1000);
  counter++;
}

void switchFill(int flagc){
   if (flagc == 0){
    flag = 1;
    fill(255, 0, 0); 
   }
   else if (flagc == 1){
     flag = 2;
     fill(255);
   }
   else if (flagc == 2){
     flag = 0;
     fill(125);
   }
}


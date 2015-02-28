
int nElements = 5;
int myArray[] = new int[nElements];

void setup(){
  size(500, 500);
  for (int i=0; i < nElements; i++){
    int randomInt = (int)random(255);
    myArray[i] = randomInt;
  }
}

void draw(){
  background(218, 78, 137);
  noStroke();
  smooth();
  float centerX = width/2;
  float centerY = height/2;  
  int count = 0;
  for (float i = 0; i< 2*PI; i += 2*PI/5){
    float amplitude = 100;
    float cxPos = centerX + amplitude * sin(i);
    float cyPos = centerY + amplitude * cos(i);
    fill(myArray[count]);
    ellipse(cxPos, cyPos, 100, 100);
    if (myArray[count] == 255){
      myArray[count] = 0;
    } else {
      myArray[count] += 1;
    }
    count += 1;
    
  }
}

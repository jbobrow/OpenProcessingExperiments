
float widt = 750;
float spacing = 20;
int nTargets;

void setup(){
  size(750,750);
  background(255);
  drawTargets();
  drawGrid();
}

void draw(){
}

void drawTargets(){
  int[] indices = {1,2,3,4,5,6,7,8,9};
  indices = shuffleMe(indices);
  noStroke();
  fill(color(200,100,100));
  nTargets = floor(random(4.99));
  for(int i=0;i<nTargets;i++){
    float x = floor(indices[i]/3)*widt/3+spacing;
    float y = (indices[i]%3-1)*widt/3+spacing;
    rect(x,y,widt/3-2*spacing,widt/3-2*spacing);
  }
}

void drawGrid(){
  float thickness = random(3*spacing);
  strokeWeight(thickness);
  stroke(50);
  float dS = widt/9;
  for(int i=0;i<10;i++){
    line(i*dS,0,i*dS,widt);
    line(0,i*dS,widt,i*dS);
  }
}

int[] shuffleMe (int[] arrMy) {
  for (int k=0; k < arrMy.length; k++) {
    int x = (int)random(0, arrMy.length);
    arrMy = swapValues(arrMy, k, x);
  }
  return arrMy;
}

int[] swapValues (int[] myArray, int a, int b) {
  int temp=myArray[a];
  myArray[a]=myArray[b];
  myArray[b]=temp;
  return myArray;
}

void mousePressed(){
  background(255);
  drawTargets();
  drawGrid();
}




int rectNumb = 100;
float xRectPos[] = new float[rectNumb];
float yRectPos[] = new float[rectNumb];
float rectSize[] = new float[rectNumb];


void setup(){

  size(600, 600);
  noStroke();
  
  //RANDOM POSITIONS AND RANDOM SIZES
  for(int i = 0; i < rectNumb; i++){
    xRectPos[i] = random(0, width);
    yRectPos[i] = random(0, height);
 
    rectSize[i] = random(5, 30);

    colorMode(HSB,100);
    
  }
  
}

void draw(){
  background(100);  

  //DRAW BALLS AND COLOR THEM
  for(int i = 0; i < rectNumb; i++){
    rect(xRectPos[i], yRectPos[i], rectSize[i], rectSize[i]);
    fill(i,100,100);
  }
}

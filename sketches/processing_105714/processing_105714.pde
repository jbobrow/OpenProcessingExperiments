
int rectNumb = 100;
float xRectPos[] = new float[rectNumb];
float yRectPos[] = new float[rectNumb];
float rectSize[] = new float[rectNumb];
int j=0;

void setup(){

  size(600, 600);
  noStroke();
  
  //RANDOM POSITIONS AND RANDOM SIZES
  
  for(int i = 0; i < rectNumb; i++){
    xRectPos[i] = i*6;
    yRectPos[i] = i*6;
 
    rectSize[i] = random(5, 70);

    colorMode(HSB,100);
    
  }
  
}

void draw(){
  background(0);  

  //DRAW RECTANGLES AND COLOR THEM
  for(int i = 0; i < rectNumb; i++){
    rect(xRectPos[i], yRectPos[i], rectSize[i], rectSize[i]);
    fill(i,100,100);
    stroke(0);
  }
}

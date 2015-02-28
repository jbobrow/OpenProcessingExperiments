
//Dimensional Scribbles by Hannah Kim 

//Move mouse around to move the scribble source.
//Click once to make random scribbles and twice to make even more 
//unruly lines. Then, click the third time to stop the scribbles
//and keep the shape. Press the space bar to clear the page. 

float changeSize = 2;
float centerX, centerY;
float[] x = new float[15];
float[] y = new float[15];
int index;

void setup(){
size(1000,500); 
background(255);
centerX = width/2;
centerY = height/2;
stroke(0,50);
noCursor();
}

void draw(){
    
  changeSize = map(index, 0,1, 1,10);

  centerX += (mouseX-centerX) * 0.01;
  centerY += (mouseY-centerY) * 0.01;

  for (int i=0; i<15; i++){
    x[i] += random(-changeSize,changeSize);
    y[i] += random(-changeSize,changeSize);
  }

  strokeWeight(0.75);
  
  noFill();

    beginShape();
    
    curveVertex(x[15-1]+centerX, y[15-1]+centerY);
    
    for (int i=0; i<15; i++){
    curveVertex(x[i]+centerX, y[i]+centerY);
    }
    curveVertex(x[0]+centerX, y[0]+centerY);

    curveVertex(x[1]+centerX, y[1]+centerY);
    endShape();
  }


void mousePressed(){
  index = index + 1; 
  if(index > 2){
    index=0;
  }
}

void keyPressed(){ 
  if (key == ' '){
    background(255); 
  }
}

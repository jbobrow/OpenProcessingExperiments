
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

int a=5;
int b=5;

void setup(){
  size(800,600);
  background(0);
  smooth();
}

void draw(){
  noStroke();
  fill(0);
  rect(0,0,width,height);
  
  // for funtion - Grid
  for(int i=0; i<width; i=i+b){            // create horizontal coordinates
    for (int j=0; j<height; j=j+b){        // create vertical coordinates
      fill(0,random(255),random(255),100); 
      ellipse(i,j,a,a);
      
      // changing of parameters to increase size of grid with mouse
      a=5+mouseX;
      b=5+mouseY/5;
    }
  }
}

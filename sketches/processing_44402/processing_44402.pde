
void setup(){
  size(800,800);
  background(255);
  frameRate(1000);
  colorMode(RGB, 255,255,255,100);
}

public float xaxis = 0;
public float yaxis = 0;
public int r = int(random(0,255));
public int g = int(random(0,255));
public int b = int(random(0,255));

void draw(){

 // Set up random numbers 
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));

  
  //Increase or Decrase X axis
  if(xaxis >= 0 && xaxis < width){
      xaxis++;
    }
  else{
      xaxis = 0;
      if(yaxis < height && yaxis >=0){
      yaxis++;
      println(yaxis);
      }
      else {
       yaxis = 0; 
      }
    }
  
  stroke(r,g,b);
  strokeWeight(1);
  
  line(xaxis, yaxis, (width / 2), (height / 2));
   
}

void mousePressed(){
 noLoop(); 
}



void setup(){
  size(800,800);
  background(0);
  frameRate(1000);
  colorMode(RGB, 255,255,255,100);
}

public float xaxis = 0;
public float yaxis = 0;
public int r = int(random(0,255));
public int g = int(random(0,255));
public int b = int(random(0,255));
//Size of Circle
public int ellipsesize = int(random(2,5));
//Determine if Bigger or Smaller than this number
public int constanti = int(random(49.5,50));

public int raction = 0;
public int gaction = 0; 
public int baction = 0;




void draw(){
  
  //Why dosen't this support a transparent bg?
 // fill(255,255,255,1);
  //rect(-10,-10,width + 20,height + 20);
  

  raction = int(random(0,100));
  gaction = int(random(0,100));
  baction = int(random(0,100));

  
  //Increase or Decrase X axis
  if(xaxis >= 0 && xaxis < width){
      xaxis++;
   //   println(xaxis);
    }
  else{
      xaxis = 0;
      if(yaxis < height && yaxis >= 0){
      yaxis++;
   //   println(yaxis);
      }
      else {
       yaxis = 0; 
      }
    }
 
 
   //Increase or Decrase R 
  if(raction > constanti){
    r = r - 1;
  }
  else{
    r = r + 1;
  }
  //Increase or decrase G
  if(gaction > constanti){
    g = g - 1;
  }
  else{
    g = g + 1;
  }
   //Increase or Decrase B
  if(baction > constanti){
    b = b - 1;
  }
  else{
    b = b + 1;
  }

  
stroke(r,g,b);
  strokeWeight(1);
  
  line(xaxis, yaxis, (width / 2), (height / 2));
}

void mousePressed(){
 noLoop(); 
}


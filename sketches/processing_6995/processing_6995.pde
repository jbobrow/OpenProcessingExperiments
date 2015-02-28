

//|||||||||||||||||||||||||||||||||||||\\
//||                                 ||\\
//||  Sunil vallu                    ||\\
//||  New Media Design               ||\\  
//||  National Institute Of Deaign   ||\\
//||                                 ||\\
//|||||||||||||||||||||||||||||||||||||\\
 
int[]xpos = new int[50];
int[]ypos = new int[50];

void setup(){
  size(1000,700);
  smooth();

  /// INIT
  for(int i =0; i<xpos.length; i++){
    xpos[i] = 0;
    ypos[i] = 0;
  }
}

void draw(){
  background(255);
  colorMode(HSB);
  
  /// SHIFT
  for(int i=0; i<xpos.length-1; i++){
    xpos[i]= xpos[i+1];
    ypos[i]= ypos[i+1];
  }
  
  /// NEW LOC
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  
  // DRAW
  for(int i=1; i<xpos.length; i++){
    strokeWeight(255-i*5);
    stroke(random(255-i,200),255-i*5,255-i*5);
    line(xpos[i],ypos[i],xpos[i-1],ypos[i-1]);
  }
}







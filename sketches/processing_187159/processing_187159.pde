
int amplitude, wavelength, linewidth;
int ax, sx;
float ay, by;

void setup(){
  background(0);
  stroke(255);
  smooth(2);
  size(640,360);
  
  frameRate(200);
   
  amplitude = (height-10)/2;
  wavelength = width/2;
  linewidth = 10;  
  
}

void draw(){
  
  amplitude = (mouseY-height/2);
  
  background(0);
  
  pushMatrix();
  
  //sx=width-(frameCount % width);
  sx=frameCount % width;
  translate(-sx,height/2);
  
  //translate(0,height/2);
   
  //draw sine
  ay=0;
  ax=0;
  by=0;
  
  for (int bx = frameCount % width; bx < (frameCount % width)+width; bx++) {    
   
   by=-sin(map(bx,0,wavelength,0,TWO_PI))*amplitude;
   
   if (bx % linewidth ==0){
     strokeWeight(1);
     stroke(128);
     line(ax,0,ax,by);
   }
        
   strokeWeight(4);
   stroke(255);   
   line(ax,ay,bx,by);
   

   ax=bx;
   ay=by;
  }
  

  popMatrix();

  
  
}



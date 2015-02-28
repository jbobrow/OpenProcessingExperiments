

int diam= 40;
int ballnumber = 50;
float [] xpos= new float[ballnumber];
float [] ypos= new float[ballnumber];
float [] xspeed= new float[ballnumber];
float [] yspeed= new float[ballnumber];
   
color[] colorOptions = new color[7];
 
int arrayLength = colorOptions.length;   
color lastItem;

void setup(){
  size (800,600);
  noStroke();
  frameRate (20);
 smooth();
  colorOptions[0] = #ce3933;
  colorOptions[1] = color(255,106,48);
  colorOptions[2] = color(255,231,160);
  colorOptions[3] = color(138,198,141);
  colorOptions[4] = color(0,139,153);
  colorOptions[5] = color(0,103,207);
  colorOptions[6] = #6138cf;
  lastItem = colorOptions[colorOptions.length-1];
    
  for(int i=0; i<50; i++) {
    xpos[i]= random(diam, width-diam);
    ypos[i]=random(diam, height-diam);
    xspeed[i]=random(2, 4);
    yspeed[i]=random(2, 4);
  }
}

void draw(){
  background(0);
 
//setup ball bounce
  for(int i=0; i<ballnumber; i++){
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
      //to bounce
      if(xpos[i] < diam/2 || xpos[i] > width-diam/2){
       xspeed[i]*=-1;
      }
      if(ypos[i] < diam/2 || ypos[i] > height-diam/2){
      yspeed[i]*=-1;
      }
  }
    for(int i=0; i<ballnumber; i++){
       fill(colorOptions[i%arrayLength]);
       ellipse(xpos[i], ypos[i], diam,diam);
    }
}
 
  
  
  
  
  
  


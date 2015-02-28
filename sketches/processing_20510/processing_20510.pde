
PImage myPic;
int num = 10;
float mySize = 50;
float[] ypos = new float[num];
float[] speed = new float[num];
color[] myColors = new color[4];
int[] col = new int[num]; 


void setup(){
  size(300,300);
  myPic = loadImage("jellyfish.JPG");
 for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-3,3);
    col[i] = floor(random(0,4));
  }
  noStroke();
  smooth();

  background  (230);
}

void draw(){

 
  
  int y = floor(random(0,myPic.width));    
  int x = floor(random(0,myPic.height));   
  
  
  
  for(int i=0; i<num-1; i++) {
    
    fill(myColors[col[i]]);
   
    ellipse(width/num * i + width/num, ypos[i], random(10,100), -ypos[i]);
    
    ypos[i] = ypos[i] + speed[i];}
    

  color myColor = myPic.get(x,y);      
  fill(myColor);
  ellipse(random(0,height),random (0,width),random (1,50),50); 

}


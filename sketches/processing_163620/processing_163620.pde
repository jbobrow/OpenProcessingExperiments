
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}



class Sonar {
float x;
float y;
float h;
float w;
float cl;
float strk;
float size;
float originalSize;
  
  
Sonar(float tempX, float tempY, float tempS, float tempC){
x =tempX ;
y= tempY;
h= 10;
w= 10;
strk=255;
cl=tempC;
size = tempS;
originalSize= 1;

  
  
}  
  
  
  
  
void display(){
  fill(cl);
  ellipse(x,y,h,w);
  h++;
  w++;
  
 
 
  if(h>size || w>size){
   h=originalSize;
   w=originalSize;
   stroke(strk);
   strokeWeight(10);
  
    }
  
  fill(255);
}  
  

  
  
  
}

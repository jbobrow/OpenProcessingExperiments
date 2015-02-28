
class Walker{
PVector pos = new PVector(0,0);
PVector velocity = new PVector(0,0);
float x;
float y;
float R;
float G;
float B;
float noiseCoor;
    
    Walker(float newx, float newy,float newR, float newG, float newB, float offset){
      //x = newx;
      //y = newy;
      
      pos.x = newx;
      pos.y = newy;
      
      R = newR;
      G = newG;
      B = newB;
      noiseCoor += offset;
      
    }
    
    void display(){
    float r = random(1)*globalRadius;
    //noStroke();
    stroke(R,G,B,constrain(100-r*10,0,100));
    //stroke(R,G,B,constrain(R,100,100));
    //fill(R,G,B,constrain(r,100,100));
    noFill();
    ellipse(pos.x,pos.y,r,r);
    //ellipse(pos.x,pos.y,globalRadius,globalRadius);
    
    }
    
     
    /* 
    void step() {
      int choice = int(random(4));
      
      switch (choice) {
          case 0: pos.x++; break;
          case 1: pos.x--; break;
          case 2: pos.y++; break;
          case 3: pos.y--; break;
          default: break;
          }
     }
     */
     
     void step() {
          float angle = noise(noiseCoor)*360;
          velocity = fromAngle(angle);
          velocity.mult(noise(noiseCoor)*5);
          pos.add(velocity);    
          noiseCoor +=1;
      }
      
      
      
}
Walker[] w = new Walker[350];

float globalRadius = 0;
float globalNoisePos = 0;
float sizeRange = 0;
int MAXRANGE=50;



void setup(){
  size(700,500);
 for(int i =0;i<w.length;i++){
  int greyscale = int(random(255));
  w[i] = new Walker(random(width),random(height), greyscale,greyscale,greyscale, random(75));
 }
  background(0);
  

}
void draw(){
  
  if (second()%5<2.5) {
          sizeRange=((second()%5)+1)*MAXRANGE;
      }  else {
          sizeRange=(5-second()%5)*MAXRANGE;
  }
  
  globalNoisePos+=0.01;
  globalRadius = noise(globalNoisePos)*sizeRange;
  
  for(int i =0;i<w.length;i++){
  w[i].step();
  w[i].display();
  }
}

void keyPressed() {
 if(key=='s'){ 
    saveImage();}

    if(key=='b') {
    filter(BLUR);
    }  
    
    if (key=='c') {
    background(0);
    }
    
        
}
void saveImage() {
  String fileName = timeStamp()+".png";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}

String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}

public PVector fromAngle(float angle) {
    float x = cos(angle);
    float y = sin(angle);
    return new PVector(x,y);
    }

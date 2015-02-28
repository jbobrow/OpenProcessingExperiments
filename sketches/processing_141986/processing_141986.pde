

  int counter=0;
  int maxCounter=40;
  float strokeAlpha=255;
  int webCounter=0;
  int webX = 0; 
  int webY = 0;



void setup(){

size(900,600);
background(0);
stroke(255);
strokeWeight(2);
fill(0,255,0);
webX=width/2;
webY=height/2;

}



void draw(){

  int centerline=300;
  
  if(counter<maxCounter){

  int x = (int)random(centerline)+webX-centerline/2;  
  int y = (int)random(centerline)+webY-centerline/2;  
  strokeAlpha=255;
  stroke(255);  
  line(webX, webY, x, y);
  randomLine(x,y,x-webX,y-webY);
  counter++;
    if(counter==maxCounter){
    
    webX = (int)random(width);
    webY = (int)random(height);
    counter = 0;
    
    webCounter++;
      if(webCounter > 100){
      noLoop();
      }
    background(0);  
    }
  }
}



void randomLine(int x1, int y1, int x2, int y2){
  
  strokeAlpha = strokeAlpha*0.8;
  stroke(strokeAlpha,255,strokeAlpha,255);
  int newX = x1+(int)random(x2);
  int newY = y1+(int)random(y2);
  
  line(x1,y1,newX,newY);
  if(strokeAlpha>3){
  randomLine(newX,newY,newX-x1,newY-y1);
  }else{
    ellipse(newX,newY,5,5);  
  }


}

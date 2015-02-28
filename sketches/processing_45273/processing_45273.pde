
float sX,sY,hX,hY,r;
int mili,seconds,minutes,hours,angle,i;

void setup(){
  size(800,800);
 // smooth();
  background(255);
  //textMode(SCREEN);
}

void draw(){
  //background(0);
  smooth();
  fill(255,255,255,10);
  rect(0,0,800,800);
  mili = millis();
  seconds = mili/1000;
  angle = 0;
  r = random(800);
  stroke(0);
  //textMode(CENTER);
  
  if(seconds % 10 == 0){
  line(sX,sY,hX,hY);
        //text("10" + int(seconds),400,400);
      }
  
  if(seconds % 60 == 0){
    for(int x = 0; x < 800; x=x+10){
      for(int y = 0; y < 800; y= y+10){
        rect(x,y,100,100);
      }
    }
  }
      
  
  sX = cos(radians(mili)) * 300 + width/2;
  sY = sin(radians(mili)) * 300 + height/2;
  fill(0);
  ellipse(sX,sY,20,20); 
  
  hX = cos(radians(seconds*6)) * 275 + width/2;
  hY = sin(radians(seconds*6)) * 275 + height/2;
  strokeWeight(.5);
  stroke(255,0,0);
  line(400,400,hX,hY);
  


}


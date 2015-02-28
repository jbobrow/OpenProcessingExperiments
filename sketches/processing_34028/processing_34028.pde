
int time=0;
int timeback =2000;
int timego=2000;
Boolean circlerun = false;
int lastsavedtime;
int drawcircle;
int velx=0;


void setup(){
size(500,500);
lastsavedtime = millis();

}


void draw() {
   
  drawcircle(300,height/2,20,color(255,0,119));
  
}

void drawcircle(int circx, int circy, int circdia, color c){
 
  fill(c);
  circx+=velx;
  ellipseMode(CENTER);
  ellipse(circx,circy,circdia,circdia);


  if (circlerun ==true){
      velx++;
      if(timego<millis()-lastsavedtime){
         circlerun= false;
        lastsavedtime= millis();
      
    }
  }
  else{
   velx--;
  if(timeback<millis()-lastsavedtime){
  circlerun=true;
  lastsavedtime= millis();
 
  
  }
  }



}


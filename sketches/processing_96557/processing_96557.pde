
int lastTimeChanged = -1200;
int changeInterval = 1200;
void setup (){
  size(400, 400);
}

void draw(){
  //change the background 3 seconds 
  //after the kast time we change the background
  //add lastTimechanged to changeInterval
  //if the current time is bigger than lTC +  cI
  //change background
  if(millis() > lastTimeChanged + changeInterval){
  //change background
  background(random(255), random(255), random(255));
  //remember what time that was
  lastTimeChanged = millis();
  }
}

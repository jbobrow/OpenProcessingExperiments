
int storedTime;

int runningTime;
int runningTime1;
int runningTime2;

int diffInTime;
int diffInTime1;
int diffInTime2;

int s = second();
int m = minute();

void setup(){
  size(700,700);
  smooth();
  fill(0,0,0);
  storedTime= 0;

}

void draw(){
  background(255,255,255);
  
    //LineGrid
  for (int i=1; i<700; i+=5){
  for (int j=1; j<700; j+=1){
  stroke(0);
  line(i,j,i,j);
  
  //Establishing Values
  runningTime = millis ();
  runningTime1 = s;
  runningTime2 = m;
  
  diffInTime = runningTime - storedTime;
  diffInTime1 = runningTime1 - storedTime;
  diffInTime2 = runningTime2 - storedTime;

  //Millis
  float rectMappedPos = map (diffInTime, 0,5000,-50,width);
  fill(255,0,0);
  rect(0,rectMappedPos,700,5);
  
  if (diffInTime >5000){
    storedTime = runningTime;
  
  //Seconds  
  float rectMappedPos1 = map (diffInTime1, 0,10,-15,height);
  fill(255,255,255);
  rect(1,rectMappedPos1,700,2);
  
  if (diffInTime1 >500){
    storedTime = runningTime1;
    
  //Minutes  
  float rectMappedPos2 = map (diffInTime2, 0,1,5,-2);
  fill(255,255,255);
  rect(2,rectMappedPos2,700,50);
  
  if (diffInTime2 >50){
    storedTime = runningTime2;

    }
    }
    }
    }
    }
}





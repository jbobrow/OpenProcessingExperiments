

int startTime;
int currentTime;
int intervalTime;

//define an integer counter here
int counter;

boolean isDrawingCircles;

void setup(){
//setup
  background(255);
  size(500,500);
  noFill();
  //frameRate(20);

//counter
startTime=millis();
//intervalTime=1000;

//initialize integer counter
counter=0;

isDrawingCircles=true;
}


void draw(){
  background(0);

   
//counter
currentTime=millis();
if(currentTime-startTime>=intervalTime){

  //use fuction drawCircles() and pass it the counter
  if(isDrawingCircles==true){
    drawCircles();
  }
  
  if(isDrawingCircles==false){
    drawRect();
  }
  
  if(counter*10>=500){
    isDrawingCircles=false;
  }
  
  if(counter*10<=0){
    isDrawingCircles=true;
  }
  
  startTime=millis();
}
}
//if the counter equals the max number of circles:
//set the counter back to zero 
//flip boolean

//test to see if boolean (eg isBlack) is now false
//if so, paint the background white

void drawCircles(){
  counter++;
  fill(255);
  stroke(0);
  ellipse(250,250,counter*10, counter*10);
  fill(0);
  ellipse(250,250, (counter-1)*10, (counter-1)*10);
}

void drawRect(){
  counter--;
  rectMode(CENTER);
  fill(255);
  rect(250,250,counter*10, counter*10);
  fill(0);
  rect(250,250, (counter-1)*10, (counter-1)*10);
}



  


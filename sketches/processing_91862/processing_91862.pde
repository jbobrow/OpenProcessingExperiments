
int startseconds;
int timeelapsed;
int startminutes;
int minuteslapsed;
int starthours;
int hourselapsed;
int sec;
int minutes;
int hours;
int minuteRadiusA;
 PFont HelveticaNeue;
int runningTime;
int storedTime;
int differenceInTime;
int march;
void setup() {
size(600,600);

 background(100,150,50);
}



void draw(){
 hourselapsed=millis()-starthours; //HOURS
  // after 60 minute, an hour circle will take over
  if(hourselapsed>60000*60){
    starthours=millis();
    minuteslapsed=0;
  }
    float hourseRadius= map(hourselapsed,0,60000*60,0,500);//  hour set to 60 min
       fill(205,205,255,5);
   smooth();
    strokeWeight(2);
    ellipse(300,300,hourseRadius,hourseRadius);
    
    fill(235,250,255,2);
    ellipse(300,300,525-minuteslapsed,525-minuteslapsed);// seconds ripple through the radius of the hour
    
      loadFont("HelveticaNeue-Medium-42.vlw");
  fill(100,250);

 stroke(2);
 textSize(72);
 fill(255,255,255,20);
storedTime=0;
runningTime=millis();
text(runningTime-storedTime,300,400);
text(2013,200,595);

if(differenceInTime>5000){
}

   // SECONDS
  //create time set starting with seconds at 0-1000== 1 second, 60,000==1 min
timeelapsed= millis()-startseconds; // time passed is set to 1000- (start seconds=1000)
if (timeelapsed>1000){ // if time passed is greaert than 1000
  startseconds=millis(); // then start time is at 1000
  timeelapsed=0; // the time that has ellapsed is 0
}
  //println(timeelapsed);
  fill(230,20,25, 150); //SECONDS
  float secondsRadius = map(timeelapsed, 0, 1000, 0, 60);// 0,0, 1 mill, 60 height
  stroke(250,250,250);
  ellipse(width/2, height/2, secondsRadius, secondsRadius);// w/2,h/2,0-200

  
  
  //  MINUTES to ==millis*60-start time
 minuteslapsed= millis()-startminutes;// mimutes passed is set to 1000 (1000)- 1000sec==0
 if (minuteslapsed>60000){// o minute passed > than 60 sec
   startminutes=millis();//  minutes 1000 || 1*60000 sec
   minuteslapsed=0;// minutes passed = 0
  }
    
  
 smooth();// MINUTE'S SHAPES
  float minutesRadius = map(minuteslapsed,0,60000,0,600);
  fill (0,0,200,50);
  ellipse(300,300,minutesRadius,minutesRadius);// center// middle ellipse per 0-60
 
              fill(250,00,90,20);
              ellipse( 300,00,minutesRadius,minutesRadius);// top dark BLUE ''
       
             fill(150,100,200,20);
             ellipse(300,300, minutesRadius,minutesRadius);// middle  BLUE ''
    
              fill(120,250,255,20);
            ellipse( 300,600,minutesRadius,minutesRadius);// bottom pINK ''

 hourselapsed=millis()-starthours; //hours
  // after 60 minute, an hour circle will take over
  if(hourselapsed>60000*60){
    starthours=millis();
    minuteslapsed=0;
  }
  

   
}

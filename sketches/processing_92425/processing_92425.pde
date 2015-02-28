
import java.util.Calendar;
Calendar calendar ;

String[] months = {"January", "February",
  "March", "April", "May", "June", "July",
  "August", "September", "October", "November",
  "December"};

String myTime ; 
String myMin ;
String myHour ;
String mySec ;
String myDate ;

PImage gradiant ;
PImage gradiant1 ;
PImage gradiant2 ;
PImage gradiant3 ;
PImage gradiant4 ;
PImage gradiant5 ;
PImage gradiant6 ;

int myState = 0 ;


void setup() {
  
  size(250, 250) ;
  
  gradiant = loadImage("gradback.jpg") ;
  gradiant1 = loadImage("gradiant01.jpg") ;
  gradiant2 = loadImage("gradiant02.jpg") ;
  gradiant3 = loadImage("gradiant03.jpg") ;
  gradiant4 = loadImage("gradiant04.jpg") ;
  gradiant5 = loadImage("gradiant05.jpg") ;
  gradiant6 = loadImage("gradiant06.jpg") ;
  
   calendar = Calendar.getInstance();
     //   calendar.set(Calendar.YEAR, year());
     //   calendar.set(Calendar.DAY_OF_YEAR, day());
        
          // See the full information of the calendar object.
        System.out.println(calendar.getTime().toString());
         
        // Get the weekday and print it
        int weekday = calendar.get(Calendar.DAY_OF_WEEK);
        println("Weekday: " + weekday);
  
}

void draw() {
  background(0) ;

  textAlign(CENTER, CENTER) ;
  textSize(48) ;
  
  switch(myState) {
    
    case 0:
    image(gradiant, 0, 0) ;
    break ;
    
    case 1:
    image(gradiant1, 0, 0) ;
    break;
    
    case 2:
    image(gradiant2, 0, 0) ;
    break ;
    
    case 3:
    image(gradiant3, 0, 0) ;
    break ;
    
    case 4:
    image(gradiant4, 0, 0) ;
    break ;
    
    case 5:
    image(gradiant5, 0, 0) ;
    break ;
    
    case 6:
    image(gradiant6, 0, 0) ;
    break ;
    
  }
    

  
  //MONTH
  String myMonth = months[calendar.get(Calendar.MONTH)] ;
  text(myMonth, width/2, 50) ; 
  
  //NUMBER DAY 
  text(calendar.get(Calendar.DATE), width/2, height/2) ;
  
  //Running Clock
  printAClock() ;
  text(myTime, width/2, 200) ; // this will print the clock

}

void printAClock() {
  
    if (second() < 10) {    
    mySec = ":0" + second() ; 
  } else {
    mySec = ":" + String.valueOf(second()) ;
  }  
   
  if (minute() < 10) {    
    myMin = ":0" + minute() ;     
  } else {
    myMin =  ":"+ String.valueOf(minute()) ; 
  }    
  
   if (hour() > 12) {    
    myHour = String.valueOf(hour() - 12) ;      
  } else {   
    myHour = String.valueOf(hour());
  }  
  
  if (hour() == 0) {
    myHour = "12" ;
  }
  
  myTime = myHour+myMin+mySec ;
  
}

void mousePressed() {
  myState = myState + 1 ;
  if (myState > 6) {
    myState = 0 ;
  }
}



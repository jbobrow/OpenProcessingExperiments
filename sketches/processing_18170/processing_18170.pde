
Clock clock;
PFont font;

float h;
float s;
float b;

int cFontSize;

void setup(){
  size(540,100);
  smooth();

  clock = new Clock();
  font = loadFont("Helvetica-48.vlw");
  
  cFontSize = 0;
}


void update(){
  clock.update();
  
  if(cFontSize < 48)
    cFontSize++;
}

void draw(){
  
  this.update();
colorMode(RGB,255);
background(255,255,255);
   colorMode(HSB,255);
  background(h,s,b);
  clock.draw();
/*  
  textFont(font,cFontSize);
  text(":",width/3,height/2 - 4);
  text(":",width/3*2,height/2 - 4);
*/
}

public class Clock{

  TimeCircle seconds;
  TimeCircle minutes;
  TimeCircle hours;
 
  Clock(){
    hours = new TimeCircle("hour");
    minutes = new TimeCircle("minute");
    seconds = new TimeCircle("second");
  }
  
  void update()
  {
    hours.update();
    minutes.update();
    seconds.update();
  }

  void draw()
  {
    hours.draw();
    minutes.draw();
    seconds.draw();
  }

}
class Time{

  float destX;
  float destY;
  float x;
  float y;
  String name;

  float fontSize;// = 8;
  float destFontSize;// = 8;
  
  int timeNum;
    
  Time(int timeNum){
    this.timeNum = timeNum;
    x = width/2;
    y = height/2;
  }
  
  void update(){
    
    x = ( x + ( destX - x)/8.);
    y = ( y + ( destY - y)/8.);
    fontSize = int(fontSize + (destFontSize - fontSize)/5.) ;
  }
  
  void draw(){
/*
    textFont(font,fontSize);
    fill(#000000);
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    text(timeNum,x,y);
*/
    //colorMode(HSB, 255);
    noStroke();
    if(name == "hour")
    {
      h = 255/24. * timeNum;
      fill(#000000,h);
    }
    else if(name == "second")
    {
      s = 255/60. * timeNum;
      fill(#000000,s);
    }
    else  
    {
      b = 255/60. * timeNum;
      fill(#000000,b);
    }
    
    ellipse(x,y,fontSize,fontSize);
  }
}
class TimeCircle {

  String name;
  Time[] times;
  int timeCount;
  int nowTimeNum;
  int hankei = int(height/5. * 2);

  //Circleの中心
  int x;
  int y;

  TimeCircle(String timeName) {

    if(timeName == "hour")
    {
      timeCount = 24;

      x = int(width/5. * 1);
    }
    else if(timeName == "minute")
    {
      timeCount = 60;
      x = int(width/2.);
    }
    else if(timeName == "second")
    {
      timeCount = 60;
      x = int(width/5. * 4);
    }

    times = new Time[timeCount];
    y = height/2;

    for(int i = 0 ; i < timeCount ; i++)
    {
      times[i] = new Time(i);
      //初期位置
      times[i].destX = x + (hankei / 2  * cos(2*PI / float(timeCount) * i));
      times[i].destY = y + (hankei * sin(2*PI / float(timeCount) * i));
      times[i].destFontSize = 8;
      times[i].fontSize = 8;
      times[i].name = timeName;
    }

    name = timeName;
  }

  void update() {

    if(name == "hour")
    {
      nowTimeNum = hour();
    }
    else if(name == "minute")
    {
      nowTimeNum = minute();
    }
    else if(name == "second")
    {
      nowTimeNum = second();
    }

    //fontSizeの調整
    for(int i = 0 ; i < timeCount ; i++)
    {
      //位置の修正
      times[i].destX = x + (hankei / 2  * cos(2*PI / float(timeCount) * i - 2*PI / float(timeCount) * nowTimeNum));
      times[i].destY = y + (hankei * sin(2*PI / float(timeCount) * i - 2*PI / float(timeCount) * nowTimeNum));
      
      int tmp;

      if(i-1 >= 0)
        tmp = i-1;
      else
        tmp = timeCount-1;
        
      times[tmp].destFontSize = 8 * (cos(2*PI / float(timeCount) * i - 2*PI / float(timeCount) * nowTimeNum) + 1);  

      if(nowTimeNum == i)
      {
        times[i].destX = x;
        times[i].destY = y;
        times[i].destFontSize = 48;
      }


      times[i].update();
    }
  }

  void draw() {

    for(int i = 0 ; i < timeCount ; i++)
    {
      times[i].draw();
    }
  }
}

                
                

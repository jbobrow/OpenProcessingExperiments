
PFont f;
String message = "female (work)  -  female (% with degree)";
String message2 = "male (work)    -    male (% with degree)";
String message3 = "1960s";
String message4 = "1970s";
String message5 = "1980s";
String message6 = "1990s";
String message7 = "2000s";
String message8 = "2010s";
Worker workers[] = new Worker[4];
int timer;

void setup() {
  size(270, 730);
  f = createFont("Arial",15,true);
  
  workers[0] = new Worker(50, height/2, 2.3, 3.3, 4.1, 4.3, 1.4); ///female worker  ///numbers in 10 millions ex)4.1 = 41million
  
  workers[1] = new Worker(width-50, height/2, -4, -5, -5.5, -6, -2.7);///male college student /// the number 1= 5% of all men with a bachelors degree
  
  workers[2] = new Worker(width-100, height/2, 2.8, 3.8, 4.5, 6, 1.6);///female college student
  
  workers[3] = new Worker(width-150, height/2, -4.2, -5, -6, -5.6, -3.6);///male  worker
  timer = 0;
}

void draw() {
  background(255);
  
  fill(0);
  textFont(f);
  text(message,10, height/6.15);
  text(message2, 10, height/1.15);
  
  
  
  
  line(0,height/2,width,height/2);
  timer++;
  if (timer % 100 == 0) {
    for (int i=0;i<workers.length;i++) {
      workers[i].changeAmount();
    }
  }
  for (int j=0;j<workers.length;j++) {
    workers[j].display();
  }
}

class Worker {
  int x;
  int y;
  float amount[] = new float[5];
  int currentIndex = 0;

  Worker(int _x, int _y, float _0, float _1, float _2, float _3, float _4) {
    x = _x;
    y = _y;
    amount[0] = _0;
    amount[1] = _1;
    amount[2] = _2;
    amount[3] = _3;
    amount[4] = _4;

  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { 
      currentIndex = 0;
    
  }}
  void display() {
    
    
    float tall = int(amount[currentIndex]* 40);  
    color fillColor = color(400,70,740); 
    if(tall < 0){fillColor = color(35,35,255);}  
    fill(fillColor);
    
    
  int i= 0;///try to make into a loop---really repetitive and inefficient
  
    if( timer <= i ){text(message3= message4, 10, height/2);
  }
    else if(timer <= i +100) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 200) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +300) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +400) {text (message3= message8, 10, height/2);
  }
  else if(timer <= i + 500) { text(message3= message4, 10, height/2);
  }
    else if(timer <= i +600) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 700) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +800) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +900) {text (message3= message8, 10, height/2);
  }
     else if( timer <= i +1000 ){text(message3 = message4, 10, height/2);
  }
    else if(timer <= i +1100) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 1200) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +1300) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +1400) {text (message3= message8, 10, height/2);
  }
      else if( timer <= i +1500 ){text(message3= message4, 10, height/2);
  }
    else if(timer <= i +1600) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 1700) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +1800) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +1900) {text (message3= message8, 10, height/2);
  }
    else if( timer <= i +2000 ){text(message3= message4, 10, height/2);
  }
    else if(timer <= i +2100) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 2200) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +2300) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +2400) {text (message3= message8, 10, height/2);
  }
  else if(timer <= i + 2500) { text(message3= message4, 10, height/2);
  }
    else if(timer <= i +2600) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 2700) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +2800) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +2900) {text (message3= message8, 10, height/2);
  }
     else if( timer <= i +3000 ){text(message3 = message4, 10, height/2);
  }
    else if(timer <= i +3100) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 3200) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +3300) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +3400) {text (message3= message8, 10, height/2);
  }
      else if( timer <= i +3500 ){text(message3= message4, 10, height/2);
  }
    else if(timer <= i +3600) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 3700) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +3800) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +3900) {text (message3= message8, 10, height/2);
  }
     else if( timer <= i +4000){text(message3= message4, 10, height/2);
  }
    else if(timer <= i +4100) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 4200) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +4300) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +4400) {text (message3= message8, 10, height/2);
  }
  else if(timer <= i + 4500) { text(message3= message4, 10, height/2);
  }
    else if(timer <= i +4600) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 4700) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +4800) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +4900) {text (message3= message8, 10, height/2);
  }
     else if( timer <= i +5000 ){text(message3 = message4, 10, height/2);
  }
    else if(timer <= i +5100) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 5200) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +5300) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +5400) {text (message3= message8, 10, height/2);
  }
      else if( timer <= i +5500 ){text(message3= message4, 10, height/2);
  }
    else if(timer <= i +5600) {text(message3 = message5, 10, height/2);
  }
    else if(timer <= i+ 5700) {text (message3 = message6, 10, height/2);
  }
    else if (timer <=i +5800) {text (message3 = message7, 10 ,height/2);
  }
   else if(timer <= i +5900) {text (message3= message8, 10, height/2);
  }
    rect(x-15, y-tall, 30, tall);
  }
}



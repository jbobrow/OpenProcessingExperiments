
/* @pjs font="Fenix-Regular.ttf"; */

int time = 1;

int x;
int y;

float secondsR;
float minutesR;
float hoursR;
float diameter;
//code from http://processing.org/learning/basics/clock.html--I used their code to help make the clock but added my own states to it

PFont mytext;
PFont number;

void setup() {
  size(600, 500);

  int radius = min(width, height) / 2;
  secondsR = radius * 0.72;
  minutesR = radius * 0.60;
  hoursR = radius * 0.50;
  diameter = radius * 1.8;

  frameRate(3);

  x = width/2;
  y = height/2;

  mytext = createFont("Fenix-Regular.ttf", 200);
  textFont(mytext,40);
  
  /*number = createFont("Fenix-Regular.ttf", 200);
  textFont(number,random(50, 100));*/
}



void draw() {
  background(100);
  println(hour() + ":" + minute() + ":" + second());

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  //clock hands
  /*ellipse(300, 250, 10, 10);
  fill(0);
  strokeWeight(2);
  line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
  strokeWeight(4);
  line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
  strokeWeight(6);
  line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);*/


  switch(hour()) {
    case 1:
    case 13:
    background(#00B9AC);
    //clock
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    //text
    // println(mouseX +mouseY);
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The mouse ran up the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("ONE,", 320,  220);
    textSize(50);
    fill(255);
    text("The mouse ran down," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 2:
    case 14:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The bird looked at the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("TWO,", 320,  220);
    fill(255);
    textSize(50);
    text("Away she flew," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    
    case 3:
    case 15:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The dog barked at the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("THREE,", 320,  220);
    fill(255);
    textSize(50);
    text("Fiddle-de-dee," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    
    case 4:
    case 16:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The bear slept by the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("FOUR,", 320,  220);
    fill(255);
    textSize(50);
    text("He ran out the door," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 5:
    case 17:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The bee buzzed 'round the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("FIVE,", 320,  220);
    fill(255);
    textSize(50);
    text("She went to her hive," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 6:
    case 18:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The hen pecked at the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255)); 
    textSize(random(60,90));  
    text("SIX,", 320,  220);
    fill(255);
    textSize(50);
    text("Oh, fiddle-sticks," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    
    case 7:
    case 19:
    background(#00B9AC);
    
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The cat ran 'round the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("SEVEN,", 320,  220);
    fill(255);
    textSize(50);
    text("She went to get'em," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    
    case 8:
    case 20:
    background(#00B9AC); 
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The horse jumped over the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255)); 
    textSize(random(60,90));  
    text("EIGHT,", 320,  220);
    fill(255);
    textSize(50);
    text("He ate some cake," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    
    case 9:
    case 21:
    background(#00B9AC);
    
    //clock
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    //text
    fill(255);
    strokeWeight(2);
    textSize(60);
   // textAlign(CENTER,CENTER);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The cow danced on the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    fill(random(255));   
    textSize(random(60,90));
    text("NINE,", 320,  220);
    fill(255);
    textSize(50);
    text("She felt so fine," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 10:
    case 22:
    background(#00B9AC);
    
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The pig oinked at the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    textSize(random(60,90));
    fill(random(255));   
    text("TEN,", 320,  220);
    fill(255);
    textSize(50);
    text("She did it again," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 11:
    case 23:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The duck quacked at the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    textSize(random(60,90));
    fill(random(255));   
    text("ELEVEN,", 320,  220);
    textSize(50);
    fill(255);
    text("The duck said 'Oh Heavens!'," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 12:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    fill(255);
    textSize(60);
    text("Hickory Dickory Dock," ,20,50);
    textSize(40);
    text("The mouse ran up the clock," ,20, 130);
    text("The clock struck" ,20, 220);
    textSize(random(60,90));
    fill(random(255));   
    text("NOON,", 320,  220);
    fill(255);
    textSize(50);
    text("He's here too soon!," ,20, 300);
    textSize(60);
    text("Hickory Dickory Dock." ,20, 390);
    break;
    
    
    case 0:
    background(#00B9AC);
    
    ellipse(300, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
  }
  
  
}





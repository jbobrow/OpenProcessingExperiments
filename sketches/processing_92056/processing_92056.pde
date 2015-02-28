
int time = 1;

int x;
int y;

float secondsR;
float minutesR;
float hoursR;
float diameter;
//code from http://processing.org/learning/basics/clock.html--I used their code to help make the clock but added my own states to it

PFont text;


void setup() {
  size(600, 500);

  int radius = min(width, height) / 2;
  secondsR = radius * 0.72;
  minutesR = radius * 0.60;
  hoursR = radius * 0.50;
  diameter = radius * 1.8;

  x = width/2;
  y = height/2;

  text = loadFont("Serif-200.vlw");
  textFont(text,40);
}



void draw() {
  background(100);
  println(hour() + ":" + minute() + ":" + second());

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  //clock hands
 /* ellipse(250, 250, 10, 10);
  fill(0);
  strokeWeight(2);
  line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
  strokeWeight(4);
  line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
  strokeWeight(6);
  line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);*/


  switch(hour()) {
    case 1:
    background(#00B9AC);
    //clock
    ellipse(250, 250, 10, 10);
    fill(0);
    strokeWeight(2);
    line(x, y, x + cos(s) * secondsR, y + sin(s) *secondsR);
    strokeWeight(4);
    line(x, y, x + cos(m) * minutesR, y + sin(m) *minutesR);
    strokeWeight(6);
    line(x, y, x + cos(h) * hoursR, y + sin(h) * hoursR);
    
    //text
    text("Hickory Dickory Dock," ,20,50);
    text("The mouse ran up the clock," ,20, 100);
    text("The clock struck one," ,20, 150);
    text("The mouse ran down," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    case 2:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The bird looked at the clock," ,20, 100);
    text("The clock struck two," ,20, 150);
    text("Away she flew," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    
    case 3:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The dog barked at the clock," ,20, 100);
    text("The clock struck three," ,20, 150);
    text("Fiddle-de-dee," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    
    case 4:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The bear slept by the clock," ,20, 100);
    text("The clock struck four," ,20, 150);
    text("He ran out the door," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    case 5:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The bee buzzed 'round the clock," ,20, 100);
    text("The clock struck five," ,20, 150);
    text("She went to her hive," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    case 6:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The hen pecked at the clock," ,20, 100);
    text("The clock struck six," ,20, 150);
    text("Oh, fiddle-sticks," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    
    case 7:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The cat ran 'round the clock," ,20, 100);
    text("The clock struck seven," ,20, 150);
    text("She went to get'em," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    
    case 8:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The horse jumped over the clock," ,20, 100);
    text("The clock struck eight," ,20, 150);
    text("He ate some cake," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    
    case 9:
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
   // textAlign(CENTER,CENTER);
    text("Hickory Dickory Dock," ,20,50);
    text("The cow danced on the clock," ,20, 100);
    text("The clock struck nine," ,20, 150);
    text("She felt so fine," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    case 10:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The pig oinked at the clock," ,20, 100);
    text("The clock struck ten," ,20, 150);
    text("She did it again," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    case 11:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The duck quacked at the clock," ,20, 100);
    text("The clock struck eleven," ,20, 150);
    text("The duck said 'Oh Heavens!'," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
    
    case 12:
    background(#00B9AC);
    text("Hickory Dickory Dock," ,20,50);
    text("The mouse ran up the clock," ,20, 100);
    text("The clock struck noon," ,20, 150);
    text("He's here too soon!," ,20, 200);
    text("Hickory Dickory Dock." ,20, 250);
    break;
    
  }

}




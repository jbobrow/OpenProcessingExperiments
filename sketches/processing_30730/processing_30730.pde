
//GLOBALS
int alphavalue;
int starttime;
int delaytime = 9255;
int curtime;

float count_up;
float count_down;
float calc_alpha;

void setup(){
  size(400,180);
  background(0);

}

void draw()
{
  background(0); //clears background on redraw
  strokeWeight(10);
  stroke(120,alphavalue);
  fill(255,alphavalue);
  
  rectMode(CORNER); 
  rect(245,34,130,100);
  
  fill(255);
  textSize(14);
  text("start time: " + starttime, 15, 45); // start time (runtime when mouse was first clicked)
  text("delay time: " + delaytime, 15, 60); // delay time
  text("count: " + ceil(count_up), 15, 75); // count down of delay 
  text("count down: " + ceil(count_down), 15, 90); // count down of delay 
  text("current runtime: " + curtime, 15, 105); // current runtime in ms since sketch started   
  text("calculated alpha: " + calc_alpha, 15, 120); // transparency amount distributed over time 
  text("alpha: " + alphavalue, 15, 135); // actual alpha transparency

  if(mousePressed) {
  
    if (millis() - starttime < delaytime) {
      count_up = (millis() - starttime); // timer count since (mousePressed())   
      count_down = delaytime - count_up; // countdown since started (mousePressed())
      
         if (mouseButton == LEFT) {
          calc_alpha = 255 / (delaytime / count_up); // fade-in, calculate alpha value vs. duration 
          alphavalue = ceil(calc_alpha); // ceil rounds UP and returns the closest integer value
         }
         if (mouseButton == RIGHT) {
          calc_alpha = 255 / (delaytime / count_down); // fade-out, calculate alpha value vs. duration 
          alphavalue = floor(calc_alpha); // floor rounds DOWN and returns the closest integer value
         }

      curtime = millis(); //report the current runtime only while loop is running. visual readonly only. ignoreable.
      
      if (alphavalue == 0) { count_down = 0; count_up = delaytime;}   //some precision is lost from float to int, so i reset these 
      if (alphavalue == 255) {count_down = 0; count_up = delaytime; } //for visual readout purposes only. ignoreable.
      
    }
    
  }
  else {
    //alphavalue = 0;
  }
  
}

void mousePressed() {
    starttime = millis();  // mousePressed() is only called once per press, unlike in draw
                           // if starttime was set in draw's mousePressed event, it would never end
}

void mouseReleased() {
  redraw(); // start over
}



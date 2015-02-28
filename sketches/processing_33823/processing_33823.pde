
//with code from Ben Norskov

int timeOff = 2000;
int timeOn = 1000;
int lastTime;
boolean lightOn = true;

void setup() {
  smooth();
  size(400, 400);
  
  lastTime = millis();
  println(lastTime);
}
 
void draw() {
  background(100);
  //I'm drawing the bulb in the middle of the screen, but could draw it anywhere, cause of the handy function I wrote.
  drawBulb(int(width * .5), int(height * .5));
}
 
void drawBulb(int center_x, int center_y) {
  //draw bulb base first
  fill(0);
  rect(center_x - 25, center_y + 40, 50, 50);
   
   if(lightOn == true){
     //show yellow circle
     //draw a yellow circle
     fill(255, 255, 0);
     ellipse(center_x, center_y, 100, 100);
     
     if(timeOn < millis() - lastTime){
       lightOn = false;
       lastTime = millis();
       println("light switched off");
     }
   
   }else{
     fill(100);
     ellipse(center_x, center_y, 100, 100);
     
     if(timeOff < millis() - lastTime){
       lightOn = true;
       lastTime = millis();
       println("light switched on");
     }
   }
   
   
  
 
  
  // draw fillament
  noFill();
  beginShape();
  vertex(center_x - 10, center_y + 50);
  //this for loop is to draw the jagged part of the fillament
  //using for loops inside of begin and end shape is very powerful
  //and in this case saved me many lines of code
  for (int i = center_x - 20; i <= center_x + 20; i+=5) {
    //Put very simply it makes a jagged line 10 px high. -Ben
    vertex(i, center_x + 10 - i % 2 * 10);
  }
  vertex(center_x + 10, center_y + 50);
  endShape();
   
}

                
                

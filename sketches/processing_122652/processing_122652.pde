
  
int startTime; int counter; int maxTime;
boolean done;
  
void setup() { //setup function called initially, only once
  
size(250, 250); background(255);
  
//set background white // colorMode(HSB); //set colors to Hue, Saturation, Brightness mode
  
counter = 0; startTime= millis(); maxTime=random(1000,11); done=false; }
  
void draw() { //draw function loops
  
background(244);
  
if (counter-startTime < maxTime) {
  
counter=millis();
  
}
else{
done=true;
}
fill(244,3,3);
noStroke();
rect(20,100,map(counter-startTime,0,maxTime,0,200), 19 );
text(counter- startTime+" " + int(maxTime) +  " " + int ( map(counter-startTime,0,maxTime,0,200)), 20,160);
noFill();
stroke(0);
rect(20,100,200,19);
 } // func
  
void mousePressed () { if (done) { counter = 0; startTime= millis();
  
 maxTime=random(1000,11); done=false; } }
}

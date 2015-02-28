
int startingTime;
float TextFont;
boolean bOver = false;
boolean locked = false;
boolean paused = false;
boolean cOver = false;


void setup() {
	 size(500, 500);
	 
	startingTime = millis(); 
     }
		  
     void draw() {
	background(31,93,222);
	 
	 int seconds = (millis() - startingTime) / 1000;
	 int minutes = seconds / 60;
	 int hours = minutes/60;
	 seconds-=minutes * 60;
	 minutes-=hours * 60;
	 String sm = nf(minutes, 2); //minutes
	 String s2 = nf(seconds, 2); //seconds
	 fill(255);
	 stroke(0);
	 ellipse(200,115,100,50);
	 fill(112,170,162);
	 text(( sm) + ":" + (s2),185,130);
	 fill(255);
	
  if (mouseX > 150 && mouseX < 250 && 
	mouseY > 150 && mouseY < 200) {
    bOver = true;  
    if(!locked) { 
     
     

	} 
  } else {
    
    bOver = false;
    
  }
  if (mouseX > 150 && mouseX < 250 &&
	mouseY > 205 && mouseY < 265){
    cOver = true;
    if(!locked){
    }
	} else {
   
   cOver = false;
   
	}
  
  // Draw the box
  rect(150, 150, 100, 50);
  fill(0);
 text("Reset",184,180);
 
 
 fill(91,97,152);
 rect(150, 205, 100, 50);
 fill(0);
 text("Pause",184, 235);
 
}

void mousePressed() {
  if(bOver) { 
    locked = true;	   
    startingTime = millis();
    
  } else {
    locked = false;
    
    
  }
  if(cOver) {  
   paused = !paused;
   if(paused)
     noLoop();
   else
     loop();
     
   
  }
  } 



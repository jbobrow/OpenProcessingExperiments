
//Name:
//Date:
//Project : traffic light

void setup() {  //setup function called initially, only once
  
 size(250, 250);
}

void draw() {  //draw function loops 

fill(0,0,0); // black
rect(90,30,70,180);// box for traffic light

fill(255,0,0);//color Red
ellipse(125,60,50,50);//first light
}
fill(255,255,0); //color yellow

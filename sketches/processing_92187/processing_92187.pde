
PFont font;

 
void setup() {
  size(600, 600);
 
  textFont(createFont("Helvetica",60) );
 
 
  
  stroke(-162);
  stroke(-209);
  stroke(255);
  // origionally had colorMode(HSB, 360, 100, 100)
  //the origional colors were rainbow and I am looking for a 
  //range of black/white/grays
  
 
  background(255);//i can make this white by changing it to
  // 255 but i want to leave it this way untill i figure out how
  //to do the black/white/grats
  smooth();
 
  noLoop();
}
 
void draw(){
  for (int i = 0; i < 5;i++) {  
    fill(random(40)*10,50);
 
    textSize(random(15, 20));
    text("data", random(-50,width), random(height));
  }
  for (int i=0; i < 5;i++) {
    fill (random(40)*50,5);
    
    textSize(random(15,20));
    text("information", random(-50,width), random(height));
  }
  for (int i=0; i < 5; i++) {
    fill (random(40)*50,3);
    
    textSize(random(15,20));
    text("disorder", random(-50,width), random(height));
  }
  for (int i=0; i< 5;i++) {
   fill(random(40)*50,87);
  
  textSize(random(15,20));
  text("clutter", random(-50,width), random(height));
  } 
  for (int i=0; i< 1;i++) {
    fill(random(15)*87,170);
    
    textSize(random(15,20));
    text("Too Much", random(-50,width), random(height));
  }

}


void mousePressed() {  //would like to be able to hold down the mouse key
//and have it loop. i can add in loop() after mousePressed but this 
//only lets user click once and I would like the user to be able to click
//as many times as he or she wants, and only have it loop when they hold
//the key down. Hoping for effect of static on a screen.
redraw();
loop();
}
void mouseReleased() {
  noLoop ();
}






int currentFrame = 0;  
PImage[] frames = new PImage[24];  
int lastTime = 0;  
float r;
float g;
float b;




void setup()   {  
  size (800,500);

for (int x = 0; x<800; x = x + 5){
  for (int y = 0; y <500; y = y + 5) {
    point (x,y);
  }
}

   strokeWeight(5);  
  smooth();  
  
  
  for (int i = 0; i < frames.length; i++) {  
    frames[i] = get(); // Create a blank frame  
  }  
}  

void draw() {  
  int currentTime = millis();  
  if (currentTime > lastTime+30) {  
    nextFrame();  
    lastTime = currentTime;  
  }  
   if (mousePressed == true) {  
    strokeWeight(2);  
    r = random(0,255);
    g = random(0,255);
    b =random(0,255);
    fill(r,g,b);  
    ellipse(mouseX,mouseY,80,80);  
   }
   if ( pmouseX < 750){
    fill(0);  
    ellipse(pmouseX,15+pmouseY,10,10);  
    ellipse(30+pmouseX,15+pmouseY,10,10);  
  }  
}  

   void nextFrame()   {  
  frames[currentFrame] = get(); // Get the display window  
  currentFrame++; // Increment to next frame  
  if (currentFrame >= frames.length) {  
    currentFrame = 0;  
  }  
  image(frames[currentFrame], 0, 0);  
} 





PImage[] wave = new PImage[23]; 
int counter;  
int lastTime; // When the current image was first displayed  

void setup() 
{ 
  size(915, 500);  
  background(255);
  fill(0,0,0);
  rect(0, 250, 915, 1.5);
  for (int i = 0; i < wave.length; i++) 
  { 
    wave[i] = loadImage("img" + i + ".png");
  } 

  lastTime = millis();
}   

void draw() {
  tint(0, 0, 0, 20);
  image(wave[counter], 0, 0);
  float DISPLAY_TIME = 150;
  if (millis() - lastTime >= DISPLAY_TIME) 
  {  
    counter = ++counter % wave.length; 
    lastTime = millis();
  } 
  restart();
}

void restart() {
  int a = frameCount;
  if (a >= 130 ) { 
    setup();

    frameCount=0;
    //counter=0;
    tint(0, 0, 0, 5);
    image(wave[counter], 0, 0);
    float DISPLAY_TIME = 150;
    if (millis() - lastTime >= DISPLAY_TIME) 
    {  
      counter = ++counter % wave.length; 
      lastTime = millis();
    }
  }
}



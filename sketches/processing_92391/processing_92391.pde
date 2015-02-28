
PImage sodaCan;
PImage orangeJuice;
PImage milkCarton;
PImage coffee;
int currentTime;
int timeSet;
int timeDiff;

void setup(){
  size (300,320);
  sodaCan = loadImage("sodacan.jpg");
  orangeJuice = loadImage("orangejuice.jpg");
  milkCarton = loadImage("milkcarton.jpg");
  coffee = loadImage("coffee.jpg");
  timeSet = 0;
  
}

void draw(){
  background(255);
  currentTime = millis();
  timeDiff = currentTime-timeSet;
  println(currentTime/1000);
  if(timeDiff >= 0 && timeDiff <= 6000){
  image(coffee,0,0);
  } else if (timeDiff >= 6000 && timeDiff <= 12000){
    image (milkCarton,0,0);
  } else if (timeDiff >= 12000 && timeDiff <= 18000){
    image (orangeJuice,0,0);
  } else if (timeDiff >= 18000 && timeDiff <= 24000){
    image (sodaCan, 0,0);
    
    if (timeDiff > 24000){
      timeSet = currentTime;
    
}
}
}


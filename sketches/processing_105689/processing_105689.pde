
float yay;
boolean stopGo;

void setup () {
  size (400,400);
  colorMode(HSB,100,100,100,50);
  
  stopGo = false;
}

void draw (){
  if (stopGo==false){ 
  yay = random (50);
   background (random(255), random(255), random(255));
  ellipse (random(width), random(height), yay, yay);
  }
  else
  if (stopGo==true){
  }
}

void mousePressed(){
  stopGo = !stopGo;
}



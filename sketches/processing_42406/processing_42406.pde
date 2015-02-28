
PFont alice; String button; color black; color blueish;
void setup() {
  size(800,500); 
  alice = loadFont("Apple-Chancery-30_alice.vlw");
  button = "Welcome! Click the black button";
  black = color(0,0,0); blueish = color(9,109,214);
}

void draw() {
  background (255,255,255);
  textFont(alice, 20);
  fill(245,12,214); text(button, 250,250);
  fill(black);ellipse(60,60,80,80);fill(blueish);ellipse(700,400,80,80);
  
  if(dist(mouseX,mouseY, 60,60) < 40){ 
    black = color(13,214,11); //button = "No! That's a green button! You need the black button!";
  }else{black = color(0,0,0);} //button = "Ok! Now click the black button";}
  
  if(dist(mouseX,mouseY,700,400) < 40){
    blueish = color(255,255,0);
  }else{blueish = color(9,109,214);}
  
  if(dist(mouseX,mouseY,60,60) < 40 && mousePressed == true){
    button = "Great! Press the blue button";
  }
  
  if(dist(mouseX,mouseY,700,400) < 40 && mousePressed == true){
    button = "Awesome! Now click the black button";
  }
}


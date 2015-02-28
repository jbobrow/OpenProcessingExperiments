
float r;
PFont myFont;
float randomA = 30;

void setup() { //curly bracklet
  size(600, 600);
  smooth();
  frameRate(30);
  
  myFont = createFont("Ubuntu" , 24, true); //name, size, anti-aliasing
  textFont(myFont);
  
}

void circ(float PosX, float PosY, float SX, float SY) {
  fill(0);
  ellipse(PosX, PosY, SX, SY);
}

void draw() {
  noCursor();
  background(240);
  stroke(random(255), random(255), 0);
  line(mouseX, mouseY, pmouseX, pmouseY);
  
  float speed = dist(mouseX, mouseY, pmouseX, pmouseY);
  float r = speed/2;
  

  
  if(mousePressed == true) {

    
    strokeWeight(r);
    circ(pmouseX, pmouseY, r, r);
    circ(pmouseX, pmouseY/1.2, r, r);
    circ(pmouseX, pmouseY*1.2, r, r);
    circ(pmouseX/1.2, pmouseY, r, r);
    circ(pmouseX*1.2, pmouseY, r, r);
  
    randomA -= 0.5;
      
    for(int j = 20; j < 400; j += 40) 
  {  
        for(int k = 30; k < 600; k += 60) 
      {  
          for(int i = 0; i < 255; i += 40) 
    {
      ellipseMode(CENTER);
      noStroke();
      fill(random(int(5)), i , 255 - i);
      ellipse(0, k, (255-i)/randomA, (120+i)/randomA);
      ellipse(600, k, (255-i)/randomA, (120+i)/randomA);
      ellipse(k, 0, (255-i)/randomA, (600+i)/randomA);
      ellipse(k, 600, (255-i)/randomA, (600+i)/randomA);
    }
    }
  }

    if(randomA <= 5 || randomA >= 1000){
      randomA *= -2;
    }

  } else {
    background(240);
    fill(0);
    text("    HELP ME!", width/2 - 80, height/2);
  }
}




//Final Project

//This Project what I call it "The Time Tunnel", the background color will change randomly until the 'del/backspace' key is pressed. Additionally, the stroke color also allowed to changed in keys 1-4.<br>
//This project will goes to different levels of beauty between the color changing, with this simple polygon.


color strokeColor = color(HSB, 360, 100, 100);


void setup(){
  size(1280, 720);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  background(200);
  noFill();
  
}

void draw(){
  if(mousePressed){
    pushMatrix();
    translate(mouseX,mouseY);

    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    int radius = mouseX-width/2;
    float angle = map(mouseY, 20,height, 2,1);
    

    strokeWeight(1.5);
    stroke(strokeColor);

    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * 100;
      float y = 0 + sin(angle*i) * 100;
      vertex(x, y);
      
    }
    endShape();
    
    popMatrix();
  }
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(random(width), random(height), random(100));
  if (key=='s' || key=='S') saveFrame("screenshot.png");

  switch(key){
  case '1':
    strokeColor = color(0, 90);
    break;
  case '2':
    strokeColor = color(190, 100, 64, 100);
    break;
  case '3':
    strokeColor = color(360, 100, 100, 90);
    break;   
  case '4':
    strokeColor = color(127, 80, 99, 90);
    break;
  }
}



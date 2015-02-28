
Cloud[] clouds = new Cloud[10];
Bubble bubble;
String s = "Mash the SPACEBAR to keep the bubble in the air!";
int counter;

void setup(){
  size(600,300);
  colorMode(HSB, 100);
  background(55,30,100);
  counter = 0;
  bubble = new Bubble();
  
  for(int i = 0; i < clouds.length; i++){
    clouds[i] = new Cloud(random(0,width),random(0,height),i/2);
  }
}

void draw(){
  background(55,30,100);
  for(int n = 0; n < clouds.length; n++){ 
    clouds[n].display();
    clouds[n].move(); 
  }
  bubble.display();
  bubble.move();
  
  if(counter < 100) {
    fill(0);
    textAlign(CENTER);
    text(s, 200, 200, 200, 40);
  }
  
  counter++;
}

void keyPressed(){
  //background(55,30,100);
  bubble.y = bubble.y - 10;
  
}


    
class Bubble {
  float x;
  float y;
  float v;
  
  Bubble(){
    x = 200;
    y = 100;
    v = 1;
    
  }
  
  void display(){
    colorMode(HSB, 100);
    strokeWeight(0);
    smooth();
    ellipseMode(CORNER);
    fill(100, 0, 100, 35);              //outer circle
    ellipse(x +100, y +100, 50, 50);
    noStroke();
    fill(100, 0, 100, 55);              //inner glare
    quad(x +138, y +105, x +134, y +110, x +143, y +120, x +147, y +120);
  
  }
  
  void move(){
     y = y + v;
  }
  
}
  
class Cloud {
  float x;
  float y;
  float v;
  
  Cloud(float xpos, float ypos, float speed){
    x = xpos;
    y = ypos;
    v = speed;
  }
  
  void display(){  
    fill(0,0,100,100);
    stroke(0);
    smooth();
    //right side
    curve(x -40, y, x, y, x, y +10, x -40, y +10);
    //bottom fill
    noStroke();
    rect(x -100, y, 100, 10);
    //bottom line
    stroke(0);
    line(x, y +10, x -100, y +10);
    ellipseMode(CORNER);
    //left hump
    ellipse(x -120, y -20, 30, 30);
    //left side
    ellipse(x -100, y -50, 55, 55);
    //right hump
    bezier(x -5, y +5, x +10, y -30, x -40, y -50, x -60, y -10);
    //inside fill
    noStroke();
    rect(x -105, y -10, 80, 20);
  }
  
  void move(){
    x = x + v;
    if (x -100 > width){
      x = 0;
    }
    
  }
  
}




int timer = 0;
int eSize = 5; 
int speed = 5;
int x, y;  
int c;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  frameRate(30);
  smooth();
  fill(200,random(255),80,random(255));
  

}


 
void draw() {
  //background(255);
  rect(mouseX, mouseY, 20, 20);
  rect(x, height/2, eSize, eSize);  
  x = x + speed; 
  
    if(mousePressed == true){
    eSize += 2;
    rect(x,y, eSize,eSize);
}

  
  if(x > width || x < 0) {
    speed = -speed; 
    
      if(timer > 3*30 ){    
    fill(0, 80, 80);     
  }
  else{                 
    fill(0, random(255),random(255));    
  }
  ellipse(width/2, height/2, 100, 100); 
 
  if(mousePressed) {   
    println(timer/30);  
  }
  timer ++;
}
  }
  
  
  void keyPressed() {
  background(255);
  fill(255, 255, 255);
  text(key, width/2, height/2);
 
  switch(key) {
    case 'N':
      x += 5;
      println("N");
      break;
  }
  }
  
  
  
  void mouseMoved(){
  c += 1;
  if(c > width/2){
    c = 255;
  }
}


  

 




var laserSound = new Audio("http://thetoastisburning.site50.net/sounds/song.wav");



width = 500;
height = 500;
background(0);
float speed;
float lineWidth;
float dx = 0;
float dy = 0;
float normX = 0.0;
float normY = 0.0;
int r = 0;
int b = 100;
int g = 55;

d = 10;
chunk = 25;
 
int[] speedA = new int[100];



void setup() {  //setup function called initially, only once

doPixels();

colorMode(RGB, 100);
size(width, height); 
background(255,255,255);

   
}

void draw() {  //draw function loops 
 


   
 
  speed = dist(pmouseX, pmouseY, mouseX, mouseY); 
  speed = map(speed, -50, 50, 0, 10);
  dx = pmouseX-mouseX;
  dy = pmouseY-mouseY;
  
  lineWidth = map(speed, -10,10,10,0);
  lineWidth = constrain(lineWidth, 0, 5);
  
  dx = map(dx,-70, 70, -10, 10);
  dx = constrain(dx, -10,10);
  dy = map(dy,-70, 70, -10, 10);
  dy = constrain(dy, -10,10);
  
  
}

void mousePressed(){
laserSound.load();
    laserSound.play();
    
}

 void mouseDragged(){
    
    
    
    
    
    
    brush();  
    //info();
}



void brush() {



  color c = color(r,g,b*speed);
  stroke(c);
  fill(c);
  strokeWeight(lineWidth);
  
  for(j = 1;j < d; j =j + random(3)){
  for(i = 1;i < d; i =i+random(3)){
      ellipse(mouseX+dx*(i+j), mouseY+dy*(i+j),10 - speed ,10 - speed);
      
  }
  }
  line(pmouseX, pmouseY, mouseX, mouseY)
  
}


void info(){
  stroke(0,0,0);
  fill(0,0,0);
  rect(0,0,100,100);
  
  stroke(100,100,100);
  fill(100,100,100);
  
  
  // output information for debugging. later I will comment out the call.
    font = loadFont("FFScala.ttf"); 

    textFont(font); 

    text("dx:" , 15, 30); 
    text(dx, 30, 30); 

    text("dy:", 15, 40); 
    text( dy, 30, 40); 
    
    

  
  }
  
  
  void doPixels(){
 




  

  


}

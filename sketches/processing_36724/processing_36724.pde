
void setup(){
  size(800,800);
  background(0);
  fill(0);
  
  //Moon
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(760,40,300,300);
fill(206,206,206);
ellipse(750,30,10,10);
ellipse(700,120,10,10);
ellipse(690,90,10,10);
ellipse(770,10,10,10);
ellipse(780,80,10,10);
ellipse(680,30,10,10);
ellipse(760,130,10,10);

  frameRate(3);
  
  float RANDOM = floor(random(0,50));
  println(RANDOM);
}


//Setup
int numOfEllipses = 100;

void draw(){  
  //Stars
  if(numOfEllipses > 0){
    fill(234,234,234);
      ellipse(random(width-300),random(height-100),20,20);
    fill(247,247,182); 
      ellipse(random(width-300),random(height-100),15,15);
    fill(252,252,242);
      ellipse(random(width),random(height),10,10);


      
}
  
    // 
    numOfEllipses--;
    
    
}



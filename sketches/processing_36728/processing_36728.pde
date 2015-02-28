
void setup(){
  size(300,300);
  background(0);
  fill(0);
  
  //Moon
noStroke();
fill(255,255,255);
ellipseMode(CENTER);
ellipse(280,20,100,100);
fill(206,206,206);
ellipse(280,55,10,10);
ellipse(290,30,10,10);
ellipse(260,60,10,10);
ellipse(260,40,10,10);
ellipse(240,20,10,10);
ellipse(275,9,10,10);
ellipse(260,5,10,10);

  frameRate(3);
  
  float RANDOM = floor(random(0,50));
  println(RANDOM);
}


//Setup
int numOfEllipses = 50;

void draw(){  
  //Stars
  if(numOfEllipses > 0){
    fill(234,234,234);
      ellipse(random(width),random(height),5,5);
    fill(247,247,182); 
      ellipse(random(width),random(height),5,5);
    fill(252,252,242);
      ellipse(random(width),random(height),10,10);


      
}
  
    // 
    numOfEllipses--;
    
    
}



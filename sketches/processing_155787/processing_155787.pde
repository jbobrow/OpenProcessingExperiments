
float sunX = 300;
float sunY = 0;
float sunSize = 100;


float speedY = 10;

void setup (){
  size (1200,800);
  smooth();
  noStroke();
  ellipseMode(CORNER);
}

void draw () {
  background (0);
    fill(71,190,254); 
    rect (0,0,1200,500); 
    fill (255,181,82); 
    rect(0,500,1200,300);
    
     sunX=sunX+1;
    speedY = speedY +0.5;
    sunY= sunY+ speedY;
      if (sunY>height-sunSize) {
        sunY= height-sunSize;
        speedY = speedY * -0.9;
      }
      else if (sunY <=0) {
        speedY = -speedY;
      }
  
    fill(250,255,111); 
    ellipse(sunX,sunY,sunSize + sunY*0.1,sunSize+ sunX*0.1);
   
 if (sunY >500) {
    fill (0,25,51); 
    rect(0,0,1200,500); 
    fill (255,255,153);
    ellipse(250,100,5,5);
    ellipse(300,400,5,5);
    ellipse(150,50,5,5);
    fill (255,255,153,75);
    ellipse(700,50,5,5);
    ellipse(900,150,5,5);
    ellipse(600,200,5,5);
    ellipse(650,30,5,5);
    fill (255,255,153,80);
    ellipse(1100,350,5,5);
    ellipse(1000,250,5,5);
    ellipse(459,175,5,5);
    ellipse(500,300,5,5);
    fill (255,255,153,65);
    ellipse(750,230,5,5);
    ellipse(800,20,5,5);
    ellipse(810,280,5,5);
    ellipse(512,120,5,5);
    ellipse(370,242,5,5);
    ellipse(220,310,5,5);
    
 }
}




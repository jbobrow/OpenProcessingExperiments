

float x=100;
float y=0;


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,1000);
  
  background(0);
  noStroke();
  smooth();
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(0,249,255);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}

void draw()
{
  strokeWeight(4);
   
   //circle one left
   //fill(0);
   //ellipse(0,350,550,550);
    //fill(255);
   //ellipse(0,350,540,540);

//fill(0);
//ellipse(0,350,100,100);

 
 
  fill(255);
  ellipse(0,0,150,150);
  fill(0);
  ellipse(0,0,140,140);
 
 
  fill(0);
  ellipse(0,1000,300,300);
  fill(255);
  ellipse(0,1000,270,270);
  
   ellipse(0,600,100,100);
  ellipse(100,600,75,75);
  ellipse(175,600,50,50);
  ellipse(240,600,25,25);
  
  
  fill(0);
  ellipse(0,150,100,100);
  fill(255);
 
  fill(0);
  ellipse(0,270,75,75);
  fill(255);
  ellipse(0,350,50,50);
  fill(0);
  ellipse(0,750,100,100);
  fill(255);
  ellipse(0,750,75,75);
 
  fill(0);
  ellipse(450,300,300,300);
  fill(255);
  ellipse(450,300,275,275);
  fill(0);
  ellipse(450,300,250,250);
  fill(255);
  ellipse(450,300,225,225);
  fill(0);
  ellipse(450,300,200,200);
  fill(255);
  ellipse(450,300,175,175);
fill(0);
ellipse (450,300,100,100);


fill(0);
  ellipse(350,200,100,100);
 
  ellipse(350,200,175,175);
  fill(0);
  ellipse(350,200,150,150);
  fill(255);
  ellipse(350,200,125,125);
  fill(0);
  ellipse(350,200,100,100);
  fill(255);
  ellipse(350,200,75,75);

  fill(0);
  ellipse(350,800,300,300);
fill(255);
ellipse(350,800,50,50);

fill(0);
  ellipse(175,550,25,25);
  ellipse(175,510,10,10);
  
  fill(255);
  ellipse(175,325,200,200);
  fill(0);
  ellipse(175,325,100,100);
  
  fill(255);
  ellipse(350,550,150,150);
  fill(0);
  ellipse(350,550,100,100);
  
  
  fill(255);
  ellipse(200,0,150,150);
  fill(0);
  ellipse(200,0,100,100);
  
  








}


void yourFunction(){
  float x=200;
float y=0;
  
  while(x>50){
  strokeWeight(10);
  stroke(0,249,255,5);
 
  fill(random(0,255),10);
  rect(random(0,100),random(0,100),random(y,x),random(y,x));
  
  
  
 y = y+.1;
 x = x-.1;

  



  }
  }


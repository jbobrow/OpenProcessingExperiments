
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
  fill(0,220,222);
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
   fill(0);
   ellipse(0,350,550,550);
    fill(255);
   ellipse(0,350,540,540);

fill(0);
ellipse(0,350,100,100);

  fill(255);
   ellipse(320,600,75,75);
  ellipse(250,600,50,50);
  ellipse(250,600,25,25);
  fill(0);
  ellipse(500,600,100,100);
  ellipse(400,600,75,75);
  ellipse(320,600,50,50);
  ellipse(250,600,25,25);
 
  fill(255);
  ellipse(500,0,150,150);
  fill(0);
  ellipse(500,0,140,140);
 
 
  fill(0);
  ellipse(0,1000,300,300);
  fill(255);
  ellipse(0,1000,270,270);
  
   ellipse(250,0,100,100);
  ellipse(250,100,75,75);
  ellipse(250,175,50,50);
  ellipse(250,230,25,25);
  
  
  fill(0);
  ellipse(300,750,100,100);
  fill(255);
  ellipse(300,750,175,175);
  fill(0);
  ellipse(300,750,150,150);
  fill(255);
  ellipse(300,750,125,125);
  fill(0);
  ellipse(300,750,100,100);
  fill(255);
  ellipse(300,750,75,75);
 
  fill(0);
  ellipse(450,200,200,200);
  fill(255);
  ellipse(450,200,175,175);
  fill(0);
  ellipse(450,200,150,150);
  fill(255);
  ellipse(450,200,125,125);
  fill(0);
  ellipse(450,200,100,100);
  fill(255);
  ellipse(450,200,75,75);

fill(0);
  ellipse(350,750,100,100);
 
  ellipse(350,800,175,175);
  fill(0);
  ellipse(350,800,150,150);
  fill(255);
  ellipse(350,800,125,125);
  fill(0);
  ellipse(350,800,100,100);
  fill(255);
  ellipse(350,800,75,75);



  
  











}


void yourFunction(){
  float x=200;
float y=0;
  
  while(x>50){
  strokeWeight(10);
  stroke(0,220,222,5);
 
  fill(random(0,255),10);
  rect(random(0,100),random(0,100),random(y,x),random(y,x));
  
  
  
 y = y+.1;
 x = x-.1;

  



  }
  }


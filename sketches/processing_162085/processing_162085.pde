
int counter;
int red = 0;
int green = 255;
int black = 0;


void setup() {  //setup function called initially, only once
  size(900, 900);
  background(255);  //set background
  counter = 0;
}
  
void draw(){    

fill(255,0,0);
rect(450,450,20,20);
fill(0,255,0);
ellipse(200,200,20,20);
fill(0,0,255);
triangle(130,130,130,50,50,50);

fill(255,255,0);
rect(100,300,20,20);
fill(160,32,240);
rect(200,400,20,20);
fill(0,255,255);
rect(300,400,20,20);

fill(255,160,122);
ellipse(650,450,20,20)
fill(148,0,211);
ellipse(700,500,20,20);

   fill(255,255,255);
   rect(400,400,50,50);
   fill(0,0,0);
   rect(500,500,50,50);
   fill(190,190,190);
   rect(600,600,50,50);
   
   fill(random(255),random(255),random(255));
   rect(600,600,50,50);
   
   fill(red,0,0);
   ellipse(300,350,50,50);
   red += 1;
   
   fill(0,green,0);
   rect(500,200,50,50);
   green -= 1; 
  
  fill(black);
  triangle(100,50,100,10,10,10);
  black += 1;
  
  }
  

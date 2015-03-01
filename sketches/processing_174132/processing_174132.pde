
void setup() 
{ 
 size(300,300); 
 rectMode(CENTER); 

} 

void draw() 
{ 
  background(77,39,0); 
 fill(113,76,39,110);
 stroke(35);
 ellipse(150,150,300,300);
 ellipse(100,100,250,150);
 ellipse(200,200,75,120);
 ellipse(0,300,180,250);
 ellipse(250,250,50,70);
 ellipse(300,0,200,150);
 ellipse(100,150,100,100);
 ellipse(180,180,250,250);
 ellipse(100,50,150,150);
 fill(255,128,0,110);
 ellipse(220,100,20,20);
 ellipse(50,250,30,30);
 ellipse(60,30,10,10);
 ellipse(110,210,40,20);
 fill(110,200);
 ellipse(220,210,60,60);
 ellipse(210,240,15,15);
 ellipse(240,205,30,30);
 ellipse(75,80,45,45);
 fill(0,137,1);
 rect(70,160,5,5);
 rect(75,158,5,5);
 rect(75,165,5,5);
 rect(230,60,5,5);
 rect(225,55,5,5);
 rect(225,65,5,5);
 rect(235,55,5,5);
 rect(235,65,5,5);
 rect(230,265,10,10);
 rect(225,270,5,5);

  fill(255,50); 
  stroke(28,124,0); 
  for(int x = 0; x <= width;x+=150) 
  {     for(int y = 0;y<=height;y+=150) 
    { 
    pushMatrix(); 
    translate(x,y); 
     float f = random(155,255); 
    fill(f,50); 
  for(int i = 100; i >0;i-=10) 
  { 
  fill(i*2.55,0,0,150); 
    rotate(radians(frameCount*.25)); 
  rect(0,0,i,i); 
  } 
  popMatrix(); 
  } 
  } 
  
  
} 


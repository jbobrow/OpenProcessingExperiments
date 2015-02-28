
void setup()
{
  size(600,600);
  background(255,255,255);
}

void draw()
{
  background(255); 
  strokeWeight(6);
  line(0,50,600,50);
  line(0,200,600,200);
  line(0,450,600,450);
  line(50,50,50,600);
  line(50,350,580,350);
  line(150,0,150,50);
  line(350,0,350,580);
  line(580,0,580,600);
  line(200,400,200,600);
 
 
  println(mouseX);
  
  //blue fill 
  fill(16,35,176);
  rect(350,450,230,130);
   
  //yellow fill  
  fill(250,209,103);
  rect(0,450,50,150);
  rect(350,0,230,200);
  
  //red fill 
  fill(218,48,31);
  rect(50,50,300,300);
  rect(580,450,20,150);
  
  //black fill 
  fill(0,0,0);
  rect(50,350,150,180);
  rect(200,530,150,50);
  
  
}



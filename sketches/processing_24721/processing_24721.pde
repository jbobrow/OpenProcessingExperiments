


void setup()
{
  size(300,600);

  background(255); 

}

void draw()
{
 
   smooth();
  noStroke();
  fill(250,100,100);
  triangle(150,300,120,100,180,100);
  triangle(150,300,120,500,180,500);
  triangle(150,300,50,280,50,320);
  triangle(150,300,250,280,250,320);
  
  triangle(150,300,30,200,50,150);
  triangle(150,300,250,60,290,40);
  triangle(150,300,20,480,70,460);
  triangle(150,300,220,430,280,470);
 
  fill(100,255,100);
  triangle(30,200,50,150,20,120);
  triangle(250,60,290,40,260,30);
  triangle(20,480,70,460,60,500);
  triangle(220,430,280,470,230,460);
  //seeds
  fill(0);
  triangle(95,145,110,140,105,165);
  triangle(30,380,50,370,40,390);
  triangle(210,500,225,490,210,475);
  triangle(180,270,195,265,190,250);
  
  
  fill(100,255,100);
  rect(120,80,60,20);
  rect(120,500,60,20);
  rect(30,280,20,40);
  rect(250,280,20,40);
  
 

}


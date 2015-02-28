
int clickState = 0;

 
void setup() 
{
  background(5,5,5);
  size(800,500);
}
 
void draw()
{
  background(5,5,5);
  textSize(12);
  fill(255);
  text("FALL: The Bishop has arrived. What are your orders?" , 10, 30); 
  /////////////////////////////////////////////////////////
  if (clickState >= 1)
  {
    text("SPRING: Where is the Bishop being held?" , 10, 45); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 2)
  {
    text("FALL: He is being held in the Green Saviors feet. What are your orders?", 10, 60); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 3)
  {
    text("SPRING: Fragmentation.", 10, 75); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 4)
  {
    text("FALL: To what extent?", 10, 90); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 5)
  {
    text("SPRING: The extent does not matter as long as we obtain the information and the location of the Child.", 10, 105); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 6)
  {
    text("FALL: And if he resists?", 10, 120); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 7)
  {
    text("SPRING: Then we will obtain another Bishop.", 10, 135); 
  }
  /////////////////////////////////////////////////////////
  if (clickState >= 8)
  {
    text("FALL: Very Well", 10, 150); 
  }
  /////////////////////////////////////////////////////////
  println(clickState);
  if (clickState >=8 == true)
  {
  textSize(12);
  fill(0,0,255);
  text("BISHOP: FUNNY." , 10, 165); 
  text("BISHOP: VERY FUNNY." , 10, 180); 
  text("BISHOP: YOU ARE BOTH FUNNY." , 10, 195); 
  text("BISHOP: YOU ARE BOTH FUNNY." , 10, 210); 
  text("BISHOP: HOW FUNNY WILL YOU BE WHEN YOU CANNOT TALK." , 10, 225); 
  text("BISHOP: HOW FUNNY WILL YOU BE WHEN YOU CANNOT TALK." , 10, 240); 
  }
  
  
  if (clickState >=9 == true)
  {
  strokeWeight(1);
  stroke(0,0,255);
  line(0, random(500), 800, random(100));
  line(10, random(500), 800, random(100));
  line(30, random(500), 800, random(100));
  line(50, random(500), 800, random(100));
  line(70, random(500), 800, random(100));
  line(90, random(500), 800, random(100));
  line(110, random(500), 800, random(100));
  line(130, random(500), 800, random(100));
  line(150, random(500), 800, random(100));
  line(170, random(500), 800, random(100));
  line(190, random(500), 800, random(100));
  line(210, random(500), 800, random(100));
  line(230, random(500), 800, random(100));
  line(250, random(500), 800, random(100));
  line(270, random(500), 800, random(100));
  line(290, random(100), 800, random(100));
  line(310, random(100), 800, random(100));
  line(330, random(100), 800, random(100));
  line(350, random(100), 800, random(100));
  line(370, random(100), 800, random(100));
  
  
  
  size(800, 500);
  float v = 0.0;
  float inc = 0.1;
  stroke(0.1);
  fill(0,0,255);
  noiseSeed(0);
  for (int i = 0; i < width; i = i+4) 
  {
  float n = noise(v) * 70.0;
  rect(i, 10 + n, 3, 20);
  v = v + inc;
  }
  size(500, 800);
  

  stroke(0.1);
  fill(0,0,255);
  noiseSeed(0);
  for (int i = 0; i < width; i = i+4) 
  {
  float n = noise(v) * 70.0;
  rect(i, 10 + n, 3, 20);
  v = v + inc;
  }
  
  strokeWeight(1);
  stroke(0,0,255);
  line(0, random(500), 800, random(100));
  line(10, random(500), 800, random(100));
  line(30, random(500), 800, random(100));
  line(50, random(500), 800, random(100));
  line(70, random(500), 800, random(100));
  line(90, random(500), 800, random(100));
  line(110, random(500), 800, random(100));
  line(130, random(500), 800, random(100));
  line(150, random(500), 800, random(100));
  line(170, random(500), 800, random(100));
  line(190, random(500), 800, random(100));
  line(210, random(500), 800, random(100));
  line(230, random(500), 800, random(100));
  line(250, random(500), 800, random(100));
  line(270, random(500), 800, random(100));
  line(290, random(100), 800, random(100));
  line(310, random(100), 800, random(100));
  line(330, random(100), 800, random(100));
  line(350, random(100), 800, random(100));
  line(370, random(100), 800, random(100));
  
  
  for (int i = 0; i < 100;i++) 
  {  
    fill(random(36)*10, 100, 100, 150);
 
    textSize(random(20, 60));
    text("ITS FUNNY WHEN YOU HAVE NO MOUTH", random(-50,width), random(height));
   }
  
  textSize(16);
  fill(0,0,255);
  text("BISHOP: ITS FUNNY WHEN YOU HAVE NO MOUTH." , random(-50,width), random(height)); 
  text("BISHOP: ITS FUNNY WHEN YOU HAVE NO MOUTH." , random(-50,width), random(height));
  text("BISHOP: ITS FUNNY WHEN YOU HAVE NO MOUTH." , random(-50,width), random(height));
  text("BISHOP: ITS FUNNY WHEN YOU HAVE NO MOUTH." , random(-50,width), random(height));
  


  }
  
  
  
 
  
  
}
 
void mouseReleased()
{
  clickState += 1;
}





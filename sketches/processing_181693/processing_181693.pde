
float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.00025;
 
float detail = 0.2;

void setup()
{
  size (400, 400);
  background (0);
   fill(255, 0, 0, 50);

}

void draw()
{
  background (0);
  
  if (mousePressed) 
  {
    fill(100, 100);
rect(0, 0, 400, 400);
   fill(255,255,255);
    ellipse(200,200,60,60);
    stroke(150);
    fill (100,250);
    rect(150, 200,200, 10);
    triangle(75, 75, 58, 20, 86, 75);
     fill(255,255,255);
    ellipse(75,58,20,20);
   triangle(300, 200, 100, 50, 86, 75);
    fill (250);
    ellipse(225,285,50,20);
    rect(250,250,5, 5);
    fill (245,249,98);
    rect(240,280,5, 5);
     fill (245,249,98);
    rect(230,280,5, 5);
     fill (245,249,98);
    rect(220,280,5, 5);
     fill (245,249,98);
    rect(210,280,5, 5);
    stroke (255);
    noFill();
    ellipse(200,200,200,200);
    
      if(angle < width){
    fill(angle, 0, 0);
    translate(width/2, height/2);
    rotate(angle);
    triangle(100, 75, 100, 20, 86, 75);
    stroke(150);
    fill (100,250);
    rect(50, 100,200, 5);
     
    
    if(aVelocity < detail){
      aVelocity += aAcceleration;
    }
    angle += aVelocity;
    }
   
    }
  else
  {
   PFont f;
    {
  size(400,400);
  f = createFont("Arial",50,true);
  }
  

  textFont(f);       
  fill(255);

  textAlign(CENTER);
  text("HELLO WORLD",width/2,200); 
  
  textAlign(CENTER);
  text("click",width/2,350); 


  }
  
  {
     fill(255,255,255);
    ellipse(100,250,10,10);
    fill(255,255,255);
    ellipse(150,250,10,10);
    fill(255,255,255);
    ellipse(200,250,10,10);
    fill(255,255,255);
    ellipse(250,250,10,10);
    fill(255,255,255);
    ellipse(300,250,10,10);
    
  }
  
  }

  


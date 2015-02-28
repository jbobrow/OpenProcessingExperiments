
float angle;
  
void setup()
{
  size(1000,1000);
}
  
void draw()
{
  background(0,0,0);
  
  angle += random(0.0001,50);
  
  strokeWeight(random(0,100));
  stroke(0,0,0);
  fill(random(100,300),220,206);
 
  translate(width/random(1,10),height/random(1,10));
   
  for (int i=10; i<100; i++){
    fill(226,220,random(100,150));
    rotate(angle);
    scale(random(0.95,1));
    rectMode(CENTER);
    rect(0,0,1000,1000);
    rect(random(0,1000),random(0,1000),300,300);
    ellipse(random(0,1000),random(0,1000),100,100);
    ellipse(100,100,random(0,1000),random(0,1000));
  }
}

//la creación de un universo infinito, diverso y de caos absoluto pero estabilidad perfecta, realidad en un equilibrio desequilibrado y confuso

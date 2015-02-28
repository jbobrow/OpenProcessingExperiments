



Flower [] flowers = new Flower[40];


void setup()
{
  size(900, 800);
  background(0);
  
  for(int i = 0; i < flowers.length; i++)
  {
     flowers[i] = new Flower(random(0.001, 0.02));
  }
  
}

void draw(){
 float t = 0.;
 for(int i = 0; i < flowers.length; i++)
  {
     flowers[i].move(t);
     flowers[i].display();
  }
  
  
  t = t + 0.1;
   
}

void mousePressed() {
  
  background(0);

}


class Flower{
  
  float Offset;
  float startX, startY;
  float speed;
  float x, y;
  
   Flower(float _speed) {
     
     Offset = random(2. * PI);
     startX = random(-150.,250);
     startY = random(50.,500);
     speed = _speed;
   }
   
   void move(float t)
   {


     
       float interp = noise(t + Offset);
       startX = startX + (interp * speed);
       startY = startY + (interp * speed);
       
       
       x = map(noise(startX), 0., 1., 0, width); ;
       y = map(noise(startY), 0., 1., 0, height);
       

       
   }
   
   void display() 
   {
   float distance = dist(x, y, width / 2.5, height / 2.5);

    int fcolor = (int)map(distance, 0, width, 255, 50 );
     
     
    fill(fcolor, random( 250), mouseX,10);
    stroke(255,70);
    bezier(x, 300, x+ mouseX,y, x + Offset  , y + Offset, x,300); 
    stroke(fcolor,0,0,random(10,50));
    line(x,y,450,300);
   // line(80,300,900,300);
    //stroke(fcolor,10);
    
    noStroke();
    ellipse(x,y,fcolor/2-mouseX/10,fcolor/2-mouseX/10);
    
    fill(255,0,0,40);
    ellipse(x,y,6,6);
    
    fill(0,10);
    noStroke();
    ellipse(random(900),random(800),100,100);
  
  
  
   }
  
}


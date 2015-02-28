
float s_y = 10;
float s_x = 10;
float m_x = 0;
float m_y = 0;



void setup(){
  size(500,500);
  frameRate(30);
 

}

void draw(){
  m_x = mouseX;
  m_y = mouseY;
  
  background(0,0,0);
  
  s_x = random(10,40);
  s_y = random(10,40);

  
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,300,400,200,100);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,100,300,400,m_y,100);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(300,m_x,m_y,400,200,100);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(300,400,200,100,m_x,m_y);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(50,100,m_x,100,400,m_y);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(50,m_x,30,100,m_y,m_y+300);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(50,40,m_y-200,m_x+200,m_y,m_y+300);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_y-200,40,400,200,m_y,m_y+300);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(337,322,m_y,450,m_x,100);
  

  
  
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,random(0,500),random(0,500),random(0,500),random(0,500));
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,random(0,500),random(0,500),m_y,random(0,500));
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,m_y,random(0,500),random(0,500),random(0,500));
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,random(0,500),random(0,500),m_x,m_y);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,m_x,random(0,500),random(0,500),m_y);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,random(0,500),random(0,500),m_y,m_y+random(0,500));
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(m_x,m_y,m_y-random(0,500),m_x+random(0,500),m_y,m_y+random(0,500));
}



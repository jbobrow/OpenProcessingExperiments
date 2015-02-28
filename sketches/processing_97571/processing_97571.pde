
float a_y = 10;
float b_x = 10;
float m_x = 0;
float m_y = 0;
 
 
 
void setup(){
  size(500,500);
  frameRate(10);
  
 
}
 
void draw(){
  m_x = mouseX;
  m_y = mouseY;
   
  background(0,0,0);
   
  b_x = random(10,40);
  a_y = random(10,40);
}
  void mousePressed() {
   if (m_x ==0) {
    m_y =255;
   } else {
    m_x= 0;
   }
  
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  ellipse(50,50,300,250);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  ellipse(100,300,400,100);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  ellipse(50,50,400,100);
  
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
 ellipse(random(0,500),random(0,500),random(0,500),random(0,500));
 fill(random(0,255),random(0,255),random(0,255),random(0,255));
 ellipse(random(0,500),random(0,500),random(0,500),random(0,500));


}




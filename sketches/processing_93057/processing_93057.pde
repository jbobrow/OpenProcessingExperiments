
int r = 100;    //promień kształtu
int numberOfVertices = 25; //ilość wierzchołków w kształcie

void setup ()
{
  size(800,800);
    background(128);
}

void drawShape(float x, float y, float r, int numberOfVertices)
{
  numberOfVertices = int(numberOfVertices);
  pushMatrix();
  translate(x,y);
  float angle = 2*PI/numberOfVertices;
  beginShape();
  for(int i = 0; i <= numberOfVertices; i++)
  {
    
    float vx = r * cos(angle * i) * noise(i == numberOfVertices? 0 : i * 0.1, frameCount * 0.01);
    float vy = r * sin(angle * i) * noise(i == numberOfVertices? 0 : i * 0.1, frameCount * 0.01);
    vertex(vx ,vy);
  }
  endShape();
  
  popMatrix();
}



void draw()
{
  fill(255, 25);
}    
  


void mousePressed() {
//czyszczenie ekranu prawym przyciskiem myszy
  if(mousePressed && (mouseButton == RIGHT))
    background(128);
//pomocnicze zmienne
  float m_x = mouseX;
  float m_y = mouseY;
  float r_x = random(100);
  float r_y = random(100);
//pętla rysująca kształt
  for(int i = r; i > 0; i-=1)
  {
  drawShape(m_x, m_y, i, numberOfVertices);
  m_x = m_x+50*(noise((r_x+frameCount+i)*0.01)-0.5);
  m_y = m_y+50*(noise((r_y+frameCount+i)*0.01)-0.5);
  
  }
}

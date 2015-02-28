
int state;
final int CLOSED = 0;
final int OPENING = 1;

ArrayList ps;
PFont font;

// CLOSED vars
float z = 0;
float zInc = 0;

// OPENING vars
float a = 0;
float aInc = 0;



void setup()
{
  size(800, 800, P3D);
  colorMode(RGB, 255);
  background(32);
  smooth();
  
  state = CLOSED;
  
  ps = new ArrayList();
  
  font = loadFont("AvenirLTStd-Light-48.vlw");
  textFont(font, 24);
}

void draw()
{
  translate(width/2, height/4);
  background(32);
  
  switch(state)
  {
    case CLOSED:
      
      noStroke();
      fill(128);
      beginShape(QUADS);
      vertex(0, 0);
      vertex(64*3, 0);
      vertex(64*3, 64*5);
      vertex(0, 64*5);
      endShape(CLOSE);
      
      noStroke();
      fill(192);
      lights();
      // get points
      for (int i=0; i<3; i++)
      {
        for (int j=0; j<5; j++)
        {
          if (i==2 && j==4)
          {
            beginShape(TRIANGLES);
            vertex(64*i, 64*j, 0);
            vertex(64*i+64, 64*j, 0);
            vertex(64*i, 64*j+64, 0);
            
            vertex(64*i, 64*j+64, 0);
            vertex(64*i+64-(z/2), 64*j+64-z, z);
            vertex(64*i+64, 64*j, 0);
            endShape(CLOSE);
          }
          else
          {
            beginShape(TRIANGLES);
            vertex(64*i, 64*j, 0);
            vertex(64*i+64, 64*j, 0);
            vertex(64*i, 64*j+64, 0);
            
            vertex(64*i, 64*j+64, 0);
            vertex(64*i+64, 64*j+64, 0);
            vertex(64*i+64, 64*j, 0);
            endShape(CLOSE);
          }
        }
      }
      
      z = sin(zInc)*24+24;
      zInc = (zInc + 0.048)%TWO_PI;
      break;
    case OPENING:
      noStroke();
      fill(128);
      beginShape(QUADS);
      vertex(0, 0);
      vertex(64*3, 0);
      vertex(64*3, 64*5);
      vertex(0, 64*5);
      endShape(CLOSE);
       
      if (a > PI/2)
      {  fill(128);
      } else {
        fill(192);
      }
      beginShape(QUADS);
      vertex(0, 0, 0);
      vertex(cos(a)*64*3, 0, sin(a)*64);
      vertex(cos(a)*64*3, 64*5, sin(a)*64);
      vertex(0, 64*5, 0);
      endShape();
      
      a+=0.024;
      if (a>PI) {
        
        state++;
      }
      break;
    default:
      noStroke();
      fill(128);
      beginShape(QUADS);
      vertex(0, 0);
      vertex(-64*3, 0);
      vertex(-64*3, 64*5);
      vertex(0, 64*5);
      
      vertex(0, 0);
      vertex(64*3, 0);
      vertex(64*3, 64*5);
      vertex(0, 64*5);
      endShape(CLOSE);
      
      if (ps.size()<640) ps.add(new PVector(random(-64*3, 64*3), 0, 10));
      for (int i=0; i<ps.size(); i++)
      {
        PVector p = (PVector)ps.get(i);
        
        if (p.y<64*5-1) 
        {
          p.y += random(1);
          p.x += random(-0.1, 0.1);
        }
        else
        {
          p.x = random(-64*3, 64*3);
          p.y = 0;
        }
        
        stroke(255);
        strokeWeight(2);
        point(p.x, p.y);
        
        strokeWeight(1);
        stroke(255, 12);
        for (int j=0; j<ps.size(); j++)
        {
          if (j!=i)
          {
            PVector q = (PVector)ps.get(j);
            float d = dist(p.x, p.y, q.x, q.y);
            if (d<32)
            {
              line(p.x, p.y, q.x, q.y);
            }
          }
        }
      }
      
      noStroke();
      fill(255);
      textFont(font, 20);
      textAlign(CENTER);
      text("have an awesome 2012", 0, 64*6);
      textFont(font, 16);
      text("live it like it's your last", 0, 64*6+20);
      text("love, mark brand", 0, 64*6+38);
      break;
  } 
}

void mouseReleased()
{
  switch(state)
  {
    case CLOSED:
      if (mouseX>400 && mouseX<590 && mouseY>200 && mouseY<520)
      {
        state = OPENING;
      }
    break;
  }
}


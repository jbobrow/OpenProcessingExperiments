
//HW1 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 08/31/2011 - CMU

void setup()
{
  size(400,400);
  background(0);
}

//A function produce ripples using a forloop
void ripples()
{
  for(int i = 20; i > 0; i--)
  {
    smooth();
    noFill();
    strokeWeight(i / 3);
    stroke(255,0,0, 1);
    ellipse(300,400,400 + (20 * i), 200 + (20 * i));
    ellipse(400,100,100 + (20 * i), 300 + (20 * i));
  }
}

//A function to for the diffrent initials
void initials(String s)
{
  if(s.equals("z"))
  {
    fill(247,211,90);
    ellipse(80,80,150,20);
    ellipse(80,300,150,20);
    translate(-30,220);
    rotate(radians(-60));
    ellipse(80,80,280,20);
  }
  
  else if(s.equals("h"))
  {
    fill(240,150,70);
    beginShape();
    curveVertex(170,60);
    curveVertex(170,60);
    curveVertex(160,280);
    curveVertex(180,280);
    curveVertex(170,60);
    curveVertex(170,60);
    endShape();
    
    beginShape();
    curveVertex(220,30);
    curveVertex(220,30);
    curveVertex(210,280);
    curveVertex(230,280);
    curveVertex(220,60);
    curveVertex(220,60);
    endShape();
    
    beginShape();
    curveVertex(170,30);
    curveVertex(170,30);
    curveVertex(160,80);
    curveVertex(180,80);
    curveVertex(170,30);
    curveVertex(170,30);
    endShape();
    
    beginShape();
    curveVertex(210,30);
    curveVertex(210,30);
    curveVertex(208,80);
    curveVertex(230,80);
    curveVertex(230,30);
    curveVertex(228,70);
    curveVertex(220,70);
    curveVertex(212,70);
    curveVertex(210,30);
    curveVertex(210,30);
    endShape();
    
    ellipse(195,195,100,20);
  }
  
  else if(s.equals("e"))
  {
    fill(250,70,70);
    ellipse(320,195,80,15);
    ellipse(310,298,120,20);
    ellipse(310,80,80,15);
    beginShape();
    curveVertex(280,70);
    curveVertex(280,70);
    curveVertex(270,280);
    curveVertex(300,280);
    curveVertex(280,70);
    curveVertex(280,70);
    endShape();
    
    beginShape();
    curveVertex(280,90);
    curveVertex(280,90);
    curveVertex(260,180);
    curveVertex(270,220);
    curveVertex(280,220);
    curveVertex(280,90);
    curveVertex(280,90);
    endShape();
    
    fill(247,211,90);
    beginShape();
    curveVertex(280,20);
    curveVertex(280,20);
    curveVertex(265,60);
    curveVertex(295,60);
    curveVertex(280,20);
    curveVertex(280,20);
    endShape();
  }
}

//The main function
void draw()
{
  ripples();
  strokeWeight(6);
  stroke(255,255,255,20);
  initials("h");
  initials("e");
  initials("z");
  //saveFrame();
  redraw();
}


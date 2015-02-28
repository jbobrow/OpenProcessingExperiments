
void setup ()
{
  size(500, 500);
  
  smooth();
 noStroke();
}

void draw()
{
  background(37,70,77);
  for (int i = 0; i <3; i++)
  {
    for (int j = 0; j<3; j++)
    {
      body(i*500, j*500);
    }
  }
}


void body(int x, int y)
{
  float stretch;


  pushMatrix();
  scale(0.35);
  
  stretch = noise(mouseX)*3.0;

fill(106,34,45);
    ellipse(x+200, y+100, 40, 40);

  beginShape();
  vertex(x+180, y+125);
  vertex(x+185, y+130);
  vertex(x+185, y+225);
  vertex(x+190, y+235);
  vertex(x+185, y+245);
  vertex(x+187, y+235);
  vertex(x+185, y+230);
  vertex(x+183, y+235);
  vertex(x+181, y+227);
  vertex(x+182, y+225);
  vertex(x+178, y+187);
  vertex(x+180, y+183);
  vertex(x+178, y+130);
  vertex(x+180, y+125);
  endShape();

  beginShape();
  vertex(x+170, y+100);
  vertex(x+185, y+130);
  vertex(x+135, y+140);
  vertex(x+160, y+200);
  vertex(x+170, y+280);
  vertex(x+185, y+275);
  vertex(x+165, y+290);
  vertex(x+165, y+280);
  vertex(x+150, y+215);
  vertex(x+153, y+200);
  vertex(x+130, y+160);
  vertex(x+120, y+160);
  vertex(x+125, y+210);
  vertex(x+90, y+275);
  vertex(x+105, y+280);
  vertex(x+100, y+285);
  vertex(x+90, y+285);
  vertex(x+85, y+275);
  vertex(x+87, y+274);
  vertex(x+110, y+215);
  vertex(x+115, y+210);
  vertex(x+105, y+160);
  vertex(x+108, y+145);
  vertex(x+120, y+125);
  vertex(x+170, y+100);
  endShape();

  beginShape();
  vertex(x+170, y+100);
  vertex(x+175, y+105);
  vertex(x+175, y+200);
  vertex(x+180, y+210);
  vertex(x+175, y+220);
  vertex(x+177, y+210);
  vertex(x+175, y+205);
  vertex(x+173, y+210);
  vertex(x+171, y+202);
  vertex(x+172, y+200);
  vertex(x+168, y+162);
  vertex(x+170, y+158);
  vertex(x+168, y+105);
  vertex(x+170, y+100);
  endShape();
  
  fill(59,36,46);
    beginShape();
    
  int vomitX = x + 196;
  int vomitY = y + 115;
  vertex(vomitX, vomitY);
  vertex(vomitX, vomitY + (30.0*stretch));
  vertex(vomitX+2, vomitY + (35.0*stretch));
  vertex(vomitX+4, vomitY+(20.0*stretch));
  vertex(vomitX+6, vomitY+(45.0*stretch));
  vertex(vomitX+8, vomitY+(50.0*stretch));
  vertex(vomitX+10, vomitY+(45.0*stretch));
  vertex(vomitX+12, vomitY+(20.0*stretch));
  vertex(vomitX+14, vomitY+(35.0*stretch));
  vertex(vomitX+16, vomitY);
  vertex(vomitX+8, vomitY-(5.0*stretch));
  vertex(vomitX, vomitY);
  endShape();
  
  popMatrix();
}




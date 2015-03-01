
    fill(r,g,c);
    rect(100,100,150,150);
  }
  else
  {
    frameRate(5);
    fill(r,g,c);
    rect(x,y,a,d);
    x=random(width);
    y=random(height);
    a=random(10,60);
    d=random(10,60);
    r=random(120);
    g=random(210);
    c=random(240);
  }
  fill(#2CE810);
  rect(0,0,120,70);
}
void mousePressed()
{
  if(mouseX>0 && mouseX<120 &&mouseY>0 && mouseY<70)
  {
    boton = !boton;
    background(255);
    fill(#2CE810);
  rect(0,0,120,70);
  }
}
    

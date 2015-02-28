
void setup ()
{
  size (400,420);
}

void draw ()
{ background (0);

  if (mouseX< width/2 && mouseY<210)
  { fill (220,0,0);
    rect(0,0,200,200);
  }
  
  if(mouseX > width/2 && mouseY<height/2)
  {
    fill (0,220,0);
    rect(200,0,200,200);
  }
  if (mouseX < width/2 && mouseY >height/2)
 { fill (0,0,200);
  rect(0,200,200,200);
}
if (mouseX> width/2 && mouseY > height/2)
{ fill(20,150,70);
rect(200,200,200,200);
}
;
for (int i=0; i<20; i++)
{ int kleur = 255 - (i * (255/20));
fill (255, kleur, kleur);
rect (i*20, 400, 20, 20);
 
}
}
  


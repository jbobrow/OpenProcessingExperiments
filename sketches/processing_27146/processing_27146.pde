
void setup ()
{
  size(500,500);
  
}

void draw()
{
 if (mouseX >= 0 && mouseX <= 250 && mouseY >= 0 && mouseY <= 250)
 { 
  if (mousePressed == true) { 
  ellipse(mouseX, mouseY ,25,25);
 fill(255,0,0);
  }
}
 if (mouseX >= 250 && mouseX <= 500 && mouseY >= 0 && mouseY <= 250)
 { 
  if (mousePressed == true) { 
  ellipse(mouseX, mouseY ,25,25);
 fill(0,255,0);
  }
}
 if (mouseX >= 250 && mouseX <= 500 && mouseY >= 250 && mouseY <= 500)
 { 
  if (mousePressed == true) { 
  ellipse(mouseX, mouseY ,25,25);
 fill(0,0,255);
  }
}

 if (mouseX >= 0 && mouseX <= 250 && mouseY >= 250 && mouseY <= 500)
 { 
  if (mousePressed == true) { 
  ellipse(mouseX, mouseY ,25,25);
 fill(255);
  }
}


}


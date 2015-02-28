
int [] xPosities = new int[10];
int [] yPosities = new int[10];

void setup()
{ size(600,600);
  smooth();
  //noLoop();
  
  for(int i=0;i<10;i++)
  { xPosities[i] = int(random(0,10))*50;
    yPosities[i] = int(random(0,10))*50;
  }
}

void draw()
{ background(255);   // achtergrond kleur
 
  stroke(0,0,255); // omlijning kleur
  strokeWeight(5); // omlijning dikte
  
  int kleurX = int(map(mouseX,0,600,0,255));
  int kleurY = int(map(mouseY,0,600,0,255));
  
  fill(128,kleurX,kleurY); // vullen met geel
 
  // loop van 0 t/m 9 ( 10x )
  for(int i=0;i<10;i++)
  { // teken de driehoek met de waarde uit de
    // xPosities array en yPosities array
    tekenDriehoek(xPosities[i],yPosities[i]);   
  }
}

void tekenDriehoek(int x, int y)
{ //  x1, y1, x2, y2, x3, y3
  triangle(x+0, y+0, x+75, y+0, x+35, y+75); 
  // x1, y1, x2, y2
  line(x+30, y+50, x+43, y+50);
  line(x+15, y+20, x+60, y+20);
  line(x+15, y+22, x+60, y+22);
}


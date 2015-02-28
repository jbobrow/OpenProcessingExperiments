
float abstand_x, abstand_y, step, sz; //Abstand
color sekleer, sekvoll, minleer, minvoll, stleer, stvoll,hintergrund;
void setup() {
  size(500, 500);
  smooth();
  frameRate(25);
  abstand_x = 5; //Abstand nach links
  abstand_y = 25;//Durchschuss
  sz = 20;
  strokeWeight(2);
  sekleer=#7A8B8B;
  sekvoll=#E0FFFF;
  minleer=#7A8B8B;
  minvoll=#ADD8E6;
  stleer=#7A8B8B;
  stvoll=#87CEFA;
  hintergrund=#CAE1FF;
}
  
void draw() {
  background(hintergrund);
  int s = second();
  int m = minute();
  int h = hour();
  
  for (int i = -10; i<24; i++)//STUNDEN
  {
  stroke(stleer);
  if (i < h)
  {
  fill(stleer);
  }
  else
  {
  fill(stvoll);
  }
  rect(abstand_x + i*15, 2*abstand_y, sz-12, mouseX/4);
  }
  
  for (int i = 0; i<60; i++)//MINUTEN
  {
    stroke( minleer);
    if (i < m) {
      fill( minleer);
    }
    else {
      fill(minvoll);
    }
    rect(abstand_x + i*8, 8*abstand_y, sz-14, mouseX/4);
  } 
  
  for (int i = 0; i<60; i++) //SEKUNDEN
  {
    stroke(sekleer);
    if (i < s)
    {
      fill(sekleer);
    }
    else {
      fill(sekvoll);
    }
    rect(abstand_x+i*8, 14*abstand_y, sz-14, mouseX/4);
  }
  for (int i=0; i<360; i+=10) 
{ 
}
}


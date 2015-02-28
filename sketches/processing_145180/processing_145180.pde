
//Madison LArson- period 4 engineering -4.9.14


void setup ()
{
  size (900,700);
  background (#000000);
}
void draw ()
{
  fill (#FFFFFF);
  rect (0,100,900,300);
  stroke (#000000);
  line (70,100,70,400);
  line (140,250,140,400);
  line (210,100,210,400);
  line (280,250,280,400);
  line (350,100,350,400);
  line (420,250,420,400);
  line (490,100,490,400);
  line (560,250,560,400);
  line (630,100,630,400);
  line (700,250,700,400);
  line (770,100,770,400);
  line (840,250,840,400); 
  rect (200,410,500,200);
  line (450,410,450,610);
  fill (#000000);
  rect (105,100,70,150);
  rect (245,100,70,150);
  rect (385,100,70,150);
  rect (525,100,70,150);
  rect (665,100,70,150);
  rect (805,100,70,150);
  stroke (#A5761E);
  line (35,100,35,60);
  line (140,100,140,60);
  line (280,100,280,60);
  line (415,100,415,60);
  line (555,100,555,60);
  line (695,100,695,60);
  line (835,100,835,60);
  fill (#641717);
  rect (5,0,60,60);
  rect (110,0,60,60);
  rect (250,0,60,60);
  rect (385,0,60,60);
  rect (525,0,60,60);
  rect (665,0,60,60);
  rect (805,0,60,60);

 textSize(20);
 fill(#000000);
text("notes", 300,450); 
}

void mousePressed ()
{ 

if(mouseX < 70 && mouseY<400)  { fill (#815A12); rect (0,100,70,300); text ("c", 205, 500);}
if(mouseX > 70 && mouseX<140 && mouseY<400)  { fill (#815A12); rect (70,100,70,300); text ("d", 210, 500);}
if(mouseX > 140 && mouseX<210 && mouseY<400)  { fill (#815A12); rect (140,100,70,300); text ("f", 215, 500);}
if(mouseX > 210 && mouseX<280 && mouseY<400)  { fill (#815A12); rect (210,100,70,300); text ("a", 220, 500);}
if(mouseX > 280 && mouseX<350 && mouseY<400)  { fill (#815A12); rect (280,100,70,300); text ("b", 225, 500);} 
if(mouseX > 350 && mouseX<420 && mouseY<400)  { fill (#815A12); rect (350,100,70,300); text ("c", 230, 500);}
if(mouseX > 420 && mouseX<490 && mouseY<400)  { fill (#815A12); rect (420,100,70,300); text ("g", 235, 500);}
if(mouseX > 490 && mouseX<560 && mouseY<400)  { fill (#815A12); rect (490,100,70,300); text ("d", 240, 500);}
if(mouseX > 560 && mouseX<630 && mouseY<400)  { fill (#815A12); rect (560,100,70,300); text ("a", 245, 500);}
if(mouseX > 630 && mouseX<700 && mouseY<400)  { fill (#815A12); rect (630,100,70,300); text ("c", 250, 500);}
if(mouseX > 700 && mouseX<770 && mouseY<400)  { fill (#815A12); rect (700,100,70,300); text ("f", 255, 500);}
if(mouseX > 770 && mouseX<840 && mouseY<400)  { fill (#815A12); rect (770,100,70,300); text ("e", 260, 500);}
if(mouseX > 840 && mouseX<910 && mouseY<400)  { fill (#815A12); rect (840,100,70,300); text ("g", 265, 500);}
}

void keyPressed ()
{
 if(mouseX > 105 && mouseX<175 && mouseY<400)  { fill (#815A12); rect (70,100,70,300); text ("d", 210, 500);}
}



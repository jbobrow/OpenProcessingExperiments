
//If there is like a comment button to describe it, heres what i want it to say (I wanted to put text explaining it but I ran out of time-ish)
//Move your mosue so the blue fish creature can follow the mouse. Press ' ' to change the background color and press 'u' to change the font color!

void setup ()
{
size (1000,700);
//background (#B7D3D1);
  smooth();
  textFont(createFont("SansSerif",100));
  textAlign(CENTER);
}

void draw ()
{ 
fill(#A4C6C4);
rect(0, 0, 1000, 700);
if (keyPressed) {
    if (key == ' '|| key == 'B') {
      fill(#6C6C6C);   
      rect(0,0,1000,700);
    }
  } else {
    fill(#A4C6C4);
  }
{
  pushMatrix();
  translate(mouseX-180,mouseY-250);
  fill (#000000);
  rect (140,140,20,10);
  rect (160,150,10,50);
  rect (170,170,10,10);
  rect (180,180,10,10);
  rect (190,190,10,10);
  rect (200,200,10,30);
  rect (210,190,10,10);
  rect (220,180,10,10);
  rect (230,170,20,10);
  rect (250,180,10,50);
  rect (240,230,10,20);
  rect (230,250,10,10);
  rect (220,240,10,40);
  rect (190,280,30,10);
  rect (200,270,10,10);
  rect (180,260,20,10);
  rect (170,250,10,10);
  rect (200,240,10,20);
  rect (210,230,10,10);
  rect (190,290,10,10);
  rect (170,300,20,10);
  rect (160,280,10,10);
  rect (130,290,50,10);
  rect (120,270,10,20);
  rect (110,260,10,10);
  rect (100,250,10,10);
  rect (80,240,20,10);
  rect (70,230,10,10);
  rect (80,220,10,10);
  rect (70,210,10,10);
  rect (80,200,20,10);
  rect (100,190,10,10);
  rect (110,180,10,10);
  rect (120,160,10,20);
  rect (130,150,10,10);
  rect (150,230,10,10);
  rect (110,220,10,10);
  rect (190,240,10,10);
  fill (#FFFFFF);
  rect (150,220,10,10);
  rect (110,210,10,10);
  fill (#FF8400);
  noStroke();
  rect (80,210,20,10);
  rect (90,220,10,20);
  rect (80,230,10,10);
  rect (100,240,10,10);
  fill (#000000);
  rect (110,250,10,10);  
  rect (120,260,50,10);
  fill (#FF8400);
  rect (190,230,20,10);
  rect (180,220,20,10);
  rect (170,230,20,20);
  rect (180,250,20,10);
  fill (#00BFC9);
  rect (130,160,30,30);
  rect (140,150,20,10);
  rect (110,190,40,20);
  rect (120,180,10,10);
  rect (100,200,10,40);
  rect (110,230,40,10);
  rect (120,210,30,20);
  rect (150,190,10,30);
  rect (160,200,40,20);
  rect (170,190,20,10);
  rect (170,180,10,10);
  rect (160,220,20,10);
  rect (160,230,10,10);
  rect (110,240,60,10);
  rect (130,250,40,10);
  rect (130,270,30,20);
  rect (160,270,10,10);
  rect (170,270,20,30);
  rect (170,260,10,10);
  rect (120,250,10,10);
  rect (190,270,10,10);
  rect (210,240,10,40);
  rect (200,260,10,10);
  rect (220,200,20,30);
  rect (220,230,20,10);
  rect (210,210,10,20); 
  rect (230,240,10,10);
  rect (240,190,10,40);
  rect (230,190,10,10);
  fill (#FFFFFF);
  rect (210,200,10,10);
  rect (220,190,10,10);
  rect (230,180,20,10);
  popMatrix();
}
{
fill(#3FC4BA);
text("Kipperz Party!", width/2.1, height/6);
if (keyPressed) {
    if (key == 'x' || key == 'X') {
      
      fill(#C4983F);
      text("Kipperz Party!", width/2.1, height/6);
    }
  } else {
    fill(#3FC4BA);
  }
}
}





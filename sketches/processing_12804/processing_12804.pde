

int x = 10;
int y = 20;
size(500,500);
frameRate(15);
smooth();
stroke(0);
strokeWeight(3);
background(255, 255, 255);

  
//cuerpo
fill(146, 146, 146);
ellipse(x+240,y+230,166,166); 
fill(255,255,255);
ellipse(x+240,y+230,80,80);
fill(0); 
ellipse(x+240,y+230,20,20);
  
//base de tuerca
fill(150,130,130); 
rect(x+230,y+115,20,30);
  
ellipse(x+240,y+120,40,10);
line(240,145,260,145);
line(240,155,260,155);
  
//pies
ellipse(x+190,y+300,25,25);
  ellipse(x+290,y+300,25,25);



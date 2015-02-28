
//custom - pattern02

size(500, 500);
smooth();
background(0);
 
strokeWeight(1);
stroke(300,8,29);
for (int x=- 500; x<=200+width;  x+= 100) {
  for (int y=  600; y<=400+height; y+= 20) {
    line( x^2, x+90, 18-x, 4+y);
        line( x^9, x+90, 18-x, 30+y);

    line( x^20, x+190, 18-x, 4+y);
    line( x^40, x+290, 28-x, 10+y);

  }
}

strokeWeight(1);
for (int x=- 140; x<50+width;  x+= 90) {

  }

fill(250,8,29);
ellipse(420, 103, 30,30);


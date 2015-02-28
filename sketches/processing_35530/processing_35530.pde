
void setup () {
  size(300, 300);
  colorMode (HSB, width);
 
}

int x=0;

void draw () {
  
  noStroke();
  background(0, mouseX/2, 0);//Outer Space
  fill(x/4-130, 1*x, x-98);

  ellipse(width/60, x+10, mouseX/100, height/75);//star
  ellipse(width/2, height/4, mouseX/100, 4);
  ellipse(width/3, height/8, mouseX/100, 4);
  ellipse(width/6, height/12, mouseX/100, 4);
  ellipse(width/2, height/16, mouseX/100, 4);
  ellipse(width/2, height/2, mouseX/100, 4);
  ellipse(width/4, height, mouseX/100, 12);
  ellipse(width/4, height, mouseX/100, 4);
  ellipse(width/5, height/5, mouseX/100, 5);

  ellipse(width/6, height, mouseX/100, 4);//w*h*(mouse/? controlls size of object)
  ellipse(width/3, height/3, mouseX/100, 4);
  ellipse(width/4, height/4, mouseX/100, 4);
  ellipse(width/5, height/8, mouseX/100, 4);
  ellipse(width/5, height/3, mouseX/100, 4);
  ellipse(width/6, height*7/8, mouseX/100, 4);
  ellipse(width/3, height*2/3, mouseX/100, 4);
  ellipse(width/2, height*9/10, mouseX/100, 4);

  fill(255, 1, 71);
  triangle(width/15+x/12, 110+x/12, 60+x/12, 120+x/12, 15+x/12, 115+x/12);//Star Destroyer1


  triangle(-130-x/16, 270-x/16, 150-x/16, 260-x/16, 210-x/16, 290-x/16);//SD2//+x adds movement 

  x++;

  fill(136, 1, 62);
  ellipse (width/30, height*2/3, width/6, height/6);//DS-Sphere
  fill(136, 0, 98);
  ellipse(width/25+4, width*1/2+35, width/30, height/30);//DS-dish


  fill(95*x, 74*x, 136*x);
  
  if (mousePressed == true) {
  ellipse (width*-4/10-mouseX, 200, 200, 20);//blast
  }
  
  fill(0+x/8, 74+x, 95+x/2);//x/16 affects time of change of colors

  ellipse (width*2/3, mouseX, height/2, mouseX+1/10);//Alderaan



  x++;
}



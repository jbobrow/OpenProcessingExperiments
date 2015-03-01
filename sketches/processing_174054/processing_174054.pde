
int x = 0;

void setup()

{size(500,500);}

void draw()

{if (mousePressed == true)

{
  background(#2CA5FF);  //Himmelfarbe
  
  //Gras
  
  noStroke();
  fill(#5CDE6C);
  rect(0,400,500,100);
  
  //Ball
  
  noStroke();
  fill(#DE5C9D);
  ellipse(x,350,100,100);
  x++;
  
  if (x == width) {
      x = 0;
  }
  
  //Wolke
  
  noStroke();
  fill(255);
  ellipse(50,0,150,175);
  ellipse(150,0,200,175);
  ellipse(300,25,250,175);
  ellipse(400,-20,275,200);
  }
  
  else
  
  {
    
  noStroke();
  fill(255);
  ellipse(50,0,150,175);
  ellipse(150,0,200,175);
  ellipse(300,25,250,175);
  ellipse(400,-20,275,200);
    
  }
}

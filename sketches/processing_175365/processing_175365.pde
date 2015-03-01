
int x = 0;

void setup()

{size(500,500);}

void draw()

{if (mousePressed == true)

{
  background(#2CA5FF);  //Himmelfarbe
  
  //Gras
  fill(#5CDE6C);
  textSize(40);
  text("GRAS",0,440);
  textSize(40);
  text("GRAS",130,440);
  textSize(40);
  text("GRAS",260,440);
  textSize(40);
  text("GRAS",390,440);
  
  fill(#5CDE6C);
  textSize(75);
  text("GRAS",0,475);
  fill(#5CDE6C);
  textSize(75);
  text("GRAS",150,475);
  fill(#5CDE6C);
  textSize(75);
  text("GRAS",300,475);
  
  fill(#5CDE6C);
  textSize(100);
  text("GRAS",0,490);
  fill(#5CDE6C);
  textSize(100);
  text("GRAS",245,490);
  //rect(0,400,500,100);
  
  //Ball
  String str = "BALL";
  pushMatrix();
  translate(0+x,height/2+100);
  float my_angle = map(x, 0, 50, 0, 2*PI);
  rotate(my_angle);
  fill(#DE5C9D);
  textSize(50);
  
  text(str, -textWidth(str)/2, -20, textWidth(str), 100);
  //ellipse(x, 350, 100,100);
  x++;
  popMatrix();
  
  
  if (x == width) {
      x = 0;
  }
  
  //Wolke
  
  noStroke();
  fill(255,255,255,255);
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

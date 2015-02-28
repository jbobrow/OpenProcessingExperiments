
void setup()
{
  size(300, 300);
} 
void draw()
{
  background(0);
  println("x: " + mouseX + " y: " + mouseY);
  smooth();
  fill(#FFE062,255);//beige?
  ellipse(150, 150, 300, 300);
  //triangle();
  fill(#000000);//black
  quad(150,0,300,150,150,300,0,150);
  fill(#FFE062,255);//beige?
  arc(150, 200, 150, 125, 0, PI);
  triangle(75,200,90,200,82.5,170);
  triangle(90,200,105,200,97.5,170);
  triangle(105,200,120,200,112.5,170);
  triangle(120,200,135,200,127.5,170);
  triangle(135,200,150,200,142.5,170);
  triangle(150,200,165,200,157.5,170);
  triangle(165,200,180,200,172.5,170);
  triangle(180,200,195,200,187.5,170);
  triangle(195,200,210,200,202.5,170);
  triangle(210,200,225,200,217.5,170);
  fill(#000000);//black
  ellipse(70,80,55,55);
  ellipse(230,80,55,55);
  fill(#FFE062,255);//beige?
  triangle(120,110,190,110,150,150);
  triangle(234,24,268,1,275,62);
  triangle(58,24,33,1,24,62);
  strokeWeight(2);
  line(231,116,246,168);
  point(238,141);
}




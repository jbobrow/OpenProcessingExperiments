
size (400,200);
int a = 401;
if (a <= 30)
{
  fill(100,140,0);
  ellipse(70,80,40,40);
  ellipse(110,80,40,40);
  
  ellipse(170,80,40,40);
  ellipse(210,80,40,40);
  
  ellipse(270,80,40,40);
  ellipse(310,80,40,40);
} else if (a>400){
   fill(100,140,0);
  ellipse(70,80,40,40);
  ellipse(110,80,40,40);
  fill(150,40,40);
  ellipse(90,60,20,20);
  fill(190,40,40);
  ellipse(90,50,15,15);
   fill(240,40,40);
  ellipse(90,42,10,10);
  
   fill(100,140,0);
  ellipse(170,80,40,40);
  ellipse(210,80,40,40);
  fill(150,40,40);
  ellipse(190,60,20,20);
  fill(190,40,40);
  ellipse(190,50,15,15);
     fill(240,40,40);
  ellipse(190,42,10,10);
  
   fill(100,140,0);
  ellipse(270,80,40,40);
  ellipse(310,80,40,40);
   fill(150,40,40);
  ellipse(290,60,20,20);
  fill(190,40,40);
  ellipse(290,50,15,15);
     fill(240,40,40);
  ellipse(290,42,10,10);
}

 int b= 30;
if ((b > 20) || (b<50))
{
  line (70,80,110,80);
  line (170,80,210,80);
  line (270,80,310,80); 
  line (90,80,90,150); //stems
  line (190,80,190,150);
  line (290,80,290,150);
  fill(190,150,70);
  rect (0,150,400,50);
}

println(b);
println(a);












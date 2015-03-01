
size(500,500); //canvas size
smooth();
strokeWeight(2); //(line weight)
for (int i = 20; i < 400; i += 8)
{
//line(i, 40, i + 60, 80);
ellipse(i, 100, i - 50, 100);//Part of tunnel
rect(i, 50, i -+ 50, 100);// Part of tunnel
}

{
beginShape(); // Isosceles triangle
vertex(500,400);
vertex(250,400);
vertex(200,450);
vertex(500,400);
endShape(); // end of triangle
}

int lineWidth = 5; //Width of line
int myY = 350;
strokeWeight(3); //(line weight)
while(lineWidth < 400)
{
   line((200 - .5*lineWidth), myY, (200 + .5*lineWidth), myY);
   lineWidth = lineWidth + 20; // width calulations
  myY = myY - 10;
  }
  
  smooth();
strokeWeight(8);//line weight set to 8
for (int i = 20; i< 400; i += 100) // 4 lined pyramid 
{
line(350, 400, i + 200, 300); //4 lined pyramid
println(i);

}

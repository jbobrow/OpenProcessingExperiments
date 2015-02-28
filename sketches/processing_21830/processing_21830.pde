
size (420, 690);
background(91, 103, 103);

PImage b;
b = loadImage("texture2.jpg");
image(b, 0, 0);

//SUN
//fill(255, 250, 205);
//ellipse(300, 210, 80, 80);

//BLUE PATCH
fill(39, 64, 139);
rect (0, 680, width, height);

//EARTH
line(0, 450, 100, 455);
line(100, 455, 150, 455);
line(150, 455, 155, 560);
line(155, 560, 250, 560);
line(250, 560, 255, 460);
line(255, 460, width, 465);

fill(52, 16, 16, 150);
beginShape();
vertex(0, 460);
vertex(100, 465);
vertex(150, 460);
vertex(155, 560);
vertex(250, 560);
vertex(255, 460);
vertex(width, 465);
vertex(width, 680);
vertex(0, 680);
endShape(CLOSE);

//RANDOM SQUARES IN BUILDING

for (int i=0; i<15; i++)
{
  fill(random(255), random(255), random(255), random(150));
  rect(random(0, 100), random(430, 465), random(60), random(20));
}

for (int i=0; i<30; i++)
{
  fill(random(255), random(255), random(255), random(150));
  rect(random(150, 250), random(440, 560), random(60), random(65));
}

for (int i=0; i<25; i++)
{
  fill(random(255), random(255), random(255), random(150));
  rect(random(80, 200), random(300, 460), random(60), random(70));
  if(i%10 == 0)
  triangle(random(90, 200), random(320, 440), random(90, 200), random(320, 440), random(90, 200), random(320, 440)); 
}

for (int i=0; i<10; i++)
{
  fill(random(255), random(255), random(255), random(150));
  rect(random(255, 420), random(440, 465), random(40), random(40));
}

//RANDOM SQUARES IN SUN

for (int i=0; i<15; i++)
{
  fill(random(255), random(255), random(255), random(150));
  rect(random(260, 340), random(170, 230), random(40), random(40));
}




//Gradient in the Sky
for(int i=0; i<=100; i++)
{
  int alp = 102-i;
  stroke(224, 23, 18, alp);
  line(0, i, width, i );

}


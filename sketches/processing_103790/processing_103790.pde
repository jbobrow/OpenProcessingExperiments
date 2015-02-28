
////GSwP 4.1 Reuse the Same Values and 4.2 Change Values
//
//size(480, 120);
//smooth();
//int y = height;
//int d = 10;
//ellipse(75, y, d, d);
//ellipse(175, y, d, d);
//ellipse(275, y, d, d);

////GSwP 4.3 Adjust the Size, See What Follows
//
//size(480, 600);
//smooth();
//line(0, 0, width, height);
//line(width, 0, 0, height);
//ellipse(width/2, height/2, height/2, height/2);

////GSwP 4.4 Basic Arithmetic
//
//size(480, 120);
//int x = 25;
//int h = 20;
//int y = 25;
//rect(x, y, 300, h);
//x = x + 100;
//rect(x, y + h, 300, h);
//x = x - 250;
//rect(x, y + h*2, 300, h);

//GSwP 4.5 Do the Same thing Over and Over
//Okay, so in the book it just manually does it, so
//I'm going to skip to the next example to use the for loop

//GSwP 4.6 Use a for Loop

size(480, 120);
smooth();
strokeWeight(8);
for(int i = 20; i < 400; i += 60)
{
  line(i, 40, i + 60, 80);
}

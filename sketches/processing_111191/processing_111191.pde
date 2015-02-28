
PImage kevinImage;

void setup()
{
  size(500, 500);
  kevinImage = requestImage("kevin.jpg");
}

void draw()
{
  if (kevinImage.width >0)
  
    imageMode(CENTER);
    image(kevinImage, 250, 250, width, height);
    filter(GRAY);
    
stroke(0);
strokeWeight(1);
fill(random(0, 150));
triangle(123, 225, 92, 183, 149, 170);
fill(random(0, 150), random(0, 150));
triangle(50, 164, 63, 96, 138, 94);
fill(random(0, 150), random(0, 150));
triangle(49, 168, 160, 80, 125, 180);
fill(random(0, 150), random(0, 150));
triangle(58, 93, 96, 40, 145, 92);
fill(random(0, 150), random(0, 150));
triangle(95, 35, 200, 39, 148, 90);
fill(random(0, 150), random(0, 150));
triangle(115, 33, 165, 0, 200, 37);
fill(random(0, 150), random(0, 150));
triangle(160, 81, 245, 0, 268, 88);
fill(random(0, 150), random(0, 150));
triangle(108, 2, 198, 39, 250, 1);


    
fill(random(0, 100), random(0, 100), random(0, 100));
strokeWeight(5);
stroke(0);
ellipse(276, 198, 60, 60);

fill(108, 103, 103);
stroke(0);
strokeWeight(1);
triangle(240, 190, 216, 265, 290, 239);

fill(random(0, 100), random(0, 100), random(0, 100));
strokeWeight(4);
stroke(1);
ellipse(210, 190, 75, 78);

strokeWeight(6);
stroke(0);
line(90, 163, 178, 170);

strokeWeight(4);
stroke(0);
line(218, 150, 265, 167);

float x1 = 235;
float y1 = 250;
float prevX1 = x1;
float prevY1 = y1;
strokeWeight (3);
stroke(36, 22, 245);
while (x1 < 500)
{
  x1+= 5;
  y1+= random(-15, 15);
  line(prevX1, prevY1, x1, y1);
  prevX1 = x1;
  prevY1 = y1;
  noise(200, 200);
  
}
}





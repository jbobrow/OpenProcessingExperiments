
//Pedro Veneziano, March 12th, Creative Computing B, Benjamin Bacon

size(700,700);
smooth();
strokeWeight(5);
background(150,214,255);

color from = color(255, 49, 73);
color to = color(255, 249, 87);
float mult = 0;
int width1 = 40;

for(int position1y = 200; position1y <= 500; position1y += 50) {
  for(int position1x = 200; position1x <= 500; position1x += 50) {
    fill(lerpColor(from, to, mult));
    ellipse(position1x, position1y, width1, width1);
  }
  width1 = width1 - 4;
  mult = mult + 0.15;
}




/*Felix Anderson
Creative Computing
Benjamin Bacon
3/12/14*/


size(653,687);
strokeWeight(3);
background(250);
 
 
color from = color(100, 300, 20);
color to = color(300, 100, 20);
float enhance = 0;
int code1 = 35;

for(int position1x = 50; position1x <= 600; position1x += 45) {
  for(int position1y = 50; position1y <= 600; position1y += 45) {
    fill(lerpColor(from, to, enhance));
    rect(position1x, position1y, code1, code1);

  }

      code1 = code1 - 2;
  enhance = enhance + 0.27;

  }
 





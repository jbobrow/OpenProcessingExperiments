
size(700, 400);
background(255);
int maxCircleNum = 200 ;
for (int circle_num = 0; circle_num < maxCircleNum; circle_num += 1) {
  fill(circle_num, 0, 200-circle_num);
  ellipse(random(width),random(height), 40, 40);
}


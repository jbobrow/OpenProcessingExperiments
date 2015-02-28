
size(250, 250);
background(0);
smooth();

//blue, green circles
noStroke();
for(int y = 0; y <= height; y += 40)
  {for(int x = 0; x <= width; x += 40)
    {fill(70, 88, x +=5);
    ellipse(x, y, 40, 40);}}

//smaller, yellow dots
noStroke();
for(int y = 0; y <= height; y +=10){
  for(int x = 0; x <= width; x +=10){
    fill(#F6FF03, 40);
    ellipse(x, y, 10, 10);
  }
}

stroke(255, 130);
for(int x = 0; x <= width; x += 30){
  for(int y = 0; y <= height; y += 30){
    line(x, y, width, height);
  }
}

//for(int i = 0; i <= 250; i += 4){
  //stroke(255);
  //line(i, i, i*2, 240);
//}

  




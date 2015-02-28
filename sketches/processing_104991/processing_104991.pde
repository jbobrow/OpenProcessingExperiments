
void setup() {
  size(425, 425);
  colorMode(RGB, 255);
  noStroke();
}
void draw() {
  int flag=1;
  for (int i=0;i<width;i+=25)
    for (int j=0;j<height;j+=25)
    {
      if (flag>0)
      {
        fill(171, 220, 0);
        flag*=-1;
        rect(i, j, 25, 25);
      }
      else {
        fill(66, 189, 136);
        flag*=-1;
        rect(i, j, 25, 25);
      }
    }
  for (int i=25;i<width;)
    for (int j=25;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=50;i<width-25;)
    for (int j=25;j<height-25;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=75;i<width-25;)
    for (int j=25;j<height-50;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=100;i<width;)
    for (int j=25;j<height-75;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=125;i<width-25;)
    for (int j=25;j<height-100;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=150;i<width;)
    for (int j=25;j<height-125;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=175;i<width;)
    for (int j=25;j<height-150;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=200;i<width;)
    for (int j=25;j<height-175;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=225;i<width;)
    for (int j=25;j<height-200;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=250;i<width;)
    for (int j=25;j<height-225;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=275;i<width;)
    for (int j=25;j<height-250;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=300;i<width;)
    for (int j=25;j<height-275;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=325;i<width;)
    for (int j=25;j<height-300;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
  for (int i=350;i<width;)
    for (int j=25;j<height-325;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=375;i<width;)
    for (int j=25;j<height-350;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
  for (int i=400;i<width;)
    for (int j=25;j<height-375;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
    for (int i=25;i<width-25;)
    for (int j=50;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
    for (int i=25;i<width-50;)
    for (int j=75;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
        for (int i=25;i<width-75;)
    for (int j=100;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
        for (int i=25;i<width-100;)
    for (int j=125;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
            for (int i=25;i<width-125;)
    for (int j=150;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
            for (int i=25;i<width-150;)
    for (int j=175;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
            for (int i=25;i<width-175;)
    for (int j=200;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
                for (int i=25;i<width-200;)
    for (int j=225;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
                for (int i=25;i<width-225;)
    for (int j=250;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
                    for (int i=25;i<width-250;)
    for (int j=275;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
                    for (int i=25;i<width-275;)
    for (int j=300;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
                    for (int i=25;i<width-300;)
    for (int j=325;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
                        for (int i=25;i<width-325;)
    for (int j=350;j<height;)
    {
      flower(i, j, 215, 254, 205);
      i+=25;
      j+=25;
    }
                        for (int i=25;i<width-350;)
    for (int j=375;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
                        for (int i=25;i<width-375;)
    for (int j=400;j<height;)
    {
      flower(i, j, 171, 82, 119);
      i+=25;
      j+=25;
    }
}
void flower(int x, int y, int a, int b, int c) {
  fill(a, b, c);
  ellipse(x, y-3, 3, 5);
  ellipse(x, y+3, 3, 5);
  ellipse(x-3, y, 5, 3);
  ellipse(x+3, y, 5, 3);
}

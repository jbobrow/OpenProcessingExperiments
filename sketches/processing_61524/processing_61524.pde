
void setup()
{
  size(500, 500);
  background(255);

  for(int i = 0; i < 5; i ++)
  {
    for(int j = 0; j < 5; j ++)
    {
      face(50 + 100*i, 50 + 100*j);
    }
  }
}

// 얼굴의 중심 좌표를 파라미터로 넘김
void face(int a, int b)
{
  fill(255, 217, 167);
  ellipse(a, b, 100, 100); // 얼굴 형

  fill(255);
  ellipse(a-20, b-15, 20, 20);
  ellipse(a+20, b-15, 20, 20);
  fill(0);
  ellipse(a-22, b-17, 7, 7);
  ellipse(a+22, b-17, 7, 7); // 눈

  noFill();
  arc(a, b + 20, 30, 30, PI, TWO_PI);  // 입
}



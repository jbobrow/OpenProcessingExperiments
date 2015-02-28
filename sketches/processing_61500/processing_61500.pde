
void setup()
{
  size(300, 300);

  faceDrawing(50, 50);
  faceDrawing(150, 50);
}

// 얼굴의 중심 좌표를 파라미터로 넘김
void faceDrawing(int a, int b)
{
    fill(255);
    ellipse(a, b, 100, 100); // 얼굴 형
    
    fill(0);
    ellipse(a-20, b-30, 5, 5);
    ellipse(a+20, b-30, 5, 5); // 눈
    
    noFill();
    arc(a, b, 30, 30, 0, PI);  // 입
}

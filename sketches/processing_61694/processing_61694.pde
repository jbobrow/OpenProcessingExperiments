
int leftEyeX, leftEyeY;
int rightEyeX, rightEyeY;

void setup()
{
  size(300, 300);
  smooth();
}

void draw()
{
  int i, j;
  background(0);

  for (i=0; i<3; i++)
  {
    for (j=0; j<3; j++)
    {
      faceDrawing(i*width/3+width/6, j*height/3+height/6);
    }
  }
}

// 얼굴의 중심 좌표를 파라미터로 넘김
void faceDrawing(int a, int b)
{
  leftEyeX = (mouseX - (a-20))/30;
  leftEyeY = (mouseY - (b-20))/30;
  rightEyeX = (mouseX - (a+20))/30;
  rightEyeY = (mouseY - (b-20))/30;

  fill(255);
  ellipse(a, b, 100, 100); // 얼굴 형

  if (dist(mouseX, mouseY, a, b)<50) fill(255, 0, 0);
  else noFill();
  arc(a, b+10, 30, 30, 0, PI);  // 입

  fill(0);
  ellipse((a-20) + leftEyeX, (b-20) + leftEyeY, 5, 5);
  ellipse((a+20) + rightEyeX, (b-20) + rightEyeY, 5, 5);
}

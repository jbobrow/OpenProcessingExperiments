
int a, b;
 

void setup()
{
  size(300, 300);

}


void draw()
{
  if (dist(mouseX, mouseY, 150, 150)<50) 
  {
    faceDrawingA(150, 150);
  }
    else  faceDrawingB(150, 150);
}


// 얼굴의 중심 좌표를 파라미터로 넘김
void faceDrawingA(int a,  int b)
{
  fill(0, 255, 0);
  ellipse(a, b, 100, 100); // 얼굴 형

  fill(0);
  ellipse(a-20, b-20, 5, 5);
  ellipse(a+20, b-20, 5, 5); // 눈

  line(a-25, b-28, a-15, b-23);
  line(a+15, b-23, a+25, b-28);//눈썹

  noFill();
  arc(a, b+20, 30, 30, PI, 2*PI);  // 입
}

void faceDrawingB(int a, int b)
{
  fill(232, 206, 206);
  ellipse(a, b, 100, 100);// 얼굴 형

  fill(0);
  ellipse(a-20, b-20, 5, 5);
  ellipse(a+20, b-20, 5, 5); // 눈
  
  noFill();
  arc(a, b+20, 30, 30, 0, PI);  // 입
}

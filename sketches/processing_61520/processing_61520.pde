
void setup()
{
  size(300, 300);
noStroke();
smooth();
  faceDrawing(60, 60);
  faceDrawing(200, 100);
  faceDrawing(150, 230);
}

// 얼굴의 중심 좌표를 파라미터로 넘김
void faceDrawing(int a, int b)
{
  fill(234, 226, 178
    );
    
  ellipse(a, b, 100, 120); // 얼굴
  fill(255);
ellipse(a-30, b-20, 50, 50);
  ellipse(a, b-15, 50, 50); // 눈
 {

   fill(0);
  ellipse(a-30, b-20, 20, 20);
  fill(0);
  ellipse(a-5, b-15, 20, 20);
  
 }
  
  
 
 
  fill(255,121,121);
  triangle(a-40,b+20,a+20,b+25,a-20,b+50);
}



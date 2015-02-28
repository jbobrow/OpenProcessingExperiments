
void setup()
{
  size(300, 300);
  background(240,237,194);

  faceDrawing(width/2, height/2);
 
}

// 얼굴의 중심 좌표를 파라미터로 넘김
void faceDrawing(int a, int b)
{   
    smooth();
    stroke(0);
    fill(244,176,132);
    rect(a-30,b-50,60,100);//얼굴형
    fill(120,54,11);
    triangle(a-30,b-50,a-20,b-50,a-30,b-10);//머리카락
    triangle(a+30,b-50,a+20,b-50,a+30,b-10);
    triangle(a,b-50,a-20,b-50,a-10,b-10);
    triangle(a,b-50,a+20,b-50,a+10,b-10);
    
    fill(0);
    ellipse(a-12,b,5,5);//눈
    ellipse(a+12,b,5,5);
    
    noStroke();
    fill(255,0,0);
    arc(a, b+20, 30, 30, 0, PI);//입
    
}

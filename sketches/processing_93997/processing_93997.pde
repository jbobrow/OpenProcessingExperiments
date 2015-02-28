
//width/2-70같이 쓰는건 존나 비효율적 so
float faceX;
float faceY;

void setup(){
  size(600,800);
}
void draw(){
faceX = width/2;
faceY = height/2;
  //종이를 faceX,faceY로 옮기는것 여기서 translatef를 다시쓰면 faceX,faceY가 기준이 되어 옮겨지기 때문에 주의
  translate(faceX, faceY);
  //참고 http://www.processing.org/learning/transform2d/ 
//scale= 스케일뒤에오는 모든 그림의 크기배율조정
scale( 0.5, 0.5);
//second = 지금의 초를 나타낸다
print(second());
ellipse(0,0, 300, 300);
faceX = faceX+random(-3,3);
faceY = faceY+random(-3,3);
line (0,0 , 0, 10);

}

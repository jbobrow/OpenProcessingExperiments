
void setup(){
  size(245,395);
} 

int x=250%100;
int y=400%100;

void draw(){
for(int a = 0; a<250; a = a+10){
 for(int b = 0; b<400; b = b+15){
point(a,a);
point(b,b);
line(100,b,250, b);
line(a-300,mouseY,mouseX,b);
line(a, x, y, a);
line(y, a, x, a);
line(a, y, x, a);
line(x, a, a, y);
line(y, y, y, y);
line(a, x, x, a);
line(y, x, x, y);
line(y, a, a, y);
line(a, y, y, a);
line(a, -x, a, -y);
line(a, a, a, a);
line(a+200, x+200, y+200, a+200);
line(y+200, a+200, x, a);
line(a+200, y+200, x, a);
line(x, a+200, a, y);
line(y, y+200, y, y);
line(a+200, x+200, x, a+200);
line(y+200, x+200, x, y);
line(y, a+300, a, y);
line(a+300, y+300, y, a);
line(a*-10, x+400, sin(y)*100, x);
ellipse(a,a/2,x*10,y*10);
ellipse(a,a*2,x*10,y*10);
ellipse(a+200,a*2+200,x*10,y*10);
ellipse(a, x, y, a);
}
}
}

//선이랑 일부 원과 점을 겹쳐서 약간은(?) 복잡한 모임을 만들어 봤습니다. ㅎㅎ
//시험 기간 중의 제 정신상태를 표현해봤어요.ㅍㅅㅍ      
// 좀 느리죠;;;                         

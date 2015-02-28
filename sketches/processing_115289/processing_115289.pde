
PImage[] img = new PImage[21]; // 20칸의 이미지를 넣을 공간을 만듬
//int i;
int copy = 50;
float a;
void setup() {
  size(1000,700);
  background(237);
  
  for(int i = 0; i < 20; i ++) {
    
    img[i] = loadImage( i + ".png");
    println(i);
  }// i를 0으로 시작하고 이아이가 20보다 작으면 ++해준다
   // int ( 수 정의 ), 조건에 맞나 test ( <20 ), 실행    
  
}

void draw() {
  float r = random(0,1000);
  println(r);
  
image ( img[9],300,100 );  
for (int i = 0; i < 20; i ++) {
image ( img[i], copy*i,100); //이게 이미지 부른거 

image( img[7], mouseX,mouseY,150,150);
image ( img[13], random(0,100), random(0,1000) );
rotate(a);




}
}
void keyPressed() {
  saveFrame("_####.png"); // 그냥 save("name.png")면 한번 이건 프레임별로 키 누를 때마다 저장됨
} // 아무키나누르면 해당 이름으로 저장됨










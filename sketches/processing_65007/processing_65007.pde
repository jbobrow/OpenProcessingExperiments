
int stW; // 선 굵기
int stW_min = 1; // 최소 선 굵기
int stW_max = 50; // 최대 선 굵기

color stC; // 선 색

int btnR_x = 20; // 사각형 버튼 x 위치
int btnR_y = 20; // 사각형 버튼 y 위치
int btnR_w = 20; // 사각형 버튼 너비
int btnR_h = 20; // 사각형 버튼 높이

int btnE_x = 60; // 원 버튼 x 위치
int btnE_y = 30; // 원 버튼 y 위치
int btnE_r = 10; // 원 버튼 반지름

void setup(){
  size(600,600);
  background(255);
  smooth();
  //stW = 10;
  // 현재는 없어도 무방하지만,
  // 만약 선굵기의 최소,최대값을 적용하지 않고
  // 선 굵기를 균일하게 사용할 경우 setup에서 초기값을 저렇게 지정해줘야함!
  
  stC = color(0); 
}

void draw(){
  
  // 사각형 버튼
  if(mouseX >= btnR_x && mouseX <= btnR_x+btnR_w && mouseY >= btnR_y && mouseY <= btnR_y+btnR_h){
    fill(100, 255, 0);
    if(mousePressed){
      fill(0,100,255);
      if(stW_max > stW_min){
        stW_max--;
      }
    }
  }else{
      fill(255,0,100);
  }  
  noStroke();
  rect(btnR_x, btnR_y, btnR_w, btnR_h);

  // 원형 버튼
  float d = dist(btnE_x, btnE_y, mouseX, mouseY);
    if(d <= btnE_r){
    fill(100, 255, 0);
    if(mousePressed){
      fill(0,100,255);
      if(stW_max < 100){
        stW_max++;
      }
    }
  }else{
      fill(255,0,100);
  }
  ellipse(btnE_x, btnE_y, btnE_r*2, btnE_r*2);
  
  // 속도에 따라 선 두께 변화
  float speed = dist(pmouseX,pmouseY,mouseX,mouseY);
  stW = int(map(speed, 0, 200, stW_min, stW_max));
  
  // 그리기
  if(mousePressed){
    if(mouseButton == LEFT){
      stroke(stC);
      strokeWeight(stW);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }else if(mouseButton == RIGHT){
      background(255);
      
      rect(btnR_x,btnR_y,btnR_w,btnR_h);
      ellipse(btnE_x, btnE_y, btnE_r*2, btnE_r*2);
    }
  }
}

void keyPressed(){
  if(key == 'r' || key == 'R') stC = color(255,0,0);
  if(key == 'g' || key == 'G') stC = color(0,255,0);
  if(key == 'b' || key == 'B') stC = color(0,0,255);
  if(key == 'c' || key == 'C') stC = color(0,255,255);
  if(key == 'm' || key == 'M') stC = color(255,0,255);
  if(key == 'y' || key == 'Y') stC = color(255,255,0);
  if(key == 'k' || key == 'K') stC = color(0);
  if(key == 'w' || key == 'W') stC = color(255);
}     

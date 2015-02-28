
int stW;

int btnR_x = 20; // 사각형 버튼 x 위치
int btnR_y = 20; // 사각형 버튼 y 위치
int btnR_w = 20; // 사각형 버튼의 너비
int btnR_h = 20; // 사각형 버튼의 높이

int btnE_x = 80; // 원 버튼 x 위치
int btnE_y = 30; // 원 버튼 y 위치
int btnE_r = 10; // 원 버튼 반지름

void setup() {
  size(600, 600);
  background(255);
  smooth();
  stW = 10;
}

void draw() {

//----- 사각형 버튼
  if (mouseX >= btnR_x && mouseX <= btnR_x+btnR_w && mouseY >= btnR_y && mouseY <= btnR_y+btnR_h) { // 조건 1-1. 마우스의 x 위치가 사각형의 x위치보다 크거나 같고 1-2. 사각형의 x위치와 너비를 합한 것보다는 작거나 같으면서 1-3. 마우스 y위치가 사각형의 y위치보다는 크거나 같고 1-4. 사각형의 y위치와 높이를 합한 것보다는 작거나 같을 때 (즉, 마우스가 사각형 안에 있을 때)
    fill(100, 255, 0); // 도형을 연두색으로 칠한다. (Roll-over)
    if (mousePressed) { // 조건 2. 조건 1을 충족한 상태에서 마우스가 눌리면
      fill(0, 100, 255); // 도형을 파랑색으로 칠한다. (Click)
      if (stW > 1) { // 조건 3. 현재 선의 굵기가 1보다 큰 상태면
        stW--; // 선의 굵기를 1씩 줄인다.
      } // 조건 3 닫음
    } // 조건 2 닫음
  } else { // 조건 1이 충족되지 않을 때엔 (=마우스가 올려져 있지 않을 땐)
    fill(255, 0, 100); // 도형을 분홍색으로 칠한다. (즉 버튼의 기본색이 됨)
  }  
  rect(btnR_x, btnR_y, btnR_w, btnR_h); // 사각형 버튼을 그림. rect(x,y,w,h)

//----- 원형 버튼
  float d = dist(btnE_x, btnE_y, mouseX, mouseY); // 원형버튼의 범위를 검사하기 위해 임시로 d라는 float 변수를 하나 생성함
                                                  // 원의 중심(btnE_x,btnE_y)에서 마우스까지의 거리를 구함
  if (d <= btnE_r) { // 조건 1. 원의 중심-마우스의 거리가 원의 반지름(btnE_r)보다 작거나 같으면
    fill(100, 255, 0); // 연두색으로 칠한다
    if (mousePressed) { // 조건 2. 마우스가 눌리면
      fill(0, 100, 255); // 파란색으로 칠한다
      if (stW < 50) { // 조건 3. 선이 50보다 작을 때 (선이 너무 굵어지는 걸 방지하기 위해 임의로 50이란 숫자를 지정)
        stW++; // 선의 굵기를 1씩 늘린다.
      } // 조건 3 닫음
    } // 조건 2 닫음
  } // 조건 1 닫음
  else { // 조건 1이 충족되지 않을 때
    fill(255, 0, 100); // 분홍색으로 칠한다.
  }
  ellipse(btnE_x, btnE_y, btnE_r*2, btnE_r*2); // 원형 버튼을 그림 ellipse(x,y,r*2,r*2)
                                              // 매개변수에는 원의 지름을 넣어야하니까 반지름값을 2곱해준다.
  
//----- 그리기
  if (mousePressed) {
    if (mouseButton == LEFT) {
      strokeWeight(stW);
      line(pmouseX, pmouseY, mouseX, mouseY);
    } 
    else if (mouseButton == RIGHT) {
      background(255);
      //---화면을 지우는순간 버튼이 깜빡거리는 것을 방지하기 위해 사각형, 원형 버튼을 한번 더 그려줌
      rect(btnR_x, btnR_y, btnR_w, btnR_h);
      ellipse(btnE_x, btnE_y, btnE_r*2, btnE_r*2);      
    }
  }
}

void keyPressed() { 
  if (key == 'r' || key == 'R') stroke(255, 0, 0);
  if (key == 'g' || key == 'G') stroke(0, 255, 0);
  if (key == 'b' || key == 'B') stroke(0, 0, 255);
  if (key == 'c' || key == 'C') stroke(0, 255, 255);
  if (key == 'm' || key == 'M') stroke(255, 0, 255);
  if (key == 'y' || key == 'Y') stroke(255, 255, 0);
  if (key == 'k' || key == 'K') stroke(0);
  if (key == 'w' || key == 'W') stroke(255);
}

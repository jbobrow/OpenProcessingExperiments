
int stW; // 선 굵기로 사용할 int타입 변수 stW를 선언함.

void setup() {
  size(600, 600); // 캔버스 사이즈를 600*600으로 지정한다.
  background(255); // 배경을 흰색으로 지정한다.
  smooth(); // 도형의 외곽을 부드럽게 처리한다. (anti-aliasing)

  stW = 10; // 선 굵기의 초기값을 10으로 지정한다.
}

void draw() {
  if (mousePressed) { // 조건 1. 마우스가 눌려 있을 때
    if (mouseButton == LEFT) { // 조건 2-1. 마우스 버튼이 왼쪽일 때
      strokeWeight(stW);       // 변수 stW의 값으로 선 굵기를 지정한다. (void setup에서 10으로 지정했기 때문에 초기값은 10)
      line(pmouseX, pmouseY, mouseX, mouseY); // 마우스의 직전 x,y위치에서 마우스의 현재 x,y위치까지 선을 그린다.
    } else if (mouseButton == RIGHT) { // 조건 2-2. 마우스 버튼이 오른쪽일 때
      background(255); // 배경색을 다시 깔아서 화면을 지운다.
    }
  }
}

void keyPressed() { // 키보드를 누를때 (이벤트 keyPressed)
  if (key == 'r' || key == 'R') stroke(255, 0, 0); // r키를 누르면 선의 색을 red로 바꾼다.
                                                   // 키보드 반응시 대소문자를 구분하기 때문에 보통은 이런식으로 ||(or)를 사용하여 소문자, 대문자를 각각 모두 조건으로 지정해준다.)
  if (key == 'g' || key == 'G') stroke(0, 255, 0); // 이하는 모두 윗 줄 코드와 동일한 원리 // g를 누르면 green으로 ...
  if (key == 'b' || key == 'B') stroke(0, 0, 255);
  if (key == 'c' || key == 'C') stroke(0, 255, 255);
  if (key == 'm' || key == 'M') stroke(255, 0, 255);
  if (key == 'y' || key == 'Y') stroke(255, 255, 0);
  if (key == 'k' || key == 'K') stroke(0);
  if (key == 'w' || key == 'W') stroke(255);
}

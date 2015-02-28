
// 계속적 사용 변수.
    int bgCol = 0xffffffff;

    // 2번 예제 변수.
    float ballX, ballY;// 공 좌표.
    int ballRad = 10;// 공 반지름.
    float ballVX, ballVY;// 공 속도.
    int ballFillCol = 0xff000000;// 공 색상.
    float mX, mY;// 임시 마우스 좌표.
    int strokeCol = 0xffff0000;// 공 선 색상.
    float trgBuff = 0.1f;// 속도:거리 비율.

    void setup() {
        size(500, 500);
        smooth();
        // 함수화된 초기화.
        trigger(random(ballRad, width - ballRad),
                random(ballRad, height - ballRad), 10, radians(random(360)));
    }

    // 함수화된 초기화.
    void trigger(float x, float y, float speed, float angle) {
        ballX = x;
        ballY = y;
        ballVX = speed * cos(angle);
        ballVY = speed * sin(angle);
    }

    // 함수화된 공 좌표 업데이트.
    void posUpdate() {
        ballX += ballVX;
        ballY += ballVY;
    }

    // 함수화된 반사.
    void reflect() {
        if (ballX < ballRad || ballX > width - 1 - ballRad) {
            ballVX *= -1;
            if (ballX < ballRad) {
                // 정확한 반사좌표는 아니다.
                ballX = ballRad;
            } else {
                // 정확한 반사좌표는 아니다.
                ballX = width - 1 - ballRad;
            }
        }
        if (ballY < ballRad || ballY > height - 1 - ballRad) {
            ballVY *= -1;
            if (ballY < ballRad) {
                // 정확한 반사좌표는 아니다.
                ballY = ballRad;
            } else {
                // 정확한 반사좌표는 아니다.
                ballY = height - 1 - ballRad;
            }
        }
    }

    void draw() {
        // 함수화되어 간결해진 것을 볼 수 있다.
        posUpdate();
        reflect();
        // 렌더링.
        background(bgCol);
        noStroke();
        fill(ballFillCol);
        ellipse(ballX, ballY, ballRad * 2, ballRad * 2);
        // 마우스 프레스 조건에서 보여지는 선.
        if (mousePressed) {
            stroke(strokeCol);
            line(mX, mY, mouseX, mouseY);
        }
    }

    // 마우스 프레스 이벤트 시 마우스 좌표를 저장.
    void mousePressed() {
        mX = mouseX;
        mY = mouseY;
    }

    //이전에 저장된 마우스 좌표로부터 마우스 릴리스 이벤트 시의 마우스 좌표로 공을 발사.
    void mouseReleased() {
        float dist = dist(mX, mY, mouseX, mouseY);
        float angle = atan2(mouseY - mY, mouseX - mX);
        //함수화되어 간결해진 것을 볼 수 있다.
        trigger(mX, mY, trgBuff * dist, angle);
    }

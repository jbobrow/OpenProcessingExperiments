
    // 계속적 사용 변수.
    int bgCol = 0xffffffff;

    // 1번 예제 변수
    float ballX, ballY;// 공 좌표.
    int ballRad = 10;// 공 반지름.
    float ballVX, ballVY;// 공 속도.
    int ballCol = 0xff000000;// 공 색상.

    public void setup() {
        size(500, 500);
        smooth();
        noStroke();
        ballX = random(ballRad, width - ballRad);
        ballY = random(ballRad, height - ballRad);
        // 속력과 방향;각도를 이용해 속도 구하기.
        int speed = 10;
        float angle = random(360);
        ballVX = speed * cos(radians(angle));
        ballVY = speed * sin(radians(angle));
    }

    public void draw() {
        // 공 좌표 업데이트;과거좌표+속도.
        ballX += ballVX;
        ballY += ballVY;
        // 공좌표가 벽을 벗어날 경우 반사.
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
        // 렌더링.
        background(bgCol);
        fill(ballCol);
        ellipse(ballX, ballY, ballRad * 2, ballRad * 2);
    }

    public void mousePressed() {
        // 마우스 클릭하면 임의의 좌표에서 기존 속력, 무작위 방향의 속도로 운동.
        ballX = random(ballRad, width - ballRad);
        ballY = random(ballRad, height - ballRad);
        int speed = 10;
        float angle = random(360);
        ballVX = speed * cos(radians(angle));
        ballVY = speed * sin(radians(angle));
    }

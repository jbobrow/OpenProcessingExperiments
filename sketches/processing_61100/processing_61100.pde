
// 계속적 사용 변수.
    int screenW = 500, screenH = 500;
    int bgCol = 0xffffffff;

    // 3. 함수 사용, 클래스 미사용, 여러 개의 공 튀기기.
    int ballNum = 10;
    int ballX[], ballY[];
    int ballRad = 10;
    int ballVX[], ballVY[];
    int ballFillCol = 0xff000000;
    int selectedBallFillCol = 0xff00ff00;

    int selectedBallIdx;
    int mX, mY;
    int strokeCol = 0xffff0000;

    public void setup() {
        size(500, 500);
        smooth();
        ballX = new int[ballNum];
        ballY = new int[ballNum];
        ballVX = new int[ballNum];
        ballVY = new int[ballNum];
        selectedBallIdx = -1;
        for (int i = 0; i < ballNum; i++) {
            trigger(i, (int) random(ballRad, width - ballRad),
                    (int) random(ballRad, height - ballRad), 2,
                    radians(random(360)));
        }
    }

    public void trigger(int idx, int x, int y, float speed, float angle) {
        ballX[idx] = x;
        ballY[idx] = y;
        ballVX[idx] = (int) (speed * cos(angle));
        ballVY[idx] = (int) (speed * sin(angle));
    }

    public void posUpdate(int idx) {
        ballX[idx] += ballVX[idx];
        ballY[idx] += ballVY[idx];
    }

    public void reflect(int idx) {
        if (ballX[idx] < ballRad || ballX[idx] > width - 1 - ballRad) {
            ballVX[idx] *= -1;
            if (ballX[idx] < ballRad) {
                // 정확한 반사좌표는 아니다.
                ballX[idx] = ballRad;
            } else {
                // 정확한 반사좌표는 아니다.
                ballX[idx] = width - 1 - ballRad;
            }
        }
        if (ballY[idx] < ballRad || ballY[idx] > height - 1 - ballRad) {
            ballVY[idx] *= -1;
            if (ballY[idx] < ballRad) {
                // 정확한 반사좌표는 아니다.
                ballY[idx] = ballRad;
            } else {
                // 정확한 반사좌표는 아니다.
                ballY[idx] = height - 1 - ballRad;
            }
        }
    }

    public int getSelectedBallIdx(int mX, int mY) {
        for (int i = 0; i < ballNum; i++) {
            float dist = dist(ballX[i], ballY[i], mX, mY);
            if (dist <= ballRad) {
                return i;
            }
        }
        // 아무것도 선택되지 않으면-1을 리턴한다.
        return -1;
    }

    public void draw() {
        for (int i = 0; i < ballNum; i++) {
            if (selectedBallIdx != i) {
                posUpdate(i);
            }
            reflect(i);
        }
        background(bgCol);
        noStroke();
        for (int i = 0; i < ballNum; i++) {
            if (selectedBallIdx == i) {
                fill(selectedBallFillCol);
            } else {
                fill(ballFillCol);
            }
            ellipse(ballX[i], ballY[i], ballRad * 2, ballRad * 2);
        }
        if (selectedBallIdx >= 0 && mousePressed) {
            stroke(strokeCol);
            line(mX, mY, mouseX, mouseY);
        }
    }

    public void mousePressed() {
        if (selectedBallIdx < 0) {
            selectedBallIdx = getSelectedBallIdx(mouseX, mouseY);
            if (selectedBallIdx >= 0) {
                mX = ballX[selectedBallIdx];
                mY = ballY[selectedBallIdx];
            }
        }
    }

    public void mouseReleased() {
        if (selectedBallIdx >= 0) {
            float dist = dist(mX, mY, mouseX, mouseY);
            float angle = atan2(mouseY - mY, mouseX - mX);
            trigger(selectedBallIdx, mX, mY, 0.1f * dist, angle);
            selectedBallIdx = -1;
        }
    }

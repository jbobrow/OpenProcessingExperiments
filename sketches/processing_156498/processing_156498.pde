
float r, R;
int numBalls = 11;
float step;
Ball balls[] = new Ball[numBalls];
float alpha = 0;


void setup() {
    size(400,400);
    background(0);

    //noStroke();
    strokeWeight(4);

    step = TWO_PI / numBalls / 2;
    smooth(8);

    R = (width/2) * 0.5;

    for (int i = 0; i < numBalls; ++i) {
        balls[i] = new Ball(R*cos(step*i*2),R*sin(step*i*2), i*numStep,numPeriod);
        balls[i].setTarget(R*cos(step*i*2+PI),R*sin(step*i*2+PI));
    }

}



int numFrames = 200;
int numTrans = 50;
int numStep = numFrames / (numBalls);
int numPeriod = numBalls*numStep + numFrames;
float valpha = TWO_PI / 2000;

void draw() {

    background(255);
    

    translate(width/2, height/2);
    rotate(alpha);

    for (Ball b : balls) {
    
        b.draw();
        b.move();
    }

    alpha += valpha;
}

class Ball {
    float x,y;
    float tx,ty;    // target x,y
    float px,py;    // previous x,y
    boolean moving = false;
    int period = 200;
    int waitingCnt;
    boolean waiting = true;
    int frameCount;
    int frameCountAcc;
    float r;
    float step;

    Ball(float x,float y,int waiting,int period) {
        this.x = x;
        this.y = y;
        this.r = 16;
        this.frameCount = 0;
        this.waitingCnt = waiting;
        this.frameCountAcc = 0;
        this.period = period;
    }

    void setTarget(float tx,float ty) {
        this.tx = tx;
        this.ty = ty;
        this.px = this.x;
        this.py = this.y;
        //this.moving = true;
        //this.frmCnt = 0;
    }

    void move() {


        if (this.waiting && this.frameCount >= waitingCnt) {
            this.moving = true;
            this.waiting = false;
            this.frameCount = 0;
        }

        if(moving) {
            float t = this.frameCount/float(numTrans);
            float tt = 3*t*t - 2*t*t*t;
            this.x = lerp(this.px, this.tx, tt);
            this.y = lerp(this.py, this.ty, tt);
            if(tt == 1.0) { moving = false; this.frameCount=0; }
        }

        if(!this.moving && !this.waiting && (frameCountAcc >= period)) {
            this.frameCount = 0;
            this.frameCountAcc = 0;
            this.waiting = true;
            this.setTarget(this.px, this.py);
        }
        this.frameCount++;
        this.frameCountAcc++;
    }

    void draw() {
        ellipse(this.x, this.y, r, r);
    }
}

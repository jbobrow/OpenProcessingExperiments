
Paddle p1, p2;
Ball ball;
int score = 0;

void setup(){
    size(600,400);
    background(0);
    p1      = new Paddle(0, height/2, 10, 100);
    p2      = new Paddle(width-10, height/2, 10, 100);
    ball    = new Ball(width/8,height/8,20,20);
    noCursor();
}

void draw(){
    background(0);
    textSize(14);
    text(score,width/2,height/2);

    p1.display();
    p2.display();

    p1.move();
    p2.move();

    ball.display();
    ball.move();
}

//CREATE OBJECTS//

class Paddle{
    float paddleX;
    float paddleY;
    float paddleW;
    float paddleH;

    Paddle(float tempx,float tempy,float tempw,float temph){
        paddleX = tempx;
        paddleY = tempy;
        paddleH = temph;
        paddleW = tempw;
    }

    void move(){
        paddleY=mouseY-paddleH/2;
    }

    void display(){
        rectMode(CORNER);
        fill(255);
        rect(paddleX,paddleY,paddleW,paddleH);
    }
}

class Ball{
    float ballX;
    float ballY;
    float ballW;
    float ballH;

    float dX = random(3,6);
    float dY = random(3,6);
    float acceleration = 0;


    Ball(float tempx,float tempy,float tempw,float temph){
        ballX = tempx;
        ballY = tempy;
        ballH = temph;
        ballW = tempw;
    }

    void move(){
        ballX+=dX;
        ballY+=dY;
        

        if (ballY>height || ballY < 0){ //hits ceiling or floor
            dY=-dY;
        }

        if (collision() && !endGame()){
            dX=-dX;
            score++;

            if (dX>0){ //keeps track of acceleration
                dX+=acceleration;
            }

            if(dX<0){
                dX-=acceleration;
            }

            acceleration+=0.1;

        }

        if (endGame()){
            fill(255);
            textSize(32);
            textAlign(CENTER,CENTER);
            text(";_; Game Over ;_;",width/2,height/2+30);
            dX=0; //stops ball
            dY=0;
        }

        
    }

    boolean collision(){
        // source: http://drdoane.com/thinking-through-a-basic-pong-game-in-processing/
        boolean coll=false;

        if ((ballX>=p2.paddleX) && (ballY>=p2.paddleY) && (ballY<=p2.paddleY+p2.paddleH)){ //hits paddle
            coll = true;
        }

        if ((ballX<=p1.paddleX+p1.paddleW) && (ballY>=p1.paddleY) && (ballY<=p1.paddleY+p1.paddleH)){
            coll = true;
        }

        return coll;
    }

    void display(){
        fill(255);
        noStroke();
        ellipse(ballX,ballY,ballW,ballH);
    }

    boolean endGame(){
        boolean end=false;
        if (ballX>width+ballW || ballX<0-ballW && !collision()){ //won't accidentally end on collision
            end = true;
        }
        return end;
    }
}


float ball_positionX, ball_positionY, block_positionX, block_positionY, speedX, speedY, ballsize, blocksize,i, slide;
int Lever;

void setup() {
    size(800, 600);
    fill(255, 255, 255);
    cursor(CROSS);
    textAlign(CENTER, CENTER);
    ball_positionX = random(0, width);
    ball_positionY = random(0, height/2);
    rectMode(CENTER);
    block_positionX = random(0, width);
    block_positionY = random(0, height*2/3);
    blocksize = 30;
    ballsize = 15;
    speedX = 5;
    speedY = 5;
    Lever = 0;
    i = 0;
    slide = 100;
}

void draw() {

    if (ball_positionY < height + ballsize/2){
        /*Draw ball and slide*/
        background(0, 0, 0);
        textSize(12);
        text("Lever "+ Lever, 30, 10);
        ellipse(ball_positionX, ball_positionY, ballsize, ballsize);
        rect(block_positionX, block_positionY, blocksize, blocksize);
        rect(mouseX, height - 10, slide, 10);
        ball_positionX = ball_positionX+speedX+speedX*2*cos(degrees(i));
        ball_positionY = ball_positionY+speedY+speedY*2*sin(degrees(i));
        /*When the ball hint left OR right wall*/
        if (ball_positionX < 0 || ball_positionX > width ) {   
            speedX *= -1;
        }
        /*When the ball hint the upper wall OR the slide*/
        if (ball_positionY < 0 || (ball_positionY >= height - (20+ballsize/2) && ball_positionX <= mouseX + slide/2 && ball_positionX >= mouseX -slide/2)) {
            speedY *= -1;
        }
        /*When The ball hint the block, WIN*/
        if (ball_positionX >= block_positionX- blocksize && ball_positionX <= block_positionX + blocksize && ball_positionY >= block_positionY- blocksize && ball_positionY <= block_positionY + blocksize) {
            block_positionX = random(0, width);
            block_positionY = random(0, height*2/3);
            speedX *= 1.1;
            speedY *= 1.1;
            Lever++;
        }
    }
    else
    {
        /*When the ball fly out the window, GAMEOVER*/
        background(0, 0, 0);
        textSize(100);
        fill(0, 102, 153);
        textAlign(CENTER, CENTER);
        text("GAME OVER", width/2, height/2);
        rect(width/2, height/2+100, 120, 40);
        textSize(12);
        fill(255, 255, 255);
        text("Restart", width/2, height/2+100);
        if (mouseX >= width/2-60 && mouseX <= width/2+60 && mouseY >= height/2+100-20 && mouseY <= height/2+100+20) {
            cursor(HAND);
            if (mousePressed) {
                setup();  
            }
        }
        else {
            cursor(CROSS);
        }
    }
    i++;
}
void mousePressed() {
    if (mouseButton == RIGHT) 
        slide+=10;
}
// void keyPressed()   {
//     /*Restart the game*/
//     if (ball_positionY >= height && key == 'r'){
//         setup();
//     }
// }


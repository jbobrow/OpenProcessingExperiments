
int level = 1;
int lvlmoves;
int totalmoves;
int savedmoves;

float counter;
float savedTime;
float alpha = 255; 

String gameState = "Title";
String td;

boolean Timer;
boolean movesLeft;
boolean D1;
boolean D2;
boolean D3;
boolean easterEgg;

gameScreen gs;
gamePanel gp;
gameBoard gb;
gameBall ball;
gameBall hole;
Boundaries walls [];

color rgb = color(random(30, 220), random(30, 220), random(30, 220));

void setup()
{
    size (600, 700);
    ellipseMode(CORNER);
    rectMode(CORNER);

    gs = new gameScreen();
    gp = new gamePanel();
    gb = new gameBoard();
    ball = new gameBall();
    hole = new gameBall();
    walls = new Boundaries [10];

    for (int i=0; i < walls.length; i++)
    {
        walls[i] = new Boundaries();
    }
}

void draw()
{
    if (gameState == "Title")
    {
        background (0);
        gs.draw();
    }

    if (gameState == "gameBoard")
    {
        moveFigures();
        allCollision();
        collisionWithHole();
        background (0);
        gb.draw();
        drawFigures ();
        generalAndKeys();
    }

    if (gameState == "gamePanel")
    {
        gp.draw();
    }

    if (Timer == true)
    {
        counter += 1;
    }
}

void generalAndKeys()
{
    if (keyPressed)
    {
        if (key == 'r' || key == 'R') 
        {
            Timer = false;
            counter = 0;
            ball.moveX = 0;
            ball.moveY = 0;
            totalmoves = 0;
            level = 1;
            currentLevels();
            rgb = color(random(30, 220), random(30, 220), random(30, 220));
        }
    }

    if (lvlmoves < 0)
    {
        movesLeft = true; 
        currentLevels();
        ball.moveX = 0;
        ball.moveY = 0;
    }

    if (movesLeft == true)
    {
        fill(255, alpha);
        textSize(36);
        text ("You ran out of moves!", 115, 335);

        fill(0, alpha);
        textSize(35);
        text ("You ran out of moves!", 115, 335);

        float passedTime = millis() - savedTime;
        if (passedTime > 200)
        {
            savedTime = millis();
            alpha -= 25;
        }
        if (alpha < 0)
        {
            alpha = 255;
            movesLeft = false;
        }
    }
}

void drawFigures()
{
    for (int i=0; i < walls.length; i++)
    {
        walls[i].draw();
    }

    fill (0);
    stroke(0);
    strokeWeight(1);

    if (mousePressed == true)
    {
        line (ball.x + (ball.w / 2), ball.y + (ball.h / 2), mouseX, mouseY);
    }

    ellipse (hole.x, hole.y, ball.w, ball.h);
    ball.draw();

    //easterEggs
    if (level == 8 & ball.x >= 360 && (ball.x + ball.w) <= 440)
        easterEgg = true;
    else
        easterEgg = false;

    if (level == 8)
    {
        stroke(0);
        fill (0);
        rect (400, 570, 1, 1);
        if (easterEgg == true)
        {
            textSize(35);
            if (ball.y >= 160 && ball.y <= 572)
            {
                text ("HIDDEN TUNNEL", 165, 355);
            }
        }
    }
    //easterEggs
}

void moveFigures()
{
    if (gameState == "gameBoard")
    {
        ball.x = ball.x - ball.moveX;
        ball.y = ball.y - ball.moveY;
    }

    ball.moveX *= 0.985;
    ball.moveY *= 0.985;

    for (int i=0; i < walls.length; i++)
    {
        walls[i].x = walls[i].x - walls[i].moveX;
        walls[i].y = walls[i].y - walls[i].moveY;
    }
}

void collisionWithHole ()
{
    if (sqrt (sq(ball.x - hole.x) + sq(ball.y - hole.y)) -5 <= (ball.w / 2))
    {
        if (level == 10)
        {
            Timer = false;
            ball.moveX = 0;
            ball.moveY = 0;
            gameState = "gamePanel";
        }
        else
        {
            ball.moveX = 0;
            ball.moveY = 0;
            level += 1;
            rgb = color(random(30, 220), random(30, 220), random(30, 220));
            currentLevels();
        }
    }
}

void allCollision()
{
    //ball with gameboard
    if (ball.x <= gb.x)
    {
        ball.x = gb.x;
        ball.moveX *= -1;
    }

    else if (ball.x + ball.w >= gb.x + gb.w)
    {
        ball.x = (gb.x + gb.w) - ball.w;
        ball.moveX *= -1;
    }

    if (ball.y <= gb.y)
    {
        ball.y = gb.y;
        ball.moveY *= -1;
    }

    else if (ball.y + ball.w >= gb.y + gb.h)
    {
        ball.y = (gb.y + gb.h) - ball.h;
        ball.moveY *= -1;
    }
    //ball with gameboard

    for (int i=0; i < walls.length; i++)
    {
        //walls with gameboard
        if (walls[i].x <= gb.x)
        {
            walls[i].x = gb.x;
            walls[i].moveX *= -1;
        }

        else if (walls[i].x + walls[i].w >= gb.x + gb.w)
        {
            walls[i].x = (gb.x + gb.w) - walls[i].w;
            walls[i].moveX *= -1;
        }

        if (walls[i].y <= gb.y)
        {
            walls[i].moveY *= -1;
        }

        else if (walls[i].y + walls[i].h >= gb.y + gb.h)
        {
            walls[i].moveY *= -1;
        }
        //walls with gameboard

        //walls with walls
        for (int j=i+1; j < walls.length; j++)
        {
            if (walls[i].intersects(walls[j]))
            {
                if (walls[i].visible == true && walls[j].visible == true)
                {
                    float collisionBottom = walls[i].y + walls[i].h - walls[j].y;
                    float collisionTop = walls[j].y + walls[j].h - walls[i].y;
                    float collisionLeft = walls[j].x + walls[j].w - walls[i].x;
                    float collisionRight = walls[i].x + walls[i].w - walls[j].x;

                    if (level == 15 && walls[3].intersects(walls[1]))
                    {
                        //do nothing
                    }

                    else if (collisionBottom <= collisionTop && collisionBottom <= collisionLeft && collisionBottom <= collisionRight)
                    {
                        walls[i].moveY *= -1;
                        walls[j].moveY *= -1;
                    }
                    else if (collisionTop <= collisionBottom && collisionTop <= collisionLeft && collisionTop <= collisionRight)
                    {
                        walls[i].moveY *= -1;
                        walls[j].moveY *= -1;
                    }
                    else if (collisionLeft <= collisionBottom && collisionLeft <= collisionTop && collisionLeft <= collisionRight)
                    {
                        walls[i].moveX *= -1;
                        walls[j].moveX *= -1;
                    }
                    else if (collisionRight <= collisionBottom && collisionRight <= collisionTop && collisionRight <= collisionLeft)
                    {
                        walls[i].moveX *= -1;
                        walls[j].moveX*= -1;
                    }
                }
            }
        }
        //walls with walls
    }

    for (int i=0; i < walls.length; i++)
    {
        if (ball.intersects(walls[i]))
        {
            if (easterEgg == false)
            {
                ball.moveX = 0;
                ball.moveY = 0;
                lvlmoves = savedmoves;
                currentLevels();
            }
        }
    }
}

void mouseReleased()
{
    if (gameState == "gameBoard")
    {
        ball.moveX = (ball.x - mouseX) / 25;
        ball.moveY = (ball.y - mouseY) / 25;
        lvlmoves -= 1;
        Timer = true;
        totalmoves += 1;
    }
}


void mouseClicked()
{
    if (gameState == "Title")
    {
        if (mouseX >= 170 && mouseX <= 435 && mouseY >= 255 && mouseY <= 300)
        {
            gameState = "gameBoard";
            currentLevels();
        }
        else if (mouseX >= 170 && mouseX <= 435 && mouseY >= 355 && mouseY <= 400)
        {
            println("highscore");
        }
        else if (mouseX >= 170 && mouseX <= 435 && mouseY >= 455 && mouseY <= 500)
        {
            println("hardcore mode");
        } 

        // DEVELOPER MODE //

        if (mouseX >= 180 && mouseX <= 220 && mouseY >= 125 && mouseY <= 190)
        {
            D1 = true;
        }

        if (mouseX >= 245 && mouseX <= 265 && mouseY >= 125 && mouseY <= 190)
        {
            if (D2 == true)
            {
                D3 = true;
            }
            else
            {
                D2 = false; 
                D1 = false;
            }
        }

        else if (mouseX >= 390 && mouseX <= 430 && mouseY >= 125 && mouseY <= 190)
        {
            if (D1 == true)
            {
                D2 = true;
            }
            else 
            {
                D1 = false;
            }
        }

        // DEVELOPER MODE//
    }

    if (gameState == "gamePanel")
    {
        if (mouseX >= 360 && mouseX <= 400 && mouseY >= 370 && mouseY <= 410)
        {
            level = 11;
            gameState = "gameBoard";
            currentLevels();
        }

        if  (mouseX >= 410 && mouseX <= 440 && mouseY >= 370 && mouseY <= 410)
        {
            gameState = "Title";
            level = 1;
            counter = 0;
            totalmoves = 0;
        }
    }
}

class gameScreen
{
    float x, y, w, h;

    gameScreen ()
    {
        w = 450;
        h = 600;
        x = 75;
        y = 65;
    }

    void draw()
    {
        stroke(#336600);   
        strokeWeight(3);

        fill(255);
        rect (x, y, w, h);
        rect (170, 255, 265, 45);
        rect (170, 355, 265, 45);
        rect (170, 455, 265, 45);

        fill(#336600);
        textSize(60);
        text ("SLINGEE", 185, 175);

        fill(0);
        textSize(18);
        text ("Created by: Jacob Kadzielski", 180, 655);
        if (D3 == true)
        {
            textSize(16);
            text ("*DEVELOPER MODE ACTIVATED*", 180, 530);
        }
        textSize(25);
        text ("New Game", 235, 285);
        text ("Highscore", 240, 385);
        text ("Hardcore Mode", 210, 485);
    }
}

class gameBoard
{
    float x, y, w, h;

    gameBoard ()
    {
        w = 450;
        h = 600;
        x = 75;
        y = 65;
    }

    void draw()
    {
        stroke(rgb);   
        strokeWeight(5);

        fill (255);
        rect (x, y, w, h);
        rect (75, 5, 450, 50);

        fill(0);
        textSize(15);
        if (lvlmoves < 3)
        {
            fill(#FF0000);
        }
        text ("Moves Remaining: " + lvlmoves, 88, 35);

        fill(0);
        text ("Level: " + level, 270, 35);
        td = nf((counter / 60), 1, 2);
        text ("Total Time: " + td, 385, 35);
    }
}

class gamePanel
{
    float x, y, w, h;

    gamePanel ()
    {
        w = 350;
        h = 225;
        x = 125;
        y = 225;
    }

    void draw()
    {
        fill (255);
        rect (x, y, w, h);

        fill (0);
        textSize(25);
        text ("CONGRATULATIONS!", 170, 270);
        textSize(15);
        text ("You have defeated the EASY (1-10) Levels", 150, 290);
        text ("Total Time: " + td, 150, 330);
        text ("Total Amount of Moves: " + totalmoves, 150, 350);
        text ("Continue to MEDIUM levels?   Yes   |   No ", 150, 390);

        fill(0);
        textSize(15);
        if (level == 10)
        {
            fill(#FF0000);
        }
    }
}

class gameBall
{
    float x, y, w, h, moveX, moveY;

    gameBall ()
    {
        w = 30;
        h = w;
        x = x;
        y = y;
        moveX = moveX;
        moveY = moveY;
    }

    boolean intersects (Boundaries other)
    {
        return (x <= other.x + other.w) && (y <= other.y + other.h) && (x + w >= other.x) && (y + h >= other.y);
    }

    void draw()
    {
        fill (255);
        ellipse (x, y, w, h);
    }
}

class Boundaries
{
    float x, y, w, h, moveX, moveY;
    boolean visible;

    Boundaries ()
    {
        w = w;
        h = h;
        x = x;
        y = y;
        moveX = moveX;
        moveY = moveY;
        visible = true;
    }

    boolean intersects (Boundaries other)
    {
        return (x <= other.x + other.w) && (y <= other.y + other.h) && (x + w >= other.x) && (y + h >= other.y);
    }

    void draw()
    {
        fill (rgb);
        rect (x, y, w, h);
    }
}

void changeLevel(int moves, int x, int tX, int tY, int t2X, int t2Y)
{
    for (int i = 0 ; i < x; i++)
    {
        walls[i].visible = true;
        walls[i].moveX = 0;
        walls[i].moveY = 0;
    }

    for (int i = x; i < walls.length; i++)
    {
        walls[i].visible = false;
        walls[i].x = 0;
        walls[i].y = 0;
        walls[i].h = 0;
        walls[i].w = 0;
    }

    lvlmoves = moves;
    savedmoves = moves;
    hole.x = tX;
    hole.y = tY;
    ball.x = t2X;
    ball.y = t2Y;
}

void currentLevels()
{
    if (level == 1)
    {
        changeLevel(5, 1, 450, 115, 100, 115); 
        walls[0].w = 185;
        walls[0].h = 500;
        walls[0].x = 200;
        walls[0].y = 65;
    }
    if (level == 2)
    {
        changeLevel(5, 2, 450, 585, 100, 115); 
        walls[0].w = 350;
        walls[0].h = 200;
        walls[0].x = 175;
        walls[0].y = 65;
        walls[1].w = 350;
        walls[1].h = 300;
        walls[1].x = 75;
        walls[1].y = 365;
    }
    if (level == 3)
    { 
        changeLevel(7, 3, 475, 90, 475, 595);
        walls[0].w = 350;
        walls[0].h = 55;
        walls[0].x = 175;
        walls[0].y = 475;
        walls[1].w = 55;
        walls[1].h = 300;
        walls[1].x = 175;
        walls[1].y = 70;
        walls[2].w = 200;
        walls[2].h = 50;
        walls[2].x = 325;
        walls[2].y = 175;
    }
    if (level == 4)
    {
        changeLevel(5, 2, 100, 605, 100, 90);
        walls[0].w = 300;
        walls[0].h = 250;
        walls[0].x = 150;
        walls[0].y = 140;
        walls[1].w = 375;
        walls[1].h = 130;
        walls[1].x = 75;
        walls[1].y = 455;
    }
    if (level == 5)
    {
        changeLevel(5, 3, 355, 605, 200, 605);
        walls[0].w = 75;
        walls[0].h = 505;
        walls[0].x = 265;
        walls[0].y = 155;
        walls[1].w = 100;
        walls[1].h = 100;
        walls[1].x = 160;
        walls[1].y = 155;
        walls[2].w = 100;
        walls[2].h = 100;
        walls[2].x = 340;
        walls[2].y = 155;
    }
    if (level == 6)
    {
        changeLevel(7, 2, 450, 585, 100, 115); 
        walls[0].w = 50;
        walls[0].h = 500;
        walls[0].x = 175;
        walls[0].y = 65;
        walls[1].w = 50;
        walls[1].h = 500;
        walls[1].x = 350;
        walls[1].y = 165;
    }
    if (level == 7)
    {
        changeLevel(8, 4, 455, 605, 100, 605);
        walls[0].w = 225;
        walls[0].h = 230;
        walls[0].x = 185;
        walls[0].y = 435;
        walls[1].w = 75;
        walls[1].h = 275;
        walls[1].x = 80;
        walls[1].y = 70;
        walls[2].w = 75;
        walls[2].h = 275;
        walls[2].x = 450;
        walls[2].y = 70;
        walls[3].w = 75;
        walls[3].h = 275;
        walls[3].x = 260;
        walls[3].y = 270;
    }
    if (level == 8)
    {
        changeLevel(8, 5, 475, 90, 475, 595);
        walls[0].w = 200;
        walls[0].h = 405;
        walls[0].x = 325;
        walls[0].y = 165;
        walls[1].w = 75;
        walls[1].h = 80;
        walls[1].x = 250;
        walls[1].y = 490;
        walls[2].w = 100;
        walls[2].h = 350;
        walls[2].x = 75;
        walls[2].y = 315;
        walls[3].w = 75;
        walls[3].h = 100;
        walls[3].x = 175;
        walls[3].y = 315;
        walls[4].w = 175;
        walls[4].h = 75;
        walls[4].x = 175;
        walls[4].y = 165;
    }
    if (level == 9)
    {
        changeLevel(8, 3, 475, 595, 475, 90);
        walls[0].w = 75;
        walls[0].h = 375;
        walls[0].x = 375;
        walls[0].y = 65;
        walls[1].w = 250;
        walls[1].h = 50;
        walls[1].x = 275;
        walls[1].y = 515;
        walls[2].w = 130;
        walls[2].h = 425;
        walls[2].x = 150;
        walls[2].y = 140;
    }
    if (level == 10)
    {
        changeLevel(9, 6, 475, 575, 100, 90);
        walls[0].w = 50;
        walls[0].h = 300;
        walls[0].x = 175;
        walls[0].y = 65;
        walls[1].w = 50;
        walls[1].h = 200;
        walls[1].x = 175;
        walls[1].y = 465;
        walls[2].w = 50;
        walls[2].h = 50;
        walls[2].x = 300;
        walls[2].y = 615;
        walls[3].w = 50;
        walls[3].h = 430;
        walls[3].x = 300;
        walls[3].y = 140;
        walls[4].w = 100;
        walls[4].h = 50;
        walls[4].x = 425;
        walls[4].y = 265;
        walls[5].w = 100;
        walls[5].h = 50;
        walls[5].x = 350;
        walls[5].y = 440;
    }
    if (level == 11)
    {
        changeLevel(6, 2, 300, 585, 300, 115); 
        walls[0].w = 300;
        walls[0].h = 75;
        walls[0].x = 250;
        walls[0].y = 200;
        walls[0].moveX = 1;
        walls[1].w = 300;
        walls[1].h = 75;
        walls[1].x = 75;
        walls[1].y = 400;
        walls[1].moveX = -1;
    }
    if (level == 12)
    {
        changeLevel(6, 4, 460, 585, 100, 115); 
        walls[0].w = 300;
        walls[0].h = 75;
        walls[0].x = 250;
        walls[0].y = 450;
        walls[1].w = 300;
        walls[1].h = 75;
        walls[1].x = 75;
        walls[1].y = 200;
        walls[2].w = 75;
        walls[2].h = 75;
        walls[2].x = 575;
        walls[2].y = 200;
        walls[3].w = 75;
        walls[3].h = 50;
        walls[3].x = 225;
        walls[3].y = 300;
        walls[3].moveY = -1;
    }
    if (level == 13)
    {
        changeLevel(5, 3, 355, 605, 200, 605);
        walls[0].w = 75;
        walls[0].h = 505;
        walls[0].x = 265;
        walls[0].y = 155;
        walls[1].w = 105;
        walls[1].h = 100;
        walls[1].x = 160;
        walls[1].y = 155;
        walls[1].moveX = 1;
        walls[2].w = 100;
        walls[2].h = 100;
        walls[2].x = 340;
        walls[2].y = 155;
        walls[2].moveX = -1;
    }
    if (level == 14)
    {
        changeLevel(6, 5, 450, 115, 100, 115); 
        walls[0].w = 250;
        walls[0].h = 300;
        walls[0].x = 175;
        walls[0].y = 65;
        walls[1].w = 75;
        walls[1].h = 250;
        walls[1].x = 350;
        walls[1].y = 300;
        walls[2].w = 200;
        walls[2].h = 220;
        walls[2].x = 75;
        walls[2].y = 445;
        walls[3].w = 55;
        walls[3].h = 60;
        walls[3].x = 285;
        walls[3].y = 375;
        walls[3].moveY = -1;
    }
    if (level == 15)
    {
        changeLevel(11, 8, 100, 605, 100, 90);
        walls[0].w = 100;
        walls[0].h = 100;
        walls[0].x = 152;
        walls[0].y = 65;
        walls[1].w = 100;
        walls[1].h = 100;
        walls[1].x = 260;
        walls[1].y = 305;
        walls[1].moveY = -0.5;
        walls[2].w = 152;
        walls[2].h = 100;
        walls[2].x = 368;
        walls[2].y = 65;
        walls[3].w = 95;
        walls[3].h = 80;
        walls[3].x = 95;
        walls[3].y = 173;
        walls[3].moveX = -3;
        walls[4].w = 300;
        walls[4].h = 40;
        walls[4].x = 65;
        walls[4].y = 430;
        walls[5].w = 178;
        walls[5].h = 170;
        walls[5].x = 65;
        walls[5].y = 262;
        walls[6].w = 90;
        walls[6].h = 320;
        walls[6].x = 368;
        walls[6].y = 262;
        walls[7].w = 120;
        walls[7].h = 100;
        walls[7].x = 168;
        walls[7].y = 560;
        Timer = false;
    }
}




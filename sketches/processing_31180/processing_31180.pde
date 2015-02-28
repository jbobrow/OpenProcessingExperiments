
// A processing scratchpad

int i = 0;
int x = 50;
int speed = 1;
int score = 0;

void setup() 
{
    size(300,400);
    PFont font;
    font = loadFont("CenturySchL-Bold-48.vlw");
    textFont(font);
    background(0);
    fill(255);
    stroke(255);
    smooth();
    }
void draw() 
{
    // set up the hoop
    background(0);
    strokeWeight(3);
    noFill();
    ellipse(x, 300, 100, 80);
    x += speed;
    if (x>width-50 || x<50)
	speed *= -1;
    // set up the ball
    fill(255);
    int ballX = mouseX;
    int ballY = mouseY-60;
    ellipse(ballX,ballY,50,50);
    if (ballX > x-20 && ballX < x+20)
	{
	    if (ballY > 290 && ballY < 310)
		score += 1;
	}
    text("your score", 20, 30);
    text("is " + score, 20, 80);


}


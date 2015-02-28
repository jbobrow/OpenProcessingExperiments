
int aix = 0;
int aiy = 0;
int score = 0;
int ry = 0;
int rx = 0;
int play = 3;
int time = 600;
int win = 0;
int scorex = 50;
int bgg = 0;
int bgb = 0;
int aispeed = int(1.5);

PImage BG;
PImage spider;
PImage ant;

void setup() {  // this is run once.   

BG = loadImage("http://i.imgur.com/To2kIsb.png");
spider = loadImage("http://i.imgur.com/ebdhef5.png");
ant = loadImage("http://i.imgur.com/rMdvUz0.png");
    size(400, 400); 
    rx = 200;
    ry = 200;
    fill(0,0,0);
    aix = 200;
    aiy = 200;
    noStroke();
    textFont(createFont("Courier New",30));
    background(125,121,73);
    fill(255,255,255);

    text("Avoid the spider", 60, 100);
    text("Collect green food", 30, 150);
    text(scorex + " points to win!", 35, 200);
    text("(Click to start)", 50, 250);

} 

void draw() {  // this is run repeatedly.  



if (play == 1)
{
image(BG,0,0,400,400);
//background(125,121,73);
fill(0,255,0,bgg);
fill(255,0,0,bgb);
rect(0,0,400,400);
bgg -= 2;
bgb -= 2;
time -= 1;


if (aix >= mouseX) //ai
    {aix -= aispeed;}
if (aix < mouseX)
    {aix += aispeed;}
if (aiy >= mouseY)
    {aiy -= aispeed;}
if (aiy < mouseY)
    {aiy += aispeed;}

if(mouseX > aix-25 && mouseX < aix+25 && mouseY > aiy-25 && mouseY < aiy + 25)
//enemy collision
{
    fill(0,0,0);
    score -= 1;
    bgb = 100;
}

if(mouseX > rx && mouseX < rx + 50 && mouseY > ry && mouseY < ry + 50) //apple collision
{
    score += 5;
    rx = int(random (50 + random (300)));
    ry = int(random (50 + random (300)));
    bgg = 100;
}

//win
if (score >= scorex)
{
    play = 0;
    win = 1;
}
if (time < 1)
{
    play = 0;
    win = 0;
}

if (play == 0) // win/lose control
{
    if (win == 1)
    {
        fill(255,255,255);
        text("You Win :D", 100, 200);
        text("(Click to start)", 50, 250);
    }
    if (win == 0)
    {
        fill(255,255,255);
        text("You Lose D:", 100, 200);
        text("(Click to start)", 50, 250);
    }
}


fill(0,255,0);
ellipse(rx, ry, 10, 10); //apple

fill(255,255,255);
//rect(aix -25,aiy -25,50,50); //enemy
image(spider, aix - 25, aiy - 25, 50, 50);

image(ant,mouseX - 10,mouseY - 10,20,20);





text("score: " + score + "  Time: " + int(time/60), 15, 390);
}

//println("aix:" + aix + " aiy:" + aiy);
}

void mouseClicked() { //reset/start control

if (play != 1)
{
    play = 1;
    time = 600;
    score = 0;
}

}



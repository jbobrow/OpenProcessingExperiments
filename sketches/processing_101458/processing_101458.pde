
//initialise score variable
int score;
int level = 1;
int moveArea = 30;
int ballSize = 40;
boolean fire = false;
//Initialise gameOver variable
int gameOver = 1;
//int startGame;
int getRandomX()
// int score;
{
return int(random(600));
}
int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
int[] bally = { 0, 0, 0, 0, 0 };
void setup()
{
//Size
size (900, 500);
smooth ();
}
void draw()
{
//Game Style
background (#020504);
fill(#C04EFA);
stroke (#C04EFA);
line(0,400,800,400);
for (int x=-120; x< width+100; x +=200){
house(x,200);
}
for (int x=-120; x< width+100; x +=200){
int gray = int(random(0));
}
}
void house(int x, int y){
pushMatrix();
translate (x,y);
strokeWeight(1);
smooth();
stroke(1);
fill(#4EFAD0);
//roof1
triangle(100,100,200,50,300,100);
//house1
rect(130,100,140,100);
popMatrix();
triangle(mouseX-8, 480, mouseX+8, 480, mouseX, 565);
// display score
fill(#C04EFA);
fill(255, 0 , 0);
textAlign(CENTER);
strokeWeight(1);
text("save the neighborhood", width/2, 80);
fill(255, 255, 102);
text("shoot the squares", width/2, 240);
fill(#5FDE07);
text("Level " + level + "/5", width/2,height/4);
//stroke(#C04EFA);
//line(0,height-moveArea,width,height-moveArea);
if(fire)
{
cannon(mouseX);
fire = false;
}
ballFalling();
gameFinish();
}
//Play the game
void mousePressed()
{
fire = true;
}
void ballFalling()
{
stroke(#FAD24E);
fill (#FA654E);
for (int i=0; i<5; i++)
{
rect(ballx[i], bally[i]++, ballSize, ballSize);
}
}
void cannon(int shotX)
{
boolean strike = false;
for (int i = 0; i < 5; i++)
{
if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
strike = true;
line(mouseX, 565, mouseX, bally[i]);
ellipse(ballx[i], bally[i],
ballSize+25, ballSize+25);
ballx[i] = getRandomX();
bally[i] = 0;
// update score
score++;
}
}
if(strike == false)
{
line(mouseX, 565, mouseX, 0);
}
}
//GameOver
void gameFinish()
{
for (int i=0; i< 5; i++)
{
if(bally[i]==530)
{
fill(color(255,0,0));
fill(255, 0, 0);
textAlign(CENTER);
text("GAME OVER", width/2, height/2);
text("Well done! Your score was : "+ score, width/2, height/2 + 50);
noLoop();
}
}
}




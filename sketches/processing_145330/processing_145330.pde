
//Cheyenne Cavender-Period 4 Engineering-4/9/14
// Click the black box to get points!
int click = 0;
int score= 0;
void setup()
{size(400,400); frameRate (4);}
void draw(){
click = click +1;
if (click >= 5 ) {fill (0,0,0);
rect(50,50,50,50);}
if (click >= 10) {
  fill (0,0,0);
rect (200,200,200,200);}
if (click >= 15) {
    fill (0,0,0);
  rect (213,48,90,90);}
  if (mousePressed && mouseX>50 && mouseY>50)
{ score = score +2 ;println("your score "+ score + " points");}
if(mousePressed && mouseX>200 && mouseY>200)
{ score = score +2 ;println("your score "+ score + " points");}
if(mousePressed && mouseX>213 && mouseY>48)
{ score = score +2 ;println("your score "+ score + " points");}
fill(random(0,255),random(0,255),random(0,255),random (0,100));
rect(random(0,350),random(0,350),random(0,250),random(0,250));
ellipse(random(0,350),random(0,350),random(0,250),random(0,250));
fill (255);
rect (0,0,400,12);
fill (0);
text ("score= ",0,10);
text (score,50,10);
fill(255,0,0);
textSize(15);
text("Click the black boxes to get points",50,200);
if (score >= 150) {   fill (0); rect (0,0,400,400); fill (255); text ("YOU WON!",20,20);}
}

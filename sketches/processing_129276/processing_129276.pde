
monster monster1;

void setup() {
size(500,500);
}

void draw() {
background(255,255,255); 
monster1 = new monster(250);
monster1.teken();
}

class monster{
int monsterY;
monster (int tempy){
monsterY = tempy;}


void teken(){
stroke(0);
fill(255,0,0);
ellipseMode(CENTER);
fill(0);
ellipse(mouseX-50,monsterY+60,100,40);
ellipse(mouseX+50,monsterY+60,100,40);
fill(255,0,0); 
ellipse(mouseX,monsterY,150,150);
fill(0);
ellipse(mouseX-30,monsterY-30,50,50);
ellipse(mouseX+30,monsterY-30,50,50);
fill(255);
ellipse(mouseX-40,monsterY-40,25,25);
ellipse(mouseX+40,monsterY-20,25,25);
fill(0);
ellipse(mouseX-40,monsterY-40,10,10);
ellipse(mouseX+40,monsterY-20,10,10);
fill(0);
rect(mouseX-35,monsterY+30,70,20);
fill(255);
for(int i = 0; i < 65; i = i + 10){
  rect(i + mouseX-35,monsterY+30,10,10); } } }





//referentiepunt 250




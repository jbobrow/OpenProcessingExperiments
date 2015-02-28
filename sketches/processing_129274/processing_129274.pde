
int monsterX;
int monsterY;
int richting;
int teller;
boolean test;


void setup() {
size(500,500);
monsterX = 250;
monsterY = 250;
richting = 10;
teller = 0;
test = true;}

void draw() {
background(255,255,255); 
stroke(0);
fill(255,0,0);

ellipseMode(CENTER);
fill(0);
ellipse(mouseX-50,monsterY+60,100,40);
ellipse(mouseX+50,monsterY+60,100,40);
fill(255,0,0); 
if (test == false){
fill (0); }
else { fill (255,0,0); }
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
  rect(i + mouseX-35,monsterY+30,10,10); }





monsterY = monsterY + richting;

if(monsterY > 500 || monsterY < 0) {
richting = - richting;
teller = teller + 1;}

if(teller == 10){
  teller = 0; 
test = !test; }
  

println(teller);
}


//referentiepunt 250




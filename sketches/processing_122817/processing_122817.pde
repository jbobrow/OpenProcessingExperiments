
int posmonX;
int stop = 300;
int spatie = 20;
int y = 0;

int richting;
boolean test;
int teller;

void setup(){
size(300,300);
richting = 10;
test = true;
teller = 0;
posmonX = 0;


}
void draw() {
 background(0);
 while (y < stop){
 stroke (random(255), random(255), random(255));
 line(0,y,width,y);
 y = y + spatie;
 }
 y = 0;
 
 
 
//fill(0,240,0);
rect(posmonX +120,mouseY +40,60,50);

//ellipseMode(ENTER);
fill(255,255,255);
stroke(0,0,0);
ellipse(posmonX +130,mouseY +50,10,10);

//ellipseMode(ENTER);
fill(255,255,255);
stroke(0,0,0);
ellipse(posmonX +160,mouseY +50,10,10);

if (test == true) {
    fill(0, 255, 0);
  }
 else if (test == false) {
    fill(255, 0, 0);
  }
  //ellipseMode(CENTER);
stroke (0,0,0);
ellipse(posmonX +150,mouseY +125,50,70);

stroke(255);
line(posmonX +125,mouseY +110,posmonX +70,mouseY +110);
stroke (255);
line(posmonX +170,mouseY +110,posmonX +225,mouseY +110);

stroke (255);
line(posmonX +135,mouseY +155,posmonX +135,mouseY +220);
stroke (255);
line(posmonX +160,mouseY +155,posmonX +160,mouseY +220);

 posmonX = posmonX + richting;


if(posmonX < 0 || posmonX > 250){
  teller = teller +1;
richting =  - richting;
}
  if (teller == 10) {
    teller = 0;
    test = !test;
  }

  if (test == true) {
    fill(0, 255, 0);
  }
 else if (test == false) {
    fill(255, 0, 0);
  }



}

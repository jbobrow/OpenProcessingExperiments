
int x;
int y;
target[] group = new target[200];
int numtargets = group.length;
int clicked;
int clicks;
int performance;
boolean textswitchon = true;
boolean textswitchon2 = false;
//target o1 = new target();


void setup(){
  size(500,500);
  frameRate(5);
  for (int i = 0; i < group.length;i++){
    group[i] = new target();
  }
}

void draw(){
  background(255);
  if(textswitchon == true){
    fill(0);
    textSize(15);
    text("Welcome to the Mouseclicker Game. Your task is to click all the cubes.",10,20);
    text("Easy and simple, right? What's the challenge then?", 10, 40);
    text("The challenge is to click the maximum number of cubes with the minimum",10,60);
    text("number of clicks.", 10, 80);
    text("Your performance will be assesed on how well you do on this challenge.", 10, 100);
    text("As you play, your performance will fluctuate upwardly and donwardly.", 10, 120);
    text("Press any key to start",10,140);
    if(keyPressed){
      textswitchon = false;
    }
  }
    if (numtargets == 0){
      textswitchon2 = true;
    }
    if(textswitchon2 == true){
    fill(0);
    textSize(15);
    text("Well done. Your performance score changes as you click.",10,20);
    text("'What's the maximum permance score?' I hear you asking.", 10, 40);
    text("The theoretical maximum score is 200 but no one will actually get this score.",10,60);
    text("To get that score all the squares should be in the same location as your", 10, 80);
    text("mouse and that is obviously extremely unlikely.", 10, 100);
    text("I would say 15 is the top score.", 10, 120);
    text("Realod the page to play again.", 10, 140);
    if(keyPressed){
      textswitchon2 = false;
    }
  }
  if(textswitchon == false && textswitchon2 == false){
performance = clicked/clicks;
noStroke();
//o1.display();
//o1.move();
for (int i = 0; i < group.length;i++){
    group[i].display();
    group[i].move();
  }
  fill(0);
  textSize(20);
  text("Number of targets: " + numtargets, 280,30);
  text("Clicked cubes: " + clicked, 280,50);
  text("Performance: " + performance, 280,70);
  }
}



void mouseClicked(){
  clicks = clicks + 1;
for (int i = 0; i < group.length;i++){
  int a = int(group[i].xtar);
  int b = int(group[i].ytar);
  int differencex = mouseX - a;
  int differencey = mouseY - b;
    if(differencex == 0 ||(differencex > -60) && (differencex < 60)){
     if(differencey == 0 ||(differencey > -60) && (differencey < 60)){
       group[i].dead = true;
       numtargets = numtargets -1;
       clicked = clicked + 1;
       fill(0);
       text("Mouse clicked event just happened!", 100,200);
     }
   }
  }
}
class target{
float xtar;
float ytar;
float a = random(0,250);
float b = random(0,120);
float c = random(0,250);
boolean dead = false;

target(){
  //xtar = x;
 // ytar = y;
  }

void display(){
smooth();
fill(a,b,c);
rect(xtar, ytar, 60,60);
}

void move(){
  xtar = random(5,430);
  ytar = random(70,410);
  if(xtar < 450){
    xtar = xtar + 3;
  }
  if(ytar < 450){
    ytar = ytar + 3;
  }
  if(dead == true){
  xtar = 0;
  ytar = 0;
  }
}

void exile(){
  xtar = 0;
  ytar = 0;
}

}



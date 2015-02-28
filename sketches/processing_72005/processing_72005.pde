
int posY = 50;
int posX = 20;
int count = 0;
int number = 0;
String newText;

PFont deca;
String[] nouns = {"cats","bags","boardwalks","burgers","dubstep","Snickers", "hummus", "sneakers"};
String[] verbs = {"eating","creating new types of","fighting","puzzling","taking someones","expiditing", "singing about"};
String[] adjectives = {"shiny", "filthy","blue","glorious","laughable","brick-like","polished"};

void setup(){
  size(1200,500);
  fill(255,255,255);
  background(0);
  deca = loadFont("MalayalamMN-48.vlw");
  textFont(deca, 32);
  text("Why I was late...",width/2,height/2);
}

void draw(){
}

void mousePressed(){
  number++;
  fill(0,0,0,20);
  rect(0,0,1200,500);
  fill(255,255,255);
  newText = "I was"+" "+verbs[int(random(6))]+" "+adjectives[int(random(6))]+" "+nouns[int(random(6))];
  text(newText,posX,posY);
  posY += 30;
  count++;
  if(count == 15){
    posY = 50;
    posX += 600;
  }
  if(count == 30){
    count = 1;
    //background(0);
    posX = 20;
    posY = 50;
    number++;
    newText = "I was"+" "+verbs[int(random(6))]+" "+adjectives[int(random(6))]+" "+nouns[int(random(6))];
    text(newText,posX,posY);
    posY += 30;
  }
}


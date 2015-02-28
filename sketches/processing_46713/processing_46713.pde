
boolean splash = true;
int anim=0;
int animcount=200;
float r = random(9);
int rn = int(r);

String[] message ={
  "Killing bears",
  "Liberating humanity",
  "Solving the world's problems",
  "Procrastinating",
  "Spreading Love",
  "Preaching Forgiveness",
  "Dashingly Handsome",
  "I think we deserve a distiction for this, don't you?       ",
  "Lollygagging",
  "Epitome of excellence"
};


String[] food = {
  "Toad in the hole", 
  "Apple crumble", 
  "Apple cookies", 
  "Banana cake", 
  "Black bean chili", 
  "Ceasar salad", 
  "Pork Pie", 
  "Margherita pizza", 
  "Walkers crisps", 
  "Vanilla ice cream", 
  "Heinz scotch broth", 
  "Baked beans", 
  "Spaghetti hoops", 
  "Generic cereal bar", 
  "Prepack lasagne"
};
int[] calories = {
  265, 
  300, 
  185, 
  401, 
  325, 
  265, 
  260, 
  133, 
  85, 
  83,
  832, 
  108, 
  120, 
  91, 
  755
};

String[] fat = {
  "8",
  "12",
  "10",
  "17",
  "9",
  "14",
  "16",
  "10",
  "8",
  "8",
  "1",
  "1",
  "1",
  "2",
  "14"
};

String[] sugar ={
  "9",
  "18",
  "10",
  "40",
  "22",
  "30",
  "20",
  "5",
  "1",
  "15",
  "1",
  "5",
  "4",
  "8",
  "6"
};

int number;
//String sugar;
//String fat;

int x;

PFont font1;
PFont font2;

void setup() {

  size(640, 480);
  font1 = loadFont("font1.vlw");
  font2 = loadFont("font2.vlw");
  smooth();
}

void draw() {

  if (splash==true) {

    if (anim<230) {
      fill(200, 0, 10);
      rect(0, 0, width, height);
      fill(255);
      noStroke();
      rect(anim, 186, 200, 40);
      textFont(font1);
      fill(200, 0, 10);
      text("Group  7", 230, 220);
      anim=anim+2;
    }


    animcount=animcount-1;

    if (anim==230) {
      textFont(font2);
      fill(255);
      text(message[rn]+ " since 1955", 230, 247);

      if (animcount==0) {
        splash=false;
      }
    }
  }

if(splash==false){  
   textFont(font2);
   noStroke();
    fill(255, 255, 200, 235);
    rect(30,40,470,420);
    fill(160, 0, 10);
    rect(500,40,50,420);
    rect(30,10,590,20);
    fill(140, 0, 10);
    rect(550,40,50,420);
    fill(120, 0, 10);
    rect(600,40,20,420);
    for (int b=0;b<15;b++) {
      fill(0, 0, 255);
      text(food[b], 50, (b*25)+100);
    }
    text("Meals", 80, 70);
    text("Calories:", 300, 100);
    text("Fat:", 300, 125);
    text("Sugar:", 300, 150);


if(mouseX<250){
    if (mouseY > 100 && mouseY<120) {
      number = 0;
    }
    if(mouseY>125 && mouseY<145){
      number=1;
    }
    if(mouseY>150 && mouseY<170){
      number=2;
    }
    if(mouseY>175 && mouseY<195){
      number=3;
    }
    if(mouseY>200 && mouseY<220){
      number=4;
    }
    if(mouseY>225 && mouseY<245){
      number=5;
    }
    if(mouseY>250 && mouseY<270){
      number=6;
    }
    if(mouseY>275 && mouseY<295){
      number=7;
    }
    if(mouseY>300 && mouseY<320){
      number=8;
    }
    if(mouseY>325 && mouseY<345){
      number=9;
    }
    if(mouseY>350 && mouseY<370){
      number=10;
    }
    if(mouseY>375 && mouseY<395){
      number=11;
    }
    if(mouseY>400 && mouseY<420){
      number=12;
    }
    if(mouseY>425 && mouseY<445){
      number=13;
    }
    if(mouseY>450 && mouseY<470){
      number=14;
    }
}
    
    
    text(calories[number], 400, 100);
    text(fat[number]+"g",400,125);
    text(sugar[number]+"g",400,150);
    noFill();
    
    stroke(0);
    int TY = 95+(25*number);
    triangle(40,TY-5,40,TY+5,48,TY);
    
    text("To Burn These Calories:",300,240);
    text("Cycling intensity:",300,280);
    text("light",300,300);
    text("moderate",300,320);
    text("intense",300,340);
    
    text(calories[number]/125+"hours",380,300);
    text(calories[number]/200+"hours",380,320);
    text(calories[number]/295+"hours",380,340);
  }
}



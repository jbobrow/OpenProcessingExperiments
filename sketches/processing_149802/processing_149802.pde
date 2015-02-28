
int trans = 10;
int trans2 = 10;
int count = 0;
int x1 = 400;  //ears off 1
int y1 = 130;  //ears off 1
int y2 = 420;    //i hop 1
int y3 = 200;    //i hop 2
int y4 = 250;    //i hop 3
float txt = 10;  //text zoom
int m = 2;
void setup() {
  size(400,200);
  background(255);
  noStroke();
}
void draw(){
  background(255);
//=============================== counter
  count = count + 1;
//  fill(255,0,0);
//  textSize(12);
//  text(count,10,50);
//=============================== counter end
//=============================== word fade in
  trans = trans + 1;
  fill(0,0,0,trans);
  textSize(32);
  text("The Wild Bunny", 70,85);
  if(count >= 200){
    trans2 = trans2 + 1;
    fill(0,0,0,trans2);
    textSize(20);
    text("By Sander Cohen", 145,110);
  }
  if(count >= 445){
    background(255);
  }
//=============================== end
//=============================== i want to take the ears off [1]
  if(count >= 450){
    fill(0);
    textSize(75);
    text("I want to take the ears off", x1,y1);
    x1 = x1 - 8;
  }
//=============================== ears off end [1]
//=============================== But I cant  [1]
  if(count >= 620){      //add 15 for every word
    background(255);
    fill(0);
    textSize(180);
    text("But",25,165);
  }
  if(count >= 635){
    background(255);
    fill(0);
    textSize(180);
    text("I",170,165);
  }
  if(count >= 650){
    background(255);
    fill(0);
    textSize(120);
    text("Can't",20,140);
  }
  if(count >= 665){
    background(255);
  }
//=============================== But I cant end [1]
//=============================== i hop
  if(count >= 675){
    fill(0);
    textSize(32);
    text("I hop",20,190);
    y2 = y2 - 5;
    if(y2 <= 185){
      y2 = y2 + 5;
    }
    text("and when I hop", 110,y2);
  }
  if(count >= 760){
    y3 = y3 - 1;
    y4 = y4 - 1;
    if(y4 <= 185){
      y4 = y4 + 1;
    }
    fill(255);
    rect(0,y3,400,y3);
    fill(0);
    textSize(28);
    text("I never get off the ground", 10, y4);
  }
  if(count >= 850){
    background(255);
    text("I never get off the ground", 10, 186);
  }
//=============================== i hop end
//=============================== my curse 
    if(count >= 880){      //add 15 for every word
    background(255);
    fill(0);
    textSize(50);
    text("It's my curse",25,120);
  }
  if(count >= 950){
    background(255);
    fill(0);
    textSize(40);
    text("My eternal curse",25,120);
  }
//===============================my curse end
//===============================
//===============================
//=============================== ears off [3]
  if(count >= 10000){            //takes about 350 to get big
    textSize(txt);
    txt = txt + .5;
    if(txt >= 150){
      textSize(150);
    }
    fill(0);
    if(count >= 10000){
      background(255);
      m = m +50;
      text("I WANT", 170-m,115);
    }
    m = 1;
    if(count >= 10055){
      background(255);
      m = m + 1;
      text("TO TAKE", 100-m,120);
    }
    if(count >= 10110){
      background(255);
      text("THE EARS", 35,125);
    }
    if(count >= 10140){
      background(255);
      text("OFF", 110,130);
    }
    if(count >= 1185){
      background(255);
      text("PLEASE!" ,10+random(10),150+random(10));
    }
    if(count >= 1220){
      background(255);
    }
  }
//=============================== ears off [3]
}



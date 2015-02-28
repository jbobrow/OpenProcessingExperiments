
int y=470;
int x=160; 
PImage Metro;

void setup () {
  size (555, 800);
  Metro = loadImage("Metro.jpg");
  println(y);
}
void draw() {
  background (loadImage("Metro.jpg"));
  stroke (0); 
  fill(188, 118, 118);
  rect (x, y, 5, 5);

  if (x>285 && x<300 && y>205 && y<220) {
    background (loadImage("Kitchen.jpg"));
  }
  if (x>155 && x<170 && y>595 && y<610) {
    background (loadImage("Bathroom.jpg"));
  }
  if (x>295 && x<310 && y>595 && y<610) {
    background (loadImage("KidsBedroom.jpg"));
  }
  if (x>155 && x<170 && y>205 && y<220) {
    background (loadImage("Toilets.jpg"));
  }
  if (x>285 && x<300 && y>465 && y<480) {
    background (loadImage("Livingroom.jpg"));
  }
  if (x>155 && x<170 && y>725 && y<740) {
    background (loadImage("FriendsBedroom.jpg"));
  }
  if (x>295 && x<310 && y>725 && y<740) {
    background (loadImage("ParentsBedroom.jpg"));
  }
  if (x>285 && x<300 && y>335 && y<350) {
    background (loadImage("Diningroom.jpg"));
  }
  if (x>155 && x<170 && y>335 && y<350) {
    background (loadImage("Office.jpg"));
  }
}

void keyPressed () {

  //ligne 1  
  if (keyCode == UP && (x>159 && x<165 && y>210 && y<740)) {
    y=y-10;
    println(y);
  }

  if (keyCode==DOWN && (x>159 && x<165 && y>209 && y<730)) {
    y=y+10;
    println(y);
  }

  //ligne 2
  if (keyCode==RIGHT && (x>159 && x<290 && y>209 && y<214)) {
    x=x+10;
    println(x);
  }
  if (keyCode==LEFT && (x>160 && y>209 && y<214)) {
    x=x-10;
    println(x);
  }

  //ligne3
  if (keyCode==UP && (x>289 && x<294 && y>210)) {
    y=y-10;
    println(y);
  }
  if (keyCode==DOWN && (x>288 && x<294 && y>209 && y<469)) {
    y=y+10;
    println(y);
  } 

  //ligne 4
  if (keyCode==RIGHT && (x>159 && x<289 && y>465 && y<474)) {
    x=x+10;
    println(x);
  }
  if (keyCode==LEFT && (x>160 && y>465 && y<474)) {
    x=x-10;
    println(x);
  }

  //ligne 5
  if (keyCode==RIGHT && (x>159 && x<300 && y>599 && y<604)) {
    x=x+10;
    println(x);
  }
  if (keyCode==LEFT && (x>160 && x<305 && y>599 && y<604) ) {
    x=x-10;
    println(x);
  }

  //ligne 6
  if (keyCode==UP && ( x>299 && x<305 && y>600 && y<735 )) {
    y=y-10;
    println(y);
  }
  if (keyCode==DOWN && (x>299 && x<305 && y>599 && y<725 )) {
    y=y+10;
    println(y);
  }
}



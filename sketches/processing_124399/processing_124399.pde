
int[][] grid, futureGrid;
int eraseRadius = 16; 
String typedText = "Type the words";
String [] message = {
  "Frankly, my dear, I don't give a damn.", 
  "I'm going to make him an offer he can't refuse.", 
  "You don't understand! I coulda had class. I coulda been a contender. I could've been somebody, instead of a bum, which is what I am.", 
  "Toto, I've got a feeling we're not in Kansas anymore.", 
  "Here's looking at you, kid.", 
  "Go ahead, make my day.", 
  "All right, Mr. DeMille, I'm ready for my close-up.", 
  "May the Force be with you.", 
  "Fasten your seatbelts. It's going to be a bumpy night.", 
  "You talkin' to me?", 
  "What we've got here is failure to communicate.", 
  "I love the smell of napalm in the morning.", 
  "Love means never having to say you're sorry.", 
  "The stuff that dreams are made of.", 
  "E.T. phone home.", 
  "They call me Mister Tibbs!", 
  "Rosebud.", 
  "Made it, Ma! Top of the world!", 
  "I'm as mad as hell, and I'm not going to take this anymore!", 
  "Louis, I think this is the beginning of a beautiful friendship.", 
  "A census taker once tried to test me. I ate his liver with some fava beans and a nice Chianti.", 
  "Bond. James Bond.", 
  "There's no place like home.", 
  "I am big! It's the pictures that got small.", 
  "Show me the money!", 
  "Why don't you come up sometime and see me?", 
  "I'm walking here! I'm walking here!", 
  "Play it, Sam. Play 'As Time Goes By.", 
  "You can't handle the truth!", 
  "I want to be alone.", 
  "After all, tomorrow is another day!", 
  "Round up the usual suspects.", 
  "I'll have what she's having.", 
  "You know how to whistle, don't you, Steve? You just put your lips together and blow.", 
  "You're gonna need a bigger boat.", 
  "Badges? We ain't got no badges! We don't need no badges! I don't have to show you any stinking badges!", 
  "I'll be back.", 
  "Today, I consider myself the luckiest man on the face of the earth.", 
  "If you build it, he will come.", 
  "Mama always said life was like a box of chocolates. You never know what you're gonna get.", 
  "We rob banks.", 
  "Plastics.", 
  "We'll always have Paris.", 
  "I see dead people.", 
  "Stella! Hey, Stella!", 
  "Oh, Jerry, don't let's ask for the moon. We have the stars.", 
  "Shane. Shane. Come back!", 
  "Well, nobody's perfect.", 
  "It's alive! It's alive!", 
  "Houston, we have a problem.", 
  "You've got to ask yourself one question: 'Do I feel lucky?' Well, do ya, punk?", 
  "You had me at 'hello.'", 
  "One morning I shot an elephant in my pajamas. How he got in my pajamas, I don't know.", 
  "There's no crying in baseball!", 
  "La-dee-da, la-dee-da.", 
  "A boy's best friend is his mother.", 
  "Greed, for lack of a better word, is good.", 
  "Keep your friends close, but your enemies closer.", 
  "As God is my witness, I'll never be hungry again.", 
  "Well, here's another nice mess you've gotten me into!", 
  "Say 'hello' to my little friend!", 
  "What a dump.", 
  "Mrs. Robinson, you're trying to seduce me. Aren't you?", 
  "Gentlemen, you can't fight in here! This is the War Room!", 
  "Elementary, my dear Watson.", 
  "Get your stinking paws off me, you damned dirty ape.", 
  "Of all the gin joints in all the towns in all the world, she walks into mine.", 
  "Here's Johnny!", 
  "They're here!", 
  "Is it safe?", 
  "Wait a minute, wait a minute. You ain't heard nothin' yet!", 
  "No wire hangers, ever!", 
  "Mother of mercy, is this the end of Rico?", 
  "Forget it, Jake, it's Chinatown.", 
  "I have always depended on the kindness of strangers.", 
  "Hasta la vista, baby.", 
  "Soylent Green is people!", 
  "Open the pod bay doors please, HAL.", 
  "Surely you can't be serious. I am serious...and don't call me Shirley.", 
  "Yo, Adrian!", 
  "Hello, gorgeous.", 
  "Toga! Toga!", 
  "Listen to them. Children of the night. What music they make.", 
  "Oh, no, it wasn't the airplanes. It was Beauty killed the Beast.", 
  "My precious.", 
  "Attica! Attica!", 
  "Sawyer, you're going out a youngster, but you've got to come back a star!", 
  "Listen to me, mister. You're my knight in shining armor. Don't you forget it. You're going to get back on that horse, and I'm going to be right behind you, holding on tight, and away we're gonna go, go, go!", 
  "Tell 'em to go out there with all they got and win just one for the Gipper.", 
  "A martini. Shaken, not stirred.", 
  "Who's on first?", 
  "Cinderella story. Outta nowhere. A former greenskeeper, now, about to become the Masters champion. It looks like a mirac...It's in the hole! It's in the hole! It's in the hole!", 
  "Life is a banquet, and most poor suckers are starving to death!", 
  "I feel the need—the need for speed!", 
  "Carpe diem. Seize the day, boys. Make your lives extraordinary.", 
  "Snap out of it!", 
  "My mother thanks you. My father thanks you. My sister thanks you. And I thank you.", 
  "Nobody puts Baby in a corner.", 
  "I'll get you, my pretty, and your little dog too!", 
  "I'm the king of the world!"
};
PFont font;
PImage img;
float xpos;
float ypos;

int xcoord = 150;
int ycoord = 200;
int xcoord2 = 200;
int ycoord2 = 40;
int xspeed = 1;
int yspeed = 2;
int xspeed2 = 2;
int yspeed2 = 4;

int index = 99;
int textSize;
int points;
int lives=25;
int curIndex = 0;
int counter = 0;
String result = "";
float i = 0.25;
int inc = 1;

void setup() {
  size(1000, 900, P2D);
  noSmooth();
  frameRate(45);    // 속도조절 
  grid = new int[width][height];
  futureGrid = new int[width][height];
  float density = 0.1 * width * height;   //밀도 
  for (int i = 0; i < density; i++) {
    grid[int(random(width))][int(random(height))] = 1;
  }
  img = loadImage("motive.png");
  background(0);
  font = loadFont("AgencyFB-Bold-48.vlw");
  xpos = width;
  ypos = height;
}

//255= white, 0=black

void draw() {
  int random = int(random(message.length - 1));
  textSize = 40;
  //background(0);
  xcoord = xcoord + xspeed;
  ycoord = ycoord + yspeed;
  xcoord2 = xcoord2 + xspeed2;
  ycoord2 = ycoord2 + yspeed2;
  fill(0);
  textFont(font, textSize);
  textAlign(LEFT);
  fill(255);
  text("Points: "+points, width - textWidth("Points: " + points), textSize);
  fill(200, 20, 0);
  text("Lives: "+lives, width - textWidth("Lives: " + lives), 2 * textSize);
  fill(255);
  textFont(font, 23);
  text("AFI's 100 Years...100 Movie Quotes", width-textWidth("AFI's 100 Years...100 Movie Quotes"), height);
  textFont(font, 42);
  textAlign(CENTER);
  text("Type the sentences, and erase blur with mousedraging", width/2, height/2);
  textAlign(LEFT);
  textFont(font, textSize);
  fill(250, 244, 192);
  text(message[index], xcoord, ycoord); //문제 텍스트 
  fill(92, 209, 229);
  text(message[index].substring(0, curIndex), xcoord, ycoord);  //타이핑 확인 색상 변환

  if (xcoord > 755) {
    xspeed = -1;
  }
  if (xcoord < 0) {
    xspeed = 1;
  }
  if (ycoord > 700) {
    yspeed = -2;
  }
  if (ycoord < 30) {
    yspeed = 2;
  }
  if (xcoord2 > 400) {
    xspeed2 = -2;
  }
  if (xcoord2 < 0) {
    xspeed2 = 2;
  }
  if (ycoord2 > 400) {
    yspeed2 = -4;
  }
  if (ycoord2 < 0) {
    yspeed2 = 4;
  }

  ypos = ypos+i;
  int a = textSize;
  if ( ypos > height + textSize) {

    println("This is i: " + i);
    reset();
  }
  if (lives < 0) {
    gameOver();
  }



  //255= white, 0=black
  for (int x = 1; x < width -1; x++) {
    for (int y = 1; y < height - 1; y++) {
      int range = 5;
      int nb = neighbors(5, x, y);
      if ((grid[x][y] == 1) && (nb < round(range - 5))) {
        futureGrid[x][y] = 0;
        set(x, y, color(255));
      } 
      else if ((grid[x][y] == 0) && (nb == round(range))) {
        futureGrid[x][y] = 1;
        set(x, y, color(0));  //회복되는 모자이크 점색
      } 
      else if ((grid[x][y] == 1) && (nb > range + 6)) {
        futureGrid[x][y] = 0;
        set(x, y, color(0));  //지우개 잔상 색
      } 
      else if ((grid[x][y] == 2)) {
        futureGrid[x][y] = 1;
        set(x, y, color(255)); // 뒷 지우개 색
      } 
      else { 
        futureGrid[x][y] = grid[x][y];
      }
    }
  }

  int [][] temp = grid;
  grid = futureGrid;
  futureGrid = temp;
}

int neighbors(int range, int x, int y) {
  int total = 0;
  for (int i = 1; i < range; i++) {
    int north = (y + height - i) % height;
    int south = (y + i) % height;
    int east = (x + i) % width;
    int west = (x + width - i) % width;
    total += grid[x][north] +
      grid[east][north] +
      grid[east][y] +
      grid[east][south] +
      grid[x][south] +
      grid[west][south] +
      grid[west][y] +
      grid[west][north];
  }
  return total;
}

void mouseDragged() {

  eraseRadius = eraseRadius+1; // 지우개 크기 증가

  for (int x = mouseX - eraseRadius; x < mouseX + eraseRadius; x++) {
    for (int y = mouseY - eraseRadius; y < mouseY + eraseRadius; y++) {
      int sx = constrain(x, 1, width -1);
      int sy = constrain(y, 1, height -1);
      grid[sx][sy] = 2;
      set(sx, sy, color(255)); //지우개 앞 색
    }
  }
}

void mouseReleased() {
  eraseRadius = 16;
}

void keyPressed() {
  String s = message[index];

  if (keyPressed) {
    if (key == s.charAt(curIndex)) {
      curIndex++;
      points = points + 5;
      result = "" + key;
    }
    if (keyPressed && curIndex >= s.length()) {
      if (keyPressed)
        counter++;
      if (counter==0|| counter ==1) {
        curIndex = curIndex-1;
        lives = lives + 1;
        points = points + 100;
        reset();
      }
      else {         
        curIndex = curIndex-1;
        points = points - 5;
      }
    }
  }
}

void reset() {
  inc++;
  i = i + (1.000000005/inc);
  ypos = 1;
  index = (index+1) % message.length;
  lives = lives-1;
  curIndex = 0;
  counter = 0;
  result = "";
  background(0);
}

void gameOver() {
  textFont(font, 50);
  fill(255, 0, 0);
  textAlign(CENTER);
  text("YOU LOSE", width/2, height/4);
  noLoop();
}




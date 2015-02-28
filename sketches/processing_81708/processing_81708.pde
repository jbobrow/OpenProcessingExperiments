
PFont font;
PImage startImg;
PImage album;
PImage StartBackground;
PImage FamilyBackground;
PImage FriendsBackground;
PImage PersonBackground;
PImage addressBook;
//Levels
boolean mouseRel = false;
boolean click = false;
boolean level0 = true;
boolean level1 = false;
boolean level2a = false;
boolean level2b = false;
boolean level3 = false;
boolean levelPB = false;
//other variables
int i = 0;
int person = 0;
String twitter = "no twitter feed avilable";
String twitter1 = "";
String twitter2 = "";
//friends
PImage [] chick; 
PImage [] mar; 
PImage [] maria;
//family
PImage[] marcus;
PImage[] maria2;
PImage[] tristan;
PImage [] [] pictures;
PImage [] coms;

void setup() {
  size(1200, 600);
  font = loadFont("SnowWhite-48.vlw");
  textFont(font, 19);
  StartBackground = loadImage("table.jpg");
  startImg = loadImage("album_closed.jpg");
  album = loadImage("Photo_album_FF.jpg");
  FamilyBackground = loadImage("Photo_album_Family.jpg");
  FriendsBackground = loadImage("Photo_album_Friends.jpg");
  PersonBackground = loadImage ("Photo_album_Person2.jpg");
  addressBook = loadImage("addressBook.jpg");
  //Friends Pictures / chick
  chick = new PImage [6];
  chick [0] = loadImage("gran pics/friends/chick1.jpg");
  chick [1] = loadImage("gran pics/friends/chick2.jpg");
  chick [2] = loadImage("gran pics/friends/chick3.jpg");
  chick [3] = loadImage("gran pics/friends/chick4.jpg");
  chick [4] = loadImage("gran pics/friends/chick5.jpg");
  chick [5] = loadImage("gran pics/friends/chick6.jpg");
  //Friends Pictures / margret
  mar = new PImage [6];
  mar [0] = loadImage("gran pics/friends/margret1.jpg");
  mar [1] = loadImage("gran pics/friends/margret2.jpg");
  mar [2] = loadImage("gran pics/friends/margret3.jpg");
  mar [3] = loadImage("gran pics/friends/margret4.jpg");
  mar [4] = loadImage("gran pics/friends/margret5.jpg");
  mar [5] = loadImage("gran pics/friends/margret6.jpg");
  //Friends Pictures / margret
  maria = new PImage [6];
  maria [0] = loadImage("gran pics/friends/maria1.jpg");
  maria [1] = loadImage("gran pics/friends/maria2.jpg");
  maria [2] = loadImage("gran pics/friends/maria3.jpg");
  maria [3] = loadImage("gran pics/friends/maria4.jpg");
  maria [4] = loadImage("gran pics/friends/maria5.jpg");
  maria [5] = loadImage("gran pics/friends/maria6.jpg");
  //Family / marcus
  marcus = new PImage [6];
  marcus [0] = loadImage("gran pics/Family/marcus1.jpg");
  marcus [1] = loadImage("gran pics/Family/marcus2.jpg");
  marcus [2] = loadImage("gran pics/Family/marcus3.jpg");
  marcus [3] = loadImage("gran pics/Family/marcus4.jpg");
  marcus [4] = loadImage("gran pics/Family/marcus5.jpg");
  marcus [5] = loadImage("gran pics/Family/marcus6.jpg");
  //Family maria2
  maria2 = new PImage [6];
  maria2 [0] = loadImage("gran pics/Family/maria1.jpg");
  maria2 [1] = loadImage("gran pics/Family/maria2.jpg");
  maria2 [2] = loadImage("gran pics/Family/maria3.jpg");
  maria2 [3] = loadImage("gran pics/Family/maria4.jpg");
  maria2 [4] = loadImage("gran pics/Family/maria5.jpg");
  maria2 [5] = loadImage("gran pics/Family/maria6.jpg");
  //Family Tristan
  tristan = new PImage [6];
  tristan [0] = loadImage("gran pics/Family/tristan1.jpg");
  tristan [1] = loadImage("gran pics/Family/tristan2.jpg");
  tristan [2] = loadImage("gran pics/Family/tristan3.jpg");
  tristan [3] = loadImage("gran pics/Family/tristan4.jpg");
  tristan [4] = loadImage("gran pics/Family/tristan5.jpg");
  tristan [5] = loadImage("gran pics/Family/tristan6.jpg");
  pictures = new PImage [6] [];
  pictures [0] = chick;
  pictures [1] = mar;
  pictures [2] = maria;
  pictures [3] = marcus;
  pictures [4] = maria2;
  pictures [5] = tristan;
  //comments
  coms = new PImage [6];
  coms [0] = loadImage("gran pics/addressCom/chickCom.jpg");
  coms [1] = loadImage("gran pics/addressCom/margretCom.jpg");
  coms [2] = loadImage("gran pics/addressCom/mariaCom.jpg");
  coms [3] = loadImage("gran pics/addressCom/marcusCom.jpg");
  coms [4] = loadImage("gran pics/addressCom/maria2Com.jpg");
  coms [5] = loadImage("gran pics/addressCom/tristanCom.jpg");
}
int counter = 0;
int counterMax = 25;
void draw() {
  if (mouseRel) {
    if (counter > 0) {
      counter--;
    }
    else {
      mouseRel = false;
    }
  }
  if (level0 == true) {
    start1();
  } 
  else if (level1 == true) {
    famFriend();
  }
  else if (levelPB == true) {
    phoneBook();
  }
  else if (level3 == true) {
    person();
  }
  else if (level2a == true) {
    friends();
  }
  else if (level2b == true) {
    fam();
  }
}
void mouseReleased() {
  if (mouseRel == false) {
    mouseRel = true;
    counter = counterMax;
  }
  else {
    mouseRel = false;
  }
}
void start1() {
  image(StartBackground, 0, 0);
  rect(650, 50, 500, 500);
  image(startImg, 650, 50);
  if (mouseX > 650 && mouseY >50 && mouseX < 1150 && mouseY < 550 && mouseRel == true) {
    level0 = false;
    level1 = true;
    mouseRel = false;
  }
}
void famFriend() {
  image(album, 0, 0);
  //BackButton
  if (mouseX > 1074 && mouseY > 540 && mouseX < 1194 && mouseY < 592 && mouseRel == true) {
    level1 = false;
    level0 = true;
    mouseRel = false;
  }
  //Friends
  if (mouseX > 279 && mouseY > 274 && mouseX < 873 && mouseY < 478 && mouseRel == true) {
    twitter = "https://twitter.com/datavisfriends";
    twitterScrape();
    level1 = false;
    level2a = true;
    mouseRel = false;
  }
  //family
  if (mouseX > 885 && mouseY > 71 && mouseX < 1079 && mouseY < 276 && mouseRel == true) {
    twitter = "https://twitter.com/datavisfamily";
    twitterScrape();
    level1 = false;
    level2b = true;
    mouseRel = false;
  }
}
void fam() {
  image(FamilyBackground, 0, 0);
  //backButton
  if (mouseX > 1074 && mouseY > 540 && mouseX < 1194 && mouseY < 592 && mouseRel == true) {
    level2b = false;
    level1 = true;
    mouseRel = false;
  }
  //Marcus == 3
  if (mouseX > 675 && mouseY > 72 && mouseX < 1083 && mouseY < 178 && mouseRel == true) {
    person = 3;
    level3 = true;
    mouseRel = false;
  }
  //Maria2 == 4
  if (mouseX > 675 && mouseY > 237 && mouseX < 1083 && mouseY < 343 && mouseRel == true) {
    person = 4;
    level3 = true;
    mouseRel = false;
  }
  //Tristan == 5
  if (mouseX > 675 && mouseY > 400 && mouseX < 1083 && mouseY < 504 && mouseRel == true) {
    person = 5;
    level3 = true;
    mouseRel = false;
  }
}
void friends() {
  image(FriendsBackground, 0, 0);
  //backButton
  if (mouseX > 1074 && mouseY > 540 && mouseX < 1194 && mouseY < 592 && mouseRel == true) {
    level2a = false;
    level1 = true;
    mouseRel = false;
  }
  //chick == 0
  if (mouseX > 675 && mouseY > 72 && mouseX < 1083 && mouseY < 178 && mouseRel == true) {
    person = 0;
    level3 = true;
    mouseRel = false;
  }
  //margret == 1
  if (mouseX > 675 && mouseY > 237 && mouseX < 1083 && mouseY < 343 && mouseRel == true) {
    person = 1;
    level3 = true;
    mouseRel = false;
  }
  //maria == 2
  if (mouseX > 675 && mouseY > 400 && mouseX < 1083 && mouseY < 504 && mouseRel == true) {
    person = 2;
    level3 = true;
    mouseRel = false;
  }
}
void person() {
  //local variables
  int x1 = 839;
  int y1 = 100;
  int x2 = 820;
  int y2 = 220;
  int x3 = 839;
  int y3 = 385;
  int smallX= 90;
  int smallY = 100;
  int largeX = 130;
  int largeY = 150;
  PImage temp;
  image(PersonBackground, 0, 0);
  //twitter
  fill(22, 3, 67);
  text(twitter1, 70, 460);
  text(twitter2, 70, 520);
  //backButton
  if (mouseX > 1074 && mouseY > 540 && mouseX < 1194 && mouseY < 592 && mouseRel == true) {
    click = false;
    level3 = false;
    mouseRel = false;
  }
  //PhoneBook
  if (mouseX > 510 && mouseY > 331 && mouseX < 580 && mouseY < 403 && mouseRel == true) {
    levelPB = true;
    level3 = false;
    mouseRel = false;
  }
  //large pic (press the space bar to exit out
  if (click == true) {
    image(PersonBackground, 0, 0);
    text(twitter1, 70, 460);
    text(twitter2, 70, 520);
    x2 = 670 ;
    y2 = 111;
    largeX = 416;
    largeY = 369;
    image(pictures [person] [1], x2, y2, largeX, largeY);
    if (keyPressed) {
      if (key == ' ' || key == ' ') {
        click = false;
        mouseRel = false;
      }
    }
  }
  else if (click == false) {
    image(pictures [person] [0], x1, y1, smallX, smallY);
    image(pictures [person] [1], x2, y2, largeX, largeY);
    image(pictures [person] [2], x3, y3, smallX, smallY);
    //spin the images top to bottom
    if (mouseX > 839 && mouseY > 100 && mouseX < 929 && mouseY < 200 && mouseRel == true) {
      temp = pictures [person] [5];
      for (i = 5; i > 0; i--) {
        pictures [person] [i] = pictures [person] [i-1];
      }
      pictures [person] [0] = temp;
      mouseRel = false;
    }
    //spin the images bottom to top
    if (mouseX > 839 && mouseY > 385 && mouseX < 929 && mouseY < 485 && mouseRel == true) {
      temp = pictures [person] [0];
      for (i = 0; i < 5; i++) {
        pictures [person] [i] = pictures [person] [i+1];
      }
      pictures [person] [5] = temp;
      mouseRel = false;
    }
    //large picture dimensions
    if (mouseX > 820 && mouseY > 220 && mouseX < 950 && mouseY < 370  && mouseRel == true) {
      click = true;
      mouseRel = false;
    }
  }
}
void phoneBook() {
  image(addressBook, 0, 0);
  image(coms[person], 0, 329);
  image(pictures [person] [0], 670, 111, 416, 369);
  int count = 0;
  int textX = 70;
  int textY = 100;

  if (mouseX > 1074 && mouseY > 540 && mouseX < 1194 && mouseY < 592 && mouseRel == true) {
    level3 = true;
    levelPB = false;
    mouseRel = false;
  }
  //loads the phonebook
  String [] page = loadStrings("phoneBook.txt");
  String [] indi = split(page[person], ",");
  for (int i = 0; i<7; i++) {
    text(indi[i], textX, textY+(i*30));
  }
}
void twitterScrape() {
  try {
    String [] page = loadStrings(twitter);
    // a string to put the put the whole page in 
    String wholePage = "";
    // this fixed loop will step thorgh the first quarter of the web pages source
    for (int i=0; i<page.length;i++) {
      //this line adds all the lines to one big String
      wholePage += page[i];
    }
    // this is to the left of the text we want
    String [] bit = split(wholePage, "<p class=\"js-tweet-text\">"); 
    // now cut what remains about the closing p tag
    String[] nextBit = split(bit[1], "</p>");
    // cut out the next part
    String [] otherBit = split(bit[2], "</p>");
    twitter1 = nextBit[0];
    twitter2 = otherBit[0];
  }
  catch(Exception e) {
    twitter1 = twitter;
    twitter2 = twitter;
  }
}



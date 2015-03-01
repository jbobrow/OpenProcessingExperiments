
//Arthur Luo//

//Self portrait//

PImage sand , gamer_icon , book_icon , gamer , reader;
PFont myFont;

void setup(){
  size(800,600);
  gamer = loadImage("playing.jpg");
  reader = loadImage("reading.jpg");
  book_icon = loadImage("book.jpg");
  gamer_icon = loadImage("console.jpg");
  myFont = createFont("Aharoni-bold",18);
  textFont(myFont);
  sand = loadImage("sand.jpg");
}

void draw(){
  image(sand,0,0);
  image(gamer_icon,130,150);
  image(book_icon,530,150);
  fill(0,0,0);
  text("FREEDOMHONORLOVEPERFECTIONADVENTURESELFESTEEM",120,450);
  text("FAMILYFRIENDSMYPETSPEOPLEWHOHAVEHELPEDME",155,420);
  text("GAMESMUSICSTORIESMOVIESCOOKING",199,390);
  text("I am all of those things,but in",260,360);
  text("the end, who am 'I'?",290,330);
  text("A gamer or a",310,300);
  text("Reader ?",330,270);
  text("WHO",345,240);
  text("AM",352,210);
  text("I",364,180);
  text("?",364,150);
  if(mouseX>=130 && mouseX<=230 && mouseY>=150 && mouseY<=242){
    if(mousePressed == true){
      image(gamer,0,0);
    }
  }
  if(mouseX>=530 && mouseX<=630 && mouseY>=150 && mouseY<=283){
    if(mousePressed == true){
      image(reader,0,0);
    }
  }
    }


    //if(mousePressed==true){
     // image(playing,0,0);//



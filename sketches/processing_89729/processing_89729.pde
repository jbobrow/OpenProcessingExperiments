
PImage img;
String[] catcherLines;
String[] catcherWords;
color[] textColor = {#30C11D,#F597AD,#B4E3FF,#FCF4B2,#F5A097,#FCB2ED,#D3FCB2,#FFFFFF};
float counter;

void setup() {
  size(300,500);
  catcherLines=loadStrings("Catcher.txt");
  String catcherBook=join(catcherLines," ");
  catcherWords=splitTokens(catcherBook, " ,.?!:;[]-\"");
  img = loadImage("SKY.JPG");
}

void draw() {
  pushMatrix();
  scale(0.2,0.3);
  image(img,0,0);
  popMatrix();
  fill(textColor[int(random(3,5))]);
  textSize(30);
  text("The Catcher in the Rye",10,80);
  String theWord = catcherWords[int(counter)];
  frameRate(7);
  if(theWord.length()>=5) {
  fill(textColor[int(random(0,8))]);
  translate(-100,50);
  textSize(random(20,80));
  text(theWord,mouseX,mouseY);

  }
  counter ++;
}



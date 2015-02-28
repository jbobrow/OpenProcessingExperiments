
PImage img;
String[] catcherLines;
String[] catcherWords;
color[] textColor = {#30C11D,#F597AD,#B4E3FF,#FCF4B2,#F5A097,#FCB2ED,#D3FCB2,#FFFFFF};
float counter;

void setup() {
  size(400,550);
  catcherLines=loadStrings("Catcher.txt");
  String catcherBook=join(catcherLines," ");
  catcherWords=splitTokens(catcherBook, " ,.?!:;[]-\"");
  img = loadImage("SKY.jpg");
}

void draw() {
  pushMatrix();
  scale(0.7,0.8);
  image(img,0,0);
  popMatrix();
  fill(textColor[int(random(3,5))]);
  textSize(30);
  text("The Catcher in the Rye",10,70);
  String theWord = catcherWords[int(counter)];
  frameRate(10);
  if(theWord.length()>=5) {
  fill(textColor[int(random(0,8))]);
  translate(-50,20);
  textSize(random(20,50));
  text(theWord,mouseX,mouseY);

  }
  counter ++;
}



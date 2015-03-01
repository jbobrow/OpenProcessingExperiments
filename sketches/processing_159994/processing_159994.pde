
//displaying text

size(600,200);
background(0);

//String firstText = "Hello, World!";
//fill(#FE2424);
//textAlign(CENTER, CENTER);
//text(firstText, width/2, height/2);

String firstText = "iBlock Games"; //content of text that will be displayed
int score1 = 0;

//preparing font to be used
PFont coolFont;
coolFont = loadFont("MineCrafter-3-20.vlw");
textFont (coolFont);
textAlign(CENTER, CENTER);
fill(#FE2424);

//the text will actually be draw
text(score1, width/2, height/2);
text(firstText, width/3, height/3);




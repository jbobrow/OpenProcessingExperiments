
//display text 

size(600, 600); 
background(0);

//simple 
//String firstText = "Hello, World!"; 
//fill(#37D876);
//textAlign(CENTER, CENTER); 
//text(firstText, width/2, height/2); 

//preparing font to be used 
String firstText = "Hello, World!"; 
PFont coolFont;
coolFont = loadFont("LithosPro-Regular-20.vlw");
textFont (coolFont); 
textAlign(CENTER, CENTER); 
text(firstText, width/2, height/2); 

//the text will actually be drawn





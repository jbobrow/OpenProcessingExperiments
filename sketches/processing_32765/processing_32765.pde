


PFont myFont;
PFont myFont2;
PFont tryFont;

void setup() {
  size(500, 500);
  background(147, 149, 152);

  myFont = createFont("Helvetica", 19, true);
  //  tryFont = loadFont("Helvetica-60".view);

  myFont2 = createFont("Century", 19, true);
  //  tryFont = loadFont("Helvetica-60".view);  
  
  textFont(myFont);
  fill(69, 199, 240); 
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 53);
  fill(133, 208, 206);
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 96);
  fill(111, 204, 221);  
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 139);
  fill(74, 198, 215);  
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 181);
  fill(115, 197, 152);   
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 224);
  fill(162, 204, 221);  
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 266);
  fill(115, 198, 157);  
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 309);
  fill(149, 215, 224);  
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 352);
  fill(69, 189, 211);  
  text("THIS IS TYPE EXPERCISE IN THE PROCESSING.", 29, 395);

  textFont(myFont2);  
  fill(188, 190, 192);  
  text("by Awesomeness", 29, 442);
  
}


//void() {
//
//}




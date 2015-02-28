
// Typography 1: Display
// Exercises

size(500,500);
background(255);

PFont f1, f2, f3;
f1 = loadFont("Monospaced-48.vlw");
f2 = loadFont("ClementePDae-Light-48.vlw");
f3 = loadFont("Corbel-Italic-48.vlw");

for (int a = 0; a < 700; a += 30) {
  textFont(f1);
  textAlign(CENTER);
  fill(0,30);
  textSize(a);
  text('W',width*0.5,height);
}

for (int b = 0; b < 500; b += 10) {
  textFont(f1);
  textAlign(CENTER);
  fill(255,100);
  textSize(12);
  String women = "It's International Women's Day It's International Women's Day";
  text(women,width*0.5,b*2);
}

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
String macbeth1 = "My dearest love,";
String macbeth2 = "Duncan comes here to-night";
text(macbeth1,width,10);
text(macbeth2,width,20);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
String lady1 = "And when goes hence?";
text(lady1,0,30);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
String macbeth3 = "To-morrow, as he purposes.";
text(macbeth3,width,40);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
String lady2 = "O,never";
String lady3 = "Shall sun that morrow see!";
String lady4 = "Your face, my thane, is as a book where men";
String lady5 = "May read strange matters. To beguile the time";
String lady6 = "Look like the time; bear welcome in your eye";
String lady7 = "Your hand, your tongue: look like the innocent flower,";
String lady8 = "But be the serpent under't. He that's coming";
String lady9 = "Must be provided for: and you shall put";
String lady10 = "This night's great business into my dispath";
String lady11 = "Which shall to all our nights and days to come";
String lady12 = "Give solely sovereign sway and masterdom";
text(lady2,0,50);
text(lady3,0,60);
text(lady4,0,70);
text(lady5,0,80);
text(lady6,0,90);
text(lady7,0,100);
text(lady8,0,110);
text(lady9,0,120);
text(lady10,0,130);
text(lady11,0,140);
text(lady12,0,150);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
text(macbeth1,width,160);
text(macbeth2,width,170);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
text(lady1,0,180);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
text(macbeth3,width,190);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
text(lady2,0,200);
text(lady3,0,210);
text(lady4,0,220);
text(lady5,0,230);
text(lady6,0,240);
text(lady7,0,250);
text(lady8,0,260);
text(lady9,0,270);
text(lady10,0,280);
text(lady11,0,290);
text(lady12,0,300);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
text(macbeth1,width,310);
text(macbeth2,width,320);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
text(lady1,0,330);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
text(macbeth3,width,340);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
text(lady2,0,350);
text(lady3,0,360);
text(lady4,0,370);
text(lady5,0,380);
text(lady6,0,390);
text(lady7,0,400);
text(lady8,0,410);
text(lady9,0,420);
text(lady10,0,430);
text(lady11,0,440);
text(lady12,0,450);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
text(macbeth1,width,460);
text(macbeth2,width,470);

textFont(f3);
textAlign(LEFT);
fill(0,150);
textSize(10);
text(lady1,0,480);

textFont(f1);
textAlign(RIGHT);
fill(0,150);
textSize(10);
text(macbeth3,width,490);

textFont(f2);
textAlign(CENTER);
fill(255);
textSize(55);
String queen = "All Hail the Queen";
text(queen,width*0.5,height*0.55);



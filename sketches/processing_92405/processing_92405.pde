
/* @pjs font="PontanoSans-Regular.ttf"; */

// CANDYMAN
// by, John Austin Robbins II
// Press the 1 - 9 keys to advance the slides
// Q, W, and E are the last slides of the sketch



int myState = 0 ;
PImage bg;
PFont myFont;
String a = "The legend goes, that in 1731 on a plantation in an unknown town of Mississippi that there was once a young slave. His name was Daniel Robataille...";
String b = "Daniel was very talented. His mother who had been an artist known far and wide in her village had taught him to paint at an early age." ;
String c = "Daniel's painting skills had not gone unnoticed however. The plantation owner one day had caught him painting a beautiful masterpiece upon the side of a rock one night" ;
String d = "Delighted with the discovery he forced Daniel to paint a picture of his daughter..." ;
String e = "Daniel did as he was told. But, after much time spent with the girl, he fell in love with her." ;
String f = "The plantation owner was furious and in a fit of rage he gathered a group of men with guns, and their dogs and chased Daniel into the swamps." ;
String g = "After many hours, they finally caught Daniel. They beat him, cut off his hand, and dragged him back to the farm before they covered him in honey and tossed him into a beehive.";
String h = "When his mother found out what had happened to Daniel, she cursed the plantation owner and slipped into a deep fit of depressed. She died a week later of sorrow." ;
String i = "Exactly one year later to the day, the plantation owner, and everyone who was involved on that fateful night were found gruesomely murdered." ;
String j = "It is said, that before they threw Daniel into the beehive they mocked him by calling him Candyman while drenching him with honey." ;
String k = "From then on, it is said that if you stand near water while saying or even thinking the words Candyman three times..." ;
String l = "that Daniel and his dead mother would reappear behind you while in a fit of blind rage and exact their revenge against those who had caused them so much pain." ;

void setup()  {
   
  size(700,200);
  textAlign(LEFT);
  bg = loadImage("background.jpg");
 myFont = createFont("PontanoSans-Regular.ttf", 120);
 
 // font = loadFont("PontanoSans-Regular-125.vlw");
 
image(bg, 0, 0);
}



void draw()  {
  

  if (keyPressed) {
    if (key == '1' || key == '1') {
      myState = 0 ;
    };
       if (key == '2' || key == '2') {
      myState = 1 ;
    };
      if (key == '3' || key == '3') {
      myState = 2 ;
    };
       if (key == '4' || key == '4') {
      myState = 3 ;
    };
       if (key == '5' || key == '5') {
      myState = 4 ;
    };
       if (key == '6' || key == '6') {
      myState = 5 ;
    };
       if (key == '7' || key == '7') {
      myState = 6 ;
    };
       if (key == '8' || key == '8') {
      myState = 7 ;
    };
       if (key == '9' || key == '9') {
      myState = 8 ;
    };
       if (key == 'q' || key == 'Q') {
      myState = 9 ;
    };
       if (key == 'w' || key == 'W') {
      myState = 10 ;
    };
       if (key == 'e' || key == 'E') {
      myState = 11 ;
    };
  }

  
switch(myState){
case 0:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(a, 15, 10, 550, 180);  // Textwrap




 
break;


case 1:
   image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(b, 15, 10, 550, 180);  // Textwrap
break; 

case 2:
   image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 30);
text(c, 15, 10, 550, 180);  // Textwrap
break; 

case 3:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(d, 15, 10, 550, 180);  // Textwrap
break; 

case 4:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(e, 15, 10, 550, 180);  // Textwrap
break; 
case 5:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(f, 15, 10, 550, 180);  // Textwrap
break; 
case 6:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 31);
text(g, 15, 10, 550, 180);  // Textwrap
break; 
case 7:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 30);
text(h, 15, 10, 550, 180);  // Textwrap
break; 
case 8:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(i, 15, 10, 550, 180);  // Textwrap
break;
case 9:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(j, 15, 10, 550, 180);  // Textwrap
break; 
case 10:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 32);
text(k, 15, 10, 550, 180);  // Textwrap
break; 
case 11:
  image(bg, 0, 0, width, height);
  fill(#000000);
  textFont(myFont, 58);
  text("Hive", width-120, height-20);
  rect(10, height-10, 680, 3); // UNDERLINE

noStroke();
fill(0, 170); // Color of box behind text
rect(10, 5, 560, 170, 10); // Black box behind text

fill(#fab02d);
textFont(myFont, 31);
text(l, 15, 10, 550, 180);  // Textwrap
break; 
}
}










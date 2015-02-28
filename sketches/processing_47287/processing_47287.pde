
PImage imgx;
PImage imgp;
PImage imgh;
PImage imgr;
PImage imgs;
PFont font;
PFont font2; 

void setup() {
  size(750, 750);
  smooth();
  imgx = loadImage ("Christmasw.png");
  imgp = loadImage ("presant.png");
  imgh = loadImage ("holly1.png");
  imgr = loadImage ("reindeer.png");
  imgs = loadImage ("santa.png");
  font = loadFont("Apple-Chancery-30.vlw");
  font2 = loadFont("AdobeMyungjoStd-Medium-48.vlw");
   textFont(font, 10);
   frameRate(1);
  
}

void draw() { 
  background(0);
  image(imgx, 0, 0, width, height);
  image(imgp, 40, 20, 80, 80);
  image(imgp, 150, 20, 80, 80);
  image(imgp, 260, 20, 80, 80);
  image(imgp, 370, 20, 80, 80);
  image(imgp, 480, 20, 80, 80);
  image(imgp, 40, 100, 80, 80);
  image(imgp, 150, 100, 80, 80);
  image(imgp, 260, 100, 80, 80);
  image(imgp, 370, 100, 80, 80);
  image(imgp, 480, 100, 80, 80);
  image(imgp, 40, 180, 80, 80);
  image(imgp, 150, 180, 80, 80);
  image(imgp, 260, 180, 80, 80);
  image(imgp, 370, 180, 80, 80);
  image(imgp, 480, 180, 80, 80);
  image(imgp, 40, 260, 80, 80);
  image(imgp, 150, 260, 80, 80);
  image(imgp, 260, 260, 80, 80);
  image(imgp, 370, 260, 80, 80);
  image(imgp, 480, 260, 80, 80);
  image(imgp, 40, 340, 80, 80);
  image(imgp, 150, 340, 80, 80);
  image(imgp, 260, 340, 80, 80);
  image(imgp, 370, 340, 80, 80);
  image(imgp, 480, 340, 120, 120);
  fill(255);
  textFont(font, 15);
  text("1st", 70, 70);
  text("2nd", 180, 70);
  text("3rd", 290, 70);
  text("4th", 400, 70);
  text("5th", 510, 70);
  text("6th", 70, 150);
  text("7th", 180, 150);
  text("8th", 290, 150);
  text("9th", 400, 150);
  text("10th", 510, 150);
  text("11th", 70, 230);
  text("12th", 180, 230);
  text("13th", 290, 230);
  text("14th", 400, 230);
  text("15th", 510, 230);
  text("16th", 70, 310);
  text("17th", 180, 310);
  text("18th", 290, 310);
  text("19th", 400, 310);
  text("20th", 510, 310);
  text("21st", 70, 390);
  text("22nd", 180, 390);
  text("23rd", 290, 390);
  text("24th", 400, 390);
  textFont(font, 25);
  text("25th", 515, 410);

  if (mouseX>= 40 & mouseX<=120 & mouseY>=20 & mouseY<=100) {  
    if (mousePressed) {
      //background(237,24,24); 
      textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("US scientists calculated that Santa would have", 20, 120);
      text("to visit 822 homes a second to deliver all the world's", 20, 160);
      text("presents on Christmas Eve, travelling at 650 miles a second.", 20, 200);
      image(imgh,630,20,100,100);
    }
    
  }

  if (mouseX>= 150 & mouseX<=230 & mouseY>=20 & mouseY<=100) {
    if (mousePressed) { 
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("SANTA Claus comes from a Dutch folk tale based on", 20, 120);
      text("Saint Nicholas, or Sinterklaas, who gave gifts on December 6.", 20, 160);
      image(imgr,650,20,170,130);
    }
  }

  if (mouseX>= 260 & mouseX<=340 & mouseY>=20 & mouseY<=100) {
    if (mousePressed) {
      textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("The 25th of December was not celebrated as the birthday ", 20, 120);
      text("of Christ until the year AD 440.", 20, 160);
      image(imgh,630,20,100,100);
    }
  } 
  if (mouseX>= 370 & mouseX<=450 & mouseY>=20 & mouseY<=100) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("The Queen's Christmas speech was televised for the ", 20, 120);
      text("first time in 1957.", 20, 160);
      image(imgr,650,20,170,130);
    }
  }

  if (mouseX>= 480 & mouseX<=560 & mouseY>=20 & mouseY<=100) {
    if (mousePressed) {
     textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("The 'Twelve days of Christmas' gifts. A partridge in a pear tree, two", 20, 120);
      text("turtledoves, three French hens, four calling birds, five gold rings.", 20, 160);
      text("six geese laying, seven swans swimming, eight maids milking, nine", 20, 200);
      text("ladies dancing, ten lords leaping, eleven pipers piping and twelve", 20, 240);
      text("drummers drumming. There are 364 gifts altogether, one for every", 20, 280); 
      text("day of the year", 20, 320);
      image(imgh,630,20,100,100);
    }
   
  }

  if (mouseX>= 40 & mouseX<=120 & mouseY>=100 & mouseY<=180) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("A famous Christmas tradition is to exchange kisses beneath the", 20, 120);
      text("mistletoe tree. Though the reason behind the choice of mistletoe in", 20, 160);
      text("this custom is .not properly known, it may be well to remember", 20, 200);
      text("that in ancient Scandinavia,mistletoe was associated with peace and", 20, 240);
      text("friendship. That may account for the custom of", 20, 280);
      text("'kissing beneath the mistletoe'", 20, 320);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 150 & mouseX<=230 & mouseY>=100 & mouseY<=180) {
    if (mousePressed) {
    textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("The first Christmas Pudding was made as a kind of soup with", 20, 120);
      text(" raisins and wine in it.", 20, 160);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 260 & mouseX<=340 & mouseY>=100 & mouseY<=180) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("The names of the 'Three Wise Men' are not mentioned", 20, 120);
      text("in the Bible. They are commonly known as ", 20, 160);
      text("Caspar, Melchior, and Balthasar", 20, 200);
      text("as these names were detailed in an early 6th century", 20, 240);
      text("Greek manuscript", 20, 280);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 370 & mouseX<=450 & mouseY>=100 & mouseY<=180) {
    if (mousePressed) {
     textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("Herod was the king of Judaea and sent the three wise men to", 20, 120);
      text("Bethlehem", 20, 160);
      image(imgh,630,20,100,100);
    }
   
  }
  if (mouseX>= 480 & mouseX<=560 & mouseY>=100 & mouseY<=180) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("The Three Wise Men presented the infant Jesus with", 20, 120);
      text("three gifts which were fitGold as a symbol of kingship", 20, 160);
      text("on earth, symbolizing virtueMyrrh (an embalming oil)", 20, 200);
      text("was used as an anointing oil and as a symbol of suffering",20,240);
      text("Frankincense was used as a perfume, symbolizing prayer", 20, 280);
      text("and the priesthood",20,320);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 40 & mouseX<=120 & mouseY>=180 & mouseY<=260) {
    if (mousePressed) {
      textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("Xmas was banned by the Puritans under the rule of Oliver  ", 20, 120);
      text("Cromwell. In 1647 Parliament passed a law making Christmas illegal", 20, 160);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 150 & mouseX<=230 & mouseY>=180 & mouseY<=260) {
    if (mousePressed) {
     textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("'A Christmas Carol' was written by Charles Dickens ", 20, 120);
      text("in 1843- it took him just 6 weeks",20,160);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 260 & mouseX<=340 & mouseY>=180 & mouseY<=260) {
    if (mousePressed) {
      textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("The names of Santa's reindeer are Dasher and Dancer,", 20, 120);
      text("Prancer and Vixen,Comet and Cupid, and Donner and Blixen", 20, 160);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 370 & mouseX<=450& mouseY>=180 & mouseY<=260) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("Based on polls and statistics 45% of the population ", 20, 120);
      text("of the world celebrate Christmas",20,160);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 480 & mouseX<=560& mouseY>=180 & mouseY<=260) {
    if (mousePressed) {
     textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("From 1931 an illustrator called Haddon H. Sundblom ", 20, 120);
      text("produced Santa picturesevery Xmas depicting Santa in his red", 20, 160);
      text("coat as part of the Coca-Cola Xmas advertising campaigns",20,200);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 40 & mouseX<=120& mouseY>=260 & mouseY<=340) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("Christmas only became a national holiday in America on ",20, 120);
      text("June, 26, 1870",20,160);
      image(imgr,650,20,170,130);
    }
   
  }
  if (mouseX>= 150 & mouseX<=230& mouseY>=260 & mouseY<=340) {
    if (mousePressed) {
      textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text(" Joseph was Mary’s husband, but he was not Jesus’ father!  God was.", 20, 120);
      text("However, Joseph was a descendant of King David.", 20, 160);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 260 & mouseX<=340& mouseY>=260 & mouseY<=340) {
    if (mousePressed) {
     textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("Joseph and Mary did not live in Bethlehem.  Mary .", 20, 120);
      text("was from NazarethThe couple went to Bethlehem because the", 20, 160);
      text("law said they had to take part in a censuswhere every man had ", 20, 200);
      text("to return to the place of his birth.  Mary went with him.",20,240);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 370 & mouseX<=450& mouseY>=260 & mouseY<=340) {
    if (mousePressed) {
     textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("Jesus was born in a manger in the stable as the census", 20, 120);
      text(" brought many people to town, meaning all the Inns were full.", 20, 160);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 480 & mouseX<=560& mouseY>=260 & mouseY<=340) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("The shepherds saw Jesus that very night.  The angels told them  ", 20, 120);
      text("that the baby has just been born, and they came to manger", 20, 160);
      text("behind the inn like the angels told them to.", 20, 200); 
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 40 & mouseX<=120& mouseY>=340 & mouseY<=420) {
    if (mousePressed) {
      textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("The wise men were called Magi in the Bible.  Magi was the Greek", 20, 120);
      text("word for “magic,” but the term meant a very wise person ", 20, 160);
      text("who understood astrology, chemistry and philosophy. ", 20, 200);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 120 & mouseX<=230& mouseY>=340 & mouseY<=420) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("Before visiting Jesus, the Magi duped Herod, the evil king! ", 20, 120);
      text("The Magi came to Herod  “magic,” but when they were looking", 20, 160);
      text("for Jesus.  Herod said he thought the Messiah was to be born in", 20, 200);  
      text("Bethlehem and to report back to him where Jesus was. ", 20, 240);
      text("He said he wanted to worship Jesus, but really he wanted to kill him.", 20, 280); 
      text("(He was afraid of Jesus taking his place as king someday).  ", 20, 320);
      text("The wise men sneaked out of Jerusalem and never let Herod know!", 20, 360);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 260 & mouseX<=340& mouseY>=340 & mouseY<=420) {
    if (mousePressed) {
     textFont(font, 25);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("There was a lot of dreaming going on!  Joseph dreamed he saw  ", 20, 120);
      text("an angel who told him to marry Mary even though she was ", 20, 160);
      text("already pregnant. The Magi dreamed they should notreturn  ", 20, 200);
      text("to Herod, who was plotting evil.", 20, 240);
      text("Joseph dreamed he should take Jesus and Mary to Egypt ", 20, 280);
      text("so that Herod couldn’t kill the baby", 20, 320);
      image(imgh,630,20,100,100);
    }
  }
  if (mouseX>= 370 & mouseX<=450& mouseY>=340 & mouseY<=420) {
    if (mousePressed) {
      textFont(font, 25);
      fill(47,203,56);
      rect(0,0, width, height);
      fill(255);
      text("The Romans started using holly in winter ", 20, 120);
      text("they gave it to each other as a seasonal gift.", 20, 160);
      image(imgr,650,20,170,130);
    }
  }
  if (mouseX>= 480 & mouseX<=560& mouseY>=340 & mouseY<=420) {
    if (mousePressed) {
     textFont(font, 40);
      fill(237,24,24);
      rect(0, 0, width, height);
      fill(255);
      text("Merry Christmas Everybody!! ", 20, 120);
      image(imgs,200,180,350,300);
      
    }
  }
  String[] page = loadStrings("http://www.auburn.edu/~vestmon/xmas_cnt.htm");
  String p = "";
  println(page);
  for(int i=0;i < page.length;i++){
    p += page[i];
  }
  String startMarker = "<table width=30%><tr><th align=right>";
  String endMarker = "</table><p>";
  int start = p.indexOf(startMarker);
  p = p.substring(start+startMarker.length(),p.length());
  int end = p.indexOf(endMarker);
  String ss = p.substring(0,end);
  //println(ss);
  String[] bits = ss.split(">");
  String[] title1 = ss.split(">");
  String[] bit = ss.split(">");
  String[] title2 = ss.split(">");
  String[] bite = ss.split(">");
  String[] title3 = ss.split(">");
  bits = bits[0].split("<");
  title1 = title1[1].split("<");
  bit = bit[4].split("<");
  title2 = title2[5].split("<");
  bite = bite[8].split("<");
  title3 = title3[9].split("<");
  String days = bits[0];
  String daysT = title1[0];
  String hours = bit[0];
  String hoursT = title2[0];
  String minutes = bite[0];
  String minutesT = title3[0];
  fill(255);
  textFont(font2, 50);
  text(days, 20, height - 200);
  text(daysT, 90, height - 200);
  text(hours, 230, height - 200);
  text(hoursT, 300, height - 200);
  text(minutes, 470, height - 200);
  text(minutesT, 540, height - 200);
}



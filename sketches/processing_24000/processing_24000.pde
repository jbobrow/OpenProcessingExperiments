
// TweetCards Sample / Written by n_ryota
import processing.pdf.*;
import twitter4j.*;

//------------------------------------------
PGraphicsPDF pdf;
PGraphics card;
PFont titleFont, messageFont;
PImage dummyIcon1, dummyIcon2;
int divX = 4, divY = 4;
int cardW, cardH, cardScale;
int cardNo = 0;
boolean isDummy = true;       // true : Use Dummy Data
boolean isPdf = false;        // true : PDF Export
Twitter twitter;
List<Status> timeline;

//------------------------------------------
void setup() {
  size(605, 855); // A4
  cardW = width/divX; cardH = height/divY; 
  if(isPdf) {
    pdf = (PGraphicsPDF)beginRecord(PDF, "TweetCards.pdf");
    cardScale = 4;
  } else cardScale = 1;
  createCardGraphics();

  hint(ENABLE_NATIVE_FONTS); //println(PFont.list());
  titleFont = createFont("Book Antiqua Bold", 14);
  messageFont = createFont("Book Antiqua Bold", 10); //createFont("MS PMincho", 10);
  dummyIcon1 = loadImage("dummy1.jpg");
  dummyIcon2 = loadImage("dummy2.jpg");

  if(!isPdf) addDrawCardBackPage();
  if(!isDummy) {
    try {
      twitter = new TwitterFactory().getInstance();
      timeline = twitter.getPublicTimeline();
      //timeline = twitter.getUserTimeline("n_ryota");
    } catch(Exception e) { print(e.getMessage()); }
  }
}

//------------------------------------------
void draw() {
  if(cardNo>=0) {
    if(cardNo>0 && getPageCardNo()==0) {
      if(isPdf) addDrawCardBackPage();
    }
    if(cardNo<divX*divY) {
      delay(100);
      addTweetCard();
    } else cardNo = -1;
  } else {
    if(getPageCardNo()>0) addDrawCardBackPage();
    if(isPdf) {
      endRecord();
      exit();
    }    
  }
}

//------------------------------------------
void addTweetCard() {
  if(isDummy) {
    if(random(100)<50) addDrawCard("TwitterUser_" + cardNo, "You can draw the public timeline on Twitter.", dummyIcon1, int(random(1000)), int(random(1000)));
    else addDrawCard("TwitterUser_" + cardNo, "This is dummy. Please set\nisDummy = false.", dummyIcon2, int(random(100)), int(random(100)));
  } else if(timeline!=null) {
    Status status = timeline.get(cardNo);
    if(status!=null) {
      println(status.getUser().getScreenName() + ":" + status.getText());
      try {
        ProfileImage pi = twitter.getProfileImage(status.getUser().getScreenName(), ProfileImage.NORMAL);
        addDrawCard(status.getUser().getScreenName(), status.getText(), loadImage(pi.getURL()), status.getUser().getFriendsCount(), status.getUser().getFollowersCount() );
      } catch(Exception e) { print(e.getMessage()); }
    }
  }
}

//------------------------------------------
void addDrawCard(String name, String message, PImage icon, int friendsCount, int followersCount) {
  if(isPdf && cardNo>0 && getPageCardNo()==0) pdf.nextPage();

  initCardFront(name, message, icon, friendsCount, followersCount);
  drawCardImage(cardNo % divX, getPageCardNo() / divX);
  cardNo++;
}

//------------------------------------------
void addDrawCardBackPage() {
  if(isPdf) pdf.nextPage();
  initCardBack();
  for(int y=0; y<divY; y++) {
    for(int x=0; x<divX; x++) {
      drawCardImage(x, y);
    }
  }
}

//------------------------------------------
int getPageCardNo() { return cardNo % (divX * divY); };

//------------------------------------------
void drawCardImage(int x, int y) {
  pushMatrix();
  translate(x*cardW, y*cardH);
  image(card, 0, 0, cardW, cardH);
  stroke(240, 220, 180); strokeWeight(1); noFill();
  rect(0, 0, cardW, cardH);
  popMatrix();
}

//------------------------------------------
void createCardGraphics() {
  card = createGraphics(cardW*cardScale, cardH*cardScale, JAVA2D);
}

//------------------------------------------
void initCardFront(String name, String message, PImage icon, int friendsCount, int followersCount) {
  createCardGraphics();
  card.beginDraw();
  card.noStroke(); card.fill(255, 240, 220);
  card.rect(0, 0, card.width, card.height);
  card.scale(cardScale);

  card.imageMode(CENTER);
  card.tint(255, 240, 220, 255);
  if(icon!=null) card.image(icon, cardW/2, 40+32/2, 32, 32);
  
  card.noStroke(); card.fill(255, 100);
  card_roundRect(20, cardH/2-20, cardW-40, cardH/2);
  
  card.fill(55, 40, 20, 130);
  card.textFont(titleFont);
  card.textAlign(CENTER, TOP); card.text(name, cardW/2, 15);
  card.textAlign(RIGHT, TOP);  card.text(str(friendsCount), cardW/2 - 30, 47);
  card.textAlign(LEFT, TOP);   card.text(str(followersCount), cardW/2 + 30, 47);
  
  card.textFont(messageFont);
  card.textAlign(LEFT, TOP);   card.text(message, 25, cardH/2-10, cardW-50, cardH/2-20);
  card.endDraw();
}

//------------------------------------------
void initCardBack() {
  createCardGraphics();
  randomSeed(0);
  card.beginDraw();
  card.noStroke(); card.fill(170, 140, 100);
  card.rect(0, 0, card.width, card.height);
  card.scale(cardScale);
  for(int j=0; j<500; j++) {
    card.stroke(255, 220+random(20), 180+random(40), 10+random(30)); card.strokeWeight(1+random(1));
    card.line( random(-cardW*2, cardW*2), random(-cardH*2, cardH*2), random(-cardW*2, cardW*2), random(-cardH*2, cardH*2) );
  }
  card.stroke(55, 40, 20, 50); card.strokeWeight(2); card.fill(0, 50);
  card.rect(10, 10, cardW-20, cardH-20);
  card.textFont(titleFont, 20); card.textAlign(CENTER, CENTER); card.fill(255, 240, 200);
  card.text("TweetCards", cardW/2, cardH/2-5);
  card.endDraw();
}

//------------------------------------------
void card_roundRect(float x, float y, float w, float h) {
  float corner = w/10.0, midDisp = w/20.0;
  card.beginShape();  
  card.curveVertex(x+corner,y); card.curveVertex(x+w-corner,y); card.curveVertex(x+w+midDisp,y+h/2.0);
  card.curveVertex(x+w-corner,y+h); card.curveVertex(x+corner,y+h); card.curveVertex(x-midDisp,y+h/2.0);
  card.curveVertex(x+corner,y); card.curveVertex(x+w-corner,y); card.curveVertex(x+w+midDisp,y+h/2.0);
  card.endShape();
}


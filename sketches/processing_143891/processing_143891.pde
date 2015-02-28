
int currentPage = 0; //0 represents the start page
PImage startButton; //start
PImage infoButton; //info
PImage backButton; //back
PImage relationships1; //Ashton-Mila
PImage relationships2; //Will-Jada
PImage outfits1; //Leonardo DiCaprio
PImage outfits2; //Channing Tatum
PImage outfits3; //Halle Berry
PImage miniO1; //Chris Hemsworth
PImage miniO2; //Shailene Woodley
PImage miniO3; //Emma Watson
PImage Arrow1; //Arrow ->
PImage Arrow2; //Arrow <-
PImage Facebook; //facebook
PImage Instagram; //insta
PImage Twitter; //twitter
boolean showInfoButton = true;
boolean showBackButton = false;
boolean showRelationships1 = false;
boolean showRelationshipsText1 = false;
boolean showRelationships2 = false;
boolean showRelationshipsText2 = false;
boolean showArrow1 = true;
boolean showArrow2 = true;
int Names; //creators
PFont font; //font of the title 
int Title; //title name 
int Info; //information about the app
int relationshipstitle; //relationship title
int OutfitTitle; //title
int FollowTitle; //what're your thoughts?
int forward = 0;
int back = 0; 
int FollowUs;


void setup(){
  size(700,700); //set canvas size
  startButton = loadImage("startbutton.jpg"); // startbutton
  infoButton = loadImage("infobutton.jpg"); //infobutton
  backButton = loadImage("backbutton.png"); //backbutton
  relationships1 = loadImage("Ashton-Mila.jpg"); // images
  relationships2 = loadImage("Will-Jada.jpg"); // images
  outfits1 = loadImage("Leo.jpg"); // images
  outfits2 = loadImage("Tatum.jpg"); //images
  outfits3 = loadImage("HBerry.jpg"); //images
  miniO1 = loadImage("ChrisH.jpg"); //images
  miniO2 = loadImage("ShaileneW.jpg"); //images
  miniO3 = loadImage("Emma.jpg"); //images
  Arrow1 = loadImage("Arrows.png"); // images
  Arrow2 = loadImage("Arrow2.png"); // images
  Facebook = loadImage("Facebook.png"); //images
  Instagram = loadImage("insta.jpg"); //images
  Twitter = loadImage("twitter.jpg"); //images
}

void draw(){
  if(currentPage == 0){
    background(222, 31, 143); //set background color to hot pink
    drawStartButton(); //startbutton
    showBackButton = false;
    Names(); //creators 
    Title(); //game title
   
  }
  else if(currentPage == 1){
    drawLevelOne(); //level one
    background(95, 182,255); //set color to blue
    drawRelationships1(); //picture 1
    drawRelationships2(); //picture 2
    drawRelationshipstitle(); //title
    drawArrow1(); //->
    if(showBackButton == false){
      drawBackButton();
    }
    if(showRelationshipsText1 == true){ //relationships text
      drawRelationshipsText1(); //text
    }
     if(showRelationshipsText2 == true){ //relationships text
      drawRelationshipsText2(); //text
    }
  }
  else if(currentPage == 1){
    background(0); // set color to black
  }
  else if(currentPage == 2){ //info button
    background(0,0,255); //set color to blue
    Info(); //information about the app
    showBackButton = true;
  }
  else if(currentPage == 3){ //draw back button 
    drawBackButton();
  }
  else if (currentPage == 4){
    background(0); //setbackground color to black
    drawOutfits1(); //leonardo DiCaprio
    drawOutfits2(); //Channing Tatum
    drawOutfits3(); //Halle Berry
    drawMiniO1(); //Chris Hemsworth
    drawMiniO2(); //Shailene Woodley
    drawMiniO3(); //Emma Watson
    if(showBackButton == false){
      drawBackButton();
      drawArrow1();//->
      drawArrow2();//<-
      OutfitTitle(); //title of Outfits 
    }
  }
    else if (currentPage ==5) {
      background(122, 43, 165); //set color to purple
      drawArrow2();//<-
      FollowTitle(); //title
      FollowUs(); //questions
      drawFacebook();
      drawInstagram();
      drawTwitter();
    }
  
  if(showInfoButton == true){ //info button
    drawInfoButton();
  }
  if(showBackButton == true){ //show back button
    drawBackButton();
  }
}

void drawStartButton(){
  image(startButton, 150, 100); //startbutton image 
}

void drawLevelOne(){
  background(255); //set background color to white
}

void drawInfoButton(){
  image(infoButton, 550, 645); //infobutton image 
}

void drawBackButton(){
  image(backButton, 0, 620); // backbutton image 
}

void drawRelationships1(){ // Ashton and Mila
  image(relationships1, 25, 75); // relationships images
}

void drawRelationships2(){ // Will and Jada
  image(relationships2, 45, 300);
}

void drawOutfits1(){ // Leo
  image(outfits1, 0, 65);
}

void drawOutfits2(){ // Tatum
  image(outfits2, 235, 65); 
}

void drawOutfits3(){ //Halle Berry
  image(outfits3, 465, 65); 
}

void drawMiniO1(){ //ChrisH
  image(miniO1, 10, 440); 
}

void drawMiniO2(){ //ShaileneW
  image(miniO2,  130, 440);
}

void drawMiniO3(){ //EmmaW
  image(miniO3, 270, 440); 
}
void drawArrow1(){ // -->
 image(Arrow1, 630, 0); 
}

void drawArrow2(){ //<--
  image(Arrow2, 0,0);
}

void drawFacebook(){
  image(Facebook, 100, 400);
}

void drawInstagram(){
  image(Instagram, 300, 400);
}

void drawTwitter(){
  image(Twitter, 500, 400); 
}

void drawRelationshipstitle(){ //title
  fill(107, 245, 87); //set color to lime green
  font = loadFont("BrushScriptMT-32.vlw"); //cursive font
  textFont(font, 35); //font size
  text("What's Your Status???", 240, 40); // marital status
  fill(250, 142, 106); //set color to light orange
  font = loadFont("Arial-BoldMT-32.vlw"); //font
  textFont(font, 15); //font size
  text("(Marriage, Single, Dating, Divorced, or Engaged)", 200, 55); //status of relationship
  fill(242, 88, 109); //set color to greenish teal
  font = loadFont("Arial-BoldMT-32.vlw"); //font
  textFont(font, 25); //font size
  text("*Photos are clickable!*", 230, 600); //text
  
}
void drawRelationshipsText1(){ //Ashton and Mila's Relationship
    fill(0); //set color to black
    font = loadFont("Arial-BoldMT-32.vlw"); //font
    textFont(font, 15); //font size
    text("Ashton Kutcher and Mila Kunis met",342,90);//+25
    text("on the set of That 70's show in '98.", 342, 115);//+25
    text("They recently started dating in 2012,", 342, 140); //+25
    text("after Ashtons' divorce with Demi Moore", 342, 165);//+25
    text("in 2012. Kutcher recently proposed to Mila", 342, 190);//+25
    text("a few months shortly after they were dating.", 342, 215);//+25
    fill(44, 78, 242); //set color to blue
    text("Status: (D)ating", 342, 240); //status of relationship
}
void drawRelationshipsText2(){ //Will Smith and Jada Pinkett Smith Relationship
  fill(0); // set color to black
  font = loadFont("Arial-BoldMT-32.vlw"); //font 
  textFont(font, 15); //font size
  text("Will Smith and Jada Pinkett Smith got", 342, 320); //+25
  text("married in 1997, 2 years after he divorced Sheree", 342, 345);//+25
  text ("Zampino. They now have 2 kids", 342, 370);//+25
  text("together, named Jaden (15), Willow (13), and Trey", 342, 395);//+25
  text("his older son.", 342, 420);//+25
  fill(44, 78, 242); //set color to blue
  text("Status: (M)arried.", 342, 455); //status of relationship
  
}

void mousePressed(){ 
  if(currentPage == 0 && mouseX > 150 && mouseX < 570 && mouseY > 100 && mouseY < 233){ //startbutton
    currentPage = 1;
  }
  if(mouseX > 550 && mouseX < 611 && mouseY > 645 && mouseY < 704){ //info page
    currentPage = 2;
  }
  if(mouseX > 0 && mouseX < 108 && mouseY > 620 && mouseY < 728){ //back button + 108
    currentPage = 0;
  }
  if(currentPage == 1 && mouseX > 25 && mouseX < 331 && mouseY > 75 && mouseY < 288){ //relationships1 
    println("DOGZ");
    showRelationshipsText1 = true;
  }
  if(currentPage == 1 && mouseX > 45 && mouseX < 326 && mouseY > 300 && mouseY < 558){ //relationships2
    showRelationshipsText2 = true;
  }
  if(mouseX > 630 && mouseX < 701 && mouseY > 0 && mouseY < 38){ //Arrow1 -->
    if(forward == 0){
      currentPage = 4;
      forward = forward + 1;
    }
   else if(forward == 1){
     currentPage = 5;
     forward = forward + 1;
     back = 1;
   }
  }
 if(mouseX > 0 && mouseX < 104 && mouseY > 0 && mouseY < 57){ //Arrow2 <--
    if(back == 0){
      currentPage = 1;
      forward = 0;
    }
    else if(back == 1){
      currentPage = 4; 
    }
  }
}
void Names(){
  fill(255); //set color to white
  font = loadFont("Arial-BoldMT-32.vlw"); //font
  textFont(font, 32); //font size
  text("created by Elizha & Farentino!", 130, 550); //names
}

void Title(){
  fill(98, 188, 222 ); //set color to teal
  font = loadFont("BrushScriptMT-32.vlw"); //font cursive 
  textFont(font, 93); //font size
  text("Celebrity Fame", 130, 400); //title
}

void Info(){ //information about the APP
  fill(255); // set color to white
  font = loadFont("Arial-BoldMT-32.vlw"); //font
  textFont(font, 15); //font size
  text("ABOUT THE APP", 300, 65); //title
  text("Our app is called Celebrity Fame where people", 30, 120); //text
  text("can look up their favorite famous celebrity and see what's trending about them!",30, 140); //text
  text("From the clothes they wear to their daily routines. You can get notifications on", 30, 160); //text
  text("your fave celeb about what's happening around them, what kind of music or movies", 30, 180); //text
  text("they are going to be producing or be in. You can hear all about their juicy secrets!", 30, 200); //text
  text("You can look at pictures from the Grammys, Oscars, Music awards, and the type of food", 30, 220); //text
  text("they eat to lose weight. You can read all about the top stories that they usually don't", 30, 240); //text
  text("share in the news, you can hear about who's getting married, and who's getting divorced,",30, 260); //text
  text("from who's having a baby, and who's dying their hair! You can also read about scandalous", 30, 280); //text
  text("romances to mistresses breaking up relationships! You can also vote on polls on who's best", 30, 300); //text
  text("dressed! You can also see what kind of tv show they are starting!", 30, 320); //text
}

void OutfitTitle(){
  fill(255); //set color to white
  font = loadFont("BrushScriptMT-32.vlw"); //Fonts
  textFont(font, 60); //font size
  text("Outfits", 290, 50); //Title
  fill(251, 255, 57); //set color to yellow
  font = loadFont("Arial-BoldMT-32.vlw"); //font
  textFont(font, 15); //font size
  text("All these actors and actresses dressed up", 400, 450); //text +15
  text("attending one of their events they", 400, 465); //text +15
  text("were started in or either invited to,", 400, 480); //text +15
  text("(i.e) Movies, Golden Globes, Oscars.", 400, 495); //text +15
  text("Aren't they looking FABULOUS!", 400, 510); //text +15
  fill(218, 57, 255); //set color to purple
  text("Left to right- Leonardo DiCaprio,", 400, 530); //text +20
  text("Channing Tatum, Halle Berry,", 400, 550); //text +20
  text("Chris Hemsworth, Shailene Woodley,", 400, 570); //text +120
  text("and Emma Watson.", 400, 590); //text +20
}

void FollowTitle(){
  fill(255); //set color to white
  font = loadFont("Arial-BoldMT-32.vlw"); //font
  textFont(font, 40); //font size
  text("FOLLOW US", 250, 50);
  textFont(font, 15); //font size
  text("via. Instagram, Twitter, Facebook, etc.", 245, 62);
}
void FollowUs(){
  fill(255); //set color to white
  font = loadFont("Arial-BoldMT-32.vlw"); //Fonts
  textFont(font, 15); //font size
  text("INSTAGRAM", 30, 100); //Title
  text("TWITTER", 30, 200);
  text("FACEBOOK", 30, 300);
  fill(0); //set color to black
  text("instagram.com/xoxoelizha", 30, 120); //instagram
  text("twitter.com/ilikeeeeetoooes", 30, 220); //twitter
  text("facebook.com/Elizha-Grace-TheBest-Fulgencio", 30, 320); //facebook
  fill(79, 229, 203); //set color to tealish green
  text("twitter.com/will_smith", 30, 240); //twitter
  text("twitter.com/channingtatum", 30, 260); //twitter
  text("facebook.com/LeonardoDicaprio", 30, 340); //facebook
  text("twitter.com/LeoDiCaprio", 30, 280); //twitter
  text("instagram.com/LeoDicaprio", 30, 140); //instagram
  

}


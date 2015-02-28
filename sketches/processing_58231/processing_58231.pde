
// easy library from Shiffman
// grab it from: http://www.shiffman.net/p5/simpleML/simpleML.zip
import simpleML.*;
 
// our HTMLRequest object that we'll use to grab HTML data
HTMLRequest nytimes_main;
HTMLRequest nytimes_world;
HTMLRequest nytimes_us;
HTMLRequest nytimes_politics;
HTMLRequest nytimes_business;
HTMLRequest nytimes_tech;
HTMLRequest nytimes_sports;
HTMLRequest nytimes_science;
HTMLRequest nytimes_health;
HTMLRequest nytimes_arts;
HTMLRequest nytimes_style;
HTMLRequest nytimes_opinion;

 
// this will hold whatever the current HTML is from
// our source URL
String html_main = "";
String html_world = "";
String html_us = "";

String html_politics = "";
String html_business = "";
String html_tech = "";
String html_sports = "";
String html_science = "";
String html_health = "";
String html_arts = "";
String html_style = "";
String html_opinion = "";

// we'll use this for timing in draw()
float startTime;
 
// is the requested HTML data ready yet?
boolean gotnew = false;
 
// some basic settings
int w = 1300;
int h = 400;
int fps = 10;
 
// for our timer line
float x = 0;
int interval = 10000;
float jump = w/(fps*interval/1000);
 
// starting size for elements
//int startingSize = 10;
int mMainSize = 10;
int fMainSize = 10;
int mWorldSize = 10;
int fWorldSize = 10; 
int mUSSize = 10;
int fUSSize = 10; 

int mPoliticsSize = 10;
int fPoliticsSize = 10;
int mBusinessSize = 10;
int fBusinessSize = 10;
int mTechSize = 10;
int fTechSize = 10;
int mSportsSize = 10;
int fSportsSize = 10;
int mScienceSize = 10;
int fScienceSize = 10;
int mHealthSize = 10;
int fHealthSize = 10;
int mArtsSize = 10;
int fArtsSize = 10;
int mStyleSize = 10;
int fStyleSize = 10;
int mOpinionSize = 10;
int fOpinionSize = 10;



// how many female pronouns vs male pronouns there are on the page?
int femaleTotal_main = 0;
int maleTotal_main = 0;

int femaleTotal_world = 0;
int maleTotal_world = 0;
 
int femaleTotal_us = 0;
int maleTotal_us = 0;

int femaleTotal_politics = 0;
int maleTotal_politics = 0;
 
int femaleTotal_business = 0;
int maleTotal_business = 0;
 
int femaleTotal_tech = 0;
int maleTotal_tech = 0;
 
int femaleTotal_sports = 0;
int maleTotal_sports = 0;
 
int femaleTotal_science = 0;
int maleTotal_science = 0;
 
int femaleTotal_health = 0;
int maleTotal_health = 0;
 
int femaleTotal_arts = 0;
int maleTotal_arts = 0;
 
int femaleTotal_style = 0;
int maleTotal_style = 0;
 
int femaleTotal_opinion = 0;
int maleTotal_opinion = 0;
 


 
PFont font;
 
// setup the basics
void setup() {
  size(w,h);
  smooth();
  frameRate(fps);
  
  font = loadFont("Helvetica-20.vlw"); 

  
  nytimes_main = new HTMLRequest(this,"http://www.nytimes.com/");
  nytimes_world = new HTMLRequest(this,"http://www.nytimes.com/pages/world/index.html");

  nytimes_us = new HTMLRequest(this,"http://www.nytimes.com/pages/national/index.html");

  nytimes_politics = new HTMLRequest(this,"http://www.nytimes.com/pages/politics/index.html");
  nytimes_business = new HTMLRequest(this,"http://www.nytimes.com/pages/business/index.html");
  nytimes_tech = new HTMLRequest(this,"http://www.nytimes.com/pages/technology/index.html");
  nytimes_sports = new HTMLRequest(this,"http://www.nytimes.com/pages/sports/index.html");
  nytimes_science = new HTMLRequest(this,"http://www.nytimes.com/pages/science/index.html/");
  nytimes_health = new HTMLRequest(this,"http://www.nytimes.com/pages/health/index.html");
  nytimes_arts = new HTMLRequest(this,"http://www.nytimes.com/pages/arts/index.html");
  nytimes_style = new HTMLRequest(this,"http://www.nytimes.com/pages/style/index.html");
  nytimes_opinion = new HTMLRequest(this,"http://www.nytimes.com/pages/opinion/index.html");

  nytimes_main.makeRequest();
  nytimes_world.makeRequest();
  nytimes_us.makeRequest();
  nytimes_politics.makeRequest();
  nytimes_business.makeRequest();
  nytimes_tech.makeRequest();
  nytimes_sports.makeRequest();
  nytimes_science.makeRequest();
  nytimes_health.makeRequest();
  nytimes_arts.makeRequest();
  nytimes_style.makeRequest();
  nytimes_opinion.makeRequest();

}
 
 
 
// draw it out
void draw() {
  noStroke();
 
  // make things fade
  fill(60,50);
  rectMode(CORNER);
  rect(0,0,w,h);
 
 
  textFont(font,14); 
  fill(255);
  text("Female Pronouns", 25, 125,60,60);
  text("Male Pronouns", 25, 275,60,60);
  text("New York Times", 600, 25);

  text("Main", 150, 50,60,60);
  text("World", 250, 50,60,60);
  text("US", 350, 50,60,60);
  text("Politics", 450, 50,60,60);
  text("Business", 550, 50,60,60);
  text("Tech", 650, 50,60,60);
  text("Sports", 750, 50,60,60);
  text("Science", 850, 50,60,60);
  text("Health", 950, 50,60,60);
  text("Arts", 1050, 50,60,60);
  text("Style", 1150, 50,60,60);
  text("Opinion", 1235, 50,60,60);


  // what time is it
  float now = millis();
   
  // every five seconds, check the website
  if(now > startTime + interval) {
      nytimes_main.makeRequest();
      startTime = now;
  }
   
  // x is for our timer line.  it advances every frame by jump
  // unless we've reached the edge when it starts over
  x+=jump;
  if(x >= width) x = 0;
   
  // if we have new HTML data, set it up
  if(gotnew) {
    gotnew = false;
    //background(60);
 
 
    // use getMatchCount() (copy from below) to count instances of
    // the first argument in the second.  html is set in netEvent()   
  
  
//NY_main pronoun counts   
    maleTotal_main = 0;
      maleTotal_main += getMatchCount(" he ", html_main);
      maleTotal_main += getMatchCount("He ", html_main);
      maleTotal_main += getMatchCount(" him", html_main);
      maleTotal_main += getMatchCount("His ", html_main);
      maleTotal_main += getMatchCount(" his", html_main);

    femaleTotal_main = 0;
      femaleTotal_main += getMatchCount(" she ", html_main);
      femaleTotal_main += getMatchCount("She ", html_main);
      femaleTotal_main += getMatchCount(" her ", html_main);
      femaleTotal_main += getMatchCount(" Her ", html_main);
      femaleTotal_main += getMatchCount(" hers ",html_main);

//NY_world pronoun counts
    maleTotal_world = 0;
      maleTotal_world += getMatchCount(" he ", html_world);
      maleTotal_world += getMatchCount("He ", html_world);
      maleTotal_world += getMatchCount(" him", html_world);
      maleTotal_world += getMatchCount("His ", html_world);
      maleTotal_world += getMatchCount(" his", html_world);

    femaleTotal_world = 0;
      femaleTotal_world += getMatchCount(" she ", html_world);
      femaleTotal_world += getMatchCount("She ", html_world);
      femaleTotal_world += getMatchCount(" her ", html_world);
      femaleTotal_world += getMatchCount(" Her ", html_world);
      femaleTotal_world += getMatchCount(" hers ",html_world);

//NY_us pronoun counts   
    maleTotal_us = 0;
      maleTotal_us += getMatchCount(" he ", html_us);
      maleTotal_us += getMatchCount("He ", html_us);
      maleTotal_us += getMatchCount(" him", html_us);
      maleTotal_us += getMatchCount("His ", html_us);
      maleTotal_us += getMatchCount(" his", html_us);

    femaleTotal_us = 0;
      femaleTotal_us += getMatchCount(" she ", html_us);
      femaleTotal_us += getMatchCount("She ", html_us);
      femaleTotal_us += getMatchCount(" her ", html_us);
      femaleTotal_us += getMatchCount(" Her ", html_us);
      femaleTotal_us += getMatchCount(" hers ",html_us);      


//NY_politics pronoun counts   
    maleTotal_politics = 0;
      maleTotal_politics += getMatchCount(" he ", html_politics);
      maleTotal_politics += getMatchCount("He ", html_politics);
      maleTotal_politics += getMatchCount(" him", html_politics);
      maleTotal_politics += getMatchCount("His ", html_politics);
      maleTotal_politics += getMatchCount(" his", html_politics);

    femaleTotal_politics = 0;
      femaleTotal_politics += getMatchCount(" she ", html_politics);
      femaleTotal_politics += getMatchCount("She ", html_politics);
      femaleTotal_politics += getMatchCount(" her ", html_politics);
      femaleTotal_politics += getMatchCount(" Her ", html_politics);
      femaleTotal_politics += getMatchCount(" hers ",html_politics);      

//NY_business pronoun counts   
    maleTotal_business = 0;
      maleTotal_business += getMatchCount(" he ", html_business);
      maleTotal_business += getMatchCount("He ", html_business);
      maleTotal_business += getMatchCount(" him", html_business);
      maleTotal_business += getMatchCount("His ", html_business);
      maleTotal_business += getMatchCount(" his", html_business);

    femaleTotal_business = 0;
      femaleTotal_business += getMatchCount(" she ", html_business);
      femaleTotal_business += getMatchCount("She ", html_business);
      femaleTotal_business += getMatchCount(" her ", html_business);
      femaleTotal_business += getMatchCount(" Her ", html_business);
      femaleTotal_business += getMatchCount(" hers ",html_business);      

//NY_tech pronoun counts   
    maleTotal_tech = 0;
      maleTotal_tech += getMatchCount(" he ", html_tech);
      maleTotal_tech += getMatchCount("He ", html_tech);
      maleTotal_tech += getMatchCount(" him", html_tech);
      maleTotal_tech += getMatchCount("His ", html_tech);
      maleTotal_tech += getMatchCount(" his", html_tech);

    femaleTotal_tech = 0;
      femaleTotal_tech += getMatchCount(" she ", html_tech);
      femaleTotal_tech += getMatchCount("She ", html_tech);
      femaleTotal_tech += getMatchCount(" her ", html_tech);
      femaleTotal_tech += getMatchCount(" Her ", html_tech);
      femaleTotal_tech += getMatchCount(" hers ",html_tech);      

//NY_sport pronoun counts   
    maleTotal_sports = 0;
      maleTotal_sports += getMatchCount(" he ", html_sports);
      maleTotal_sports += getMatchCount("He ", html_sports);
      maleTotal_sports += getMatchCount(" him", html_sports);
      maleTotal_sports += getMatchCount("His ", html_sports);
      maleTotal_sports += getMatchCount(" his", html_sports);

    femaleTotal_sports = 0;
      femaleTotal_sports += getMatchCount(" she ", html_sports);
      femaleTotal_sports += getMatchCount("She ", html_sports);
      femaleTotal_sports += getMatchCount(" her ", html_sports);
      femaleTotal_sports += getMatchCount(" Her ", html_sports);
      femaleTotal_sports += getMatchCount(" hers ",html_sports);      

//NY_science pronoun counts   
    maleTotal_science = 0;
      maleTotal_science += getMatchCount(" he ", html_science);
      maleTotal_science += getMatchCount("He ", html_science);
      maleTotal_science += getMatchCount(" him", html_science);
      maleTotal_science += getMatchCount("His ", html_science);
      maleTotal_science += getMatchCount(" his", html_science);

    femaleTotal_science = 0;
      femaleTotal_science += getMatchCount(" she ", html_science);
      femaleTotal_science += getMatchCount("She ", html_science);
      femaleTotal_science += getMatchCount(" her ", html_science);
      femaleTotal_science += getMatchCount(" Her ", html_science);
      femaleTotal_science += getMatchCount(" hers ",html_science);      

//NY_health pronoun counts   
    maleTotal_health = 0;
      maleTotal_health += getMatchCount(" he ", html_health);
      maleTotal_health += getMatchCount("He ", html_health);
      maleTotal_health += getMatchCount(" him", html_health);
      maleTotal_health += getMatchCount("His ", html_health);
      maleTotal_health += getMatchCount(" his", html_health);

    femaleTotal_health = 0;
      femaleTotal_health += getMatchCount(" she ", html_health);
      femaleTotal_health += getMatchCount("She ", html_health);
      femaleTotal_health += getMatchCount(" her ", html_health);
      femaleTotal_health += getMatchCount(" Her ", html_health);
      femaleTotal_health += getMatchCount(" hers ",html_health);      

//NY_arts pronoun counts   
     maleTotal_arts = 0;
      maleTotal_arts += getMatchCount(" he ", html_arts);
      maleTotal_arts += getMatchCount("He ", html_arts);
      maleTotal_arts += getMatchCount(" him", html_arts);
      maleTotal_arts += getMatchCount("His ", html_arts);
      maleTotal_arts += getMatchCount(" his", html_arts);

    femaleTotal_arts = 0;
      femaleTotal_arts += getMatchCount(" she ", html_arts);
      femaleTotal_arts += getMatchCount("She ", html_arts);
      femaleTotal_arts += getMatchCount(" her ", html_arts);
      femaleTotal_arts += getMatchCount(" Her ", html_arts);
      femaleTotal_arts += getMatchCount(" hers ", html_arts);      

//NY_style pronoun counts   
     maleTotal_style = 0;
      maleTotal_style += getMatchCount(" he ", html_style);
      maleTotal_style += getMatchCount("He ", html_style);
      maleTotal_style += getMatchCount(" him", html_style);
      maleTotal_style += getMatchCount("His ", html_style);
      maleTotal_style += getMatchCount(" his", html_style);

    femaleTotal_style = 0;
      femaleTotal_style += getMatchCount(" she ", html_style);
      femaleTotal_style += getMatchCount("She ", html_style);
      femaleTotal_style += getMatchCount(" her ", html_style);
      femaleTotal_style += getMatchCount(" Her ", html_style);
      femaleTotal_style += getMatchCount(" hers ",html_style);      

//NY_opinion pronoun counts   
    maleTotal_opinion = 0;
      maleTotal_opinion += getMatchCount(" he ", html_opinion);
      maleTotal_opinion += getMatchCount("He ", html_opinion);
      maleTotal_opinion += getMatchCount(" him", html_opinion);
      maleTotal_opinion += getMatchCount("His ", html_opinion);
      maleTotal_opinion += getMatchCount(" his", html_opinion);

    femaleTotal_opinion = 0;
      femaleTotal_opinion += getMatchCount(" she ", html_opinion);
      femaleTotal_opinion += getMatchCount("She ", html_opinion);
      femaleTotal_opinion += getMatchCount(" her ", html_opinion);
      femaleTotal_opinion += getMatchCount(" Her ", html_opinion);
      femaleTotal_opinion += getMatchCount(" hers ",html_opinion);      


      
    println("# of Male Pronouns on Main Page: "+maleTotal_main);
    println("# of Female Pronouns on Main Page: "+femaleTotal_main);
 
    println("# of Male Pronouns on World Page: "+maleTotal_world);
    println("# of Female Pronouns on World Page: "+femaleTotal_world);
    
    println("# of Male Pronouns on US Page: "+maleTotal_us);
    println("# of Female Pronouns on US Page: "+femaleTotal_us);

    println("# of Male Pronouns on Politics Page: "+maleTotal_politics);
    println("# of Female Pronouns on Politics Page: "+femaleTotal_politics);
    
    println("# of Male Pronouns on Business Page: "+maleTotal_business);
    println("# of Female Pronouns on Business Page: "+femaleTotal_business);
    
    println("# of Male Pronouns on Tech Page: "+maleTotal_tech);
    println("# of Female Pronouns on Tech Page: "+femaleTotal_tech);
 
    println("# of Male Pronouns on Sports Page: "+maleTotal_sports);
    println("# of Female Pronouns on Sports Page: "+femaleTotal_sports);
 
    println("# of Male Pronouns on Science Page: "+maleTotal_science);
    println("# of Female Pronouns on Science Page: "+femaleTotal_science);
 
    println("# of Male Pronouns on Health Page: "+maleTotal_health);
    println("# of Female Pronouns on Health Page: "+femaleTotal_health);
 
    println("# of Male Pronouns on Arts Page: "+maleTotal_arts);
    println("# of Female Pronouns on Arts Page: "+femaleTotal_arts);
 
    println("# of Male Pronouns on Style Page: "+maleTotal_style);
    println("# of Female Pronouns on Style Page: "+femaleTotal_style);
 
    println("# of Male Pronouns on Opinion Page: "+maleTotal_opinion);
    println("# of Female Pronouns on Opinion Page: "+femaleTotal_opinion);
    
    // reset our element size whenever we have new data to start
    // showing
     mMainSize = 10;
     fMainSize = 10;
     mWorldSize = 10;
     fWorldSize = 10; 
     mUSSize = 10;
     fUSSize = 10;
     mPoliticsSize = 10;
     fPoliticsSize = 10;
     mBusinessSize = 10;
     fBusinessSize = 10;
     mTechSize = 10;
     fTechSize = 10;
     mSportsSize = 10;
     fSportsSize = 10;
     mScienceSize = 10;
     fScienceSize = 10;
     mHealthSize = 10;
     fHealthSize = 10;
     mArtsSize = 10;
     fArtsSize = 10;
     mStyleSize = 10;
     fStyleSize = 10;
     mOpinionSize = 10;
     fOpinionSize = 10;
  }
 
  // draw our representations (if appropriate)
  drawMale_main();
  drawFemale_main();

  drawMale_world();
  drawFemale_world();

  drawMale_us();
  drawFemale_us();
  
  drawMale_politics();
  drawFemale_politics();
  
  drawMale_business();
  drawFemale_business();
  

    drawMale_tech();
  drawFemale_tech();

    drawMale_sports();
  drawFemale_sports();
     
    drawMale_science();
  drawFemale_science();
 
    drawMale_health();
  drawFemale_health();
   
    drawMale_arts();
  drawFemale_arts();
  
    drawMale_style();
  drawFemale_style();
  
    drawMale_opinion();
  drawFemale_opinion();
  
 

  // draw the timer line
  stroke(255,20);
  strokeWeight(2);
  line(x,0,x,height);
}
 
// draw circles based on the # of male pronouns found
void drawMale_main() 
{
  if(maleTotal_main > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(175, 275,mMainSize,mMainSize);
    mMainSize+=5;
  }
  maleTotal_main--;
}
 
// draw rects based on the # of female pronoun found
void drawFemale_main() 
{
  if(femaleTotal_main > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(175, 125,fMainSize,fMainSize);
    fMainSize+=5;
  }
  femaleTotal_main--;
 
}
 
 
// draw circles based on the # of male pronouns found
void drawMale_world() {
  if(maleTotal_world > 0) {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(275, 275,mWorldSize,mWorldSize);
    mWorldSize+=5;
  }
  maleTotal_world--;
}
 
// draw rects based on the # of female pronoun found
void drawFemale_world() {
  if(femaleTotal_world > 0) {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(275, 125, fWorldSize,fWorldSize);
    fWorldSize+=5;
  }
  femaleTotal_world--;
} 


void drawMale_us() 
{
  if(maleTotal_us > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(375, 275,mUSSize,mUSSize);
    mUSSize+=5;
  }
  maleTotal_us--;
}
 
// draw rects based on the # of female pronoun found
void drawFemale_us() 
{
  if(femaleTotal_us > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(375, 125,fUSSize,fUSSize);
    fUSSize+=5;
  }
  femaleTotal_us--;
}

void drawMale_politics() 
{
  if(maleTotal_politics > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(475, 275,mPoliticsSize,mPoliticsSize);
    mPoliticsSize+=5;
  }
  maleTotal_politics--;
}
void drawFemale_politics() 
{
  if(femaleTotal_politics > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(475, 125,fPoliticsSize,fPoliticsSize);
    fPoliticsSize+=5;
  }
  femaleTotal_politics--;
}


void drawMale_business() 
{
  if(maleTotal_business > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(575, 275,mBusinessSize,mBusinessSize);
    mBusinessSize+=5;
  }
  maleTotal_business--;
}
 
void drawFemale_business() 
{
  if(femaleTotal_business > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(575, 125,fBusinessSize,fBusinessSize);
    fBusinessSize+=5;
  }
  femaleTotal_business--;
}


void drawMale_tech() 
{
  if(maleTotal_tech > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(675, 275,mTechSize,mTechSize);
    mTechSize+=5;
  }
  maleTotal_tech--;
}
void drawFemale_tech() 
{
  if(femaleTotal_tech > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(675, 125,fTechSize,fTechSize);
    fTechSize+=5;
  }
  femaleTotal_tech--;
}


void drawMale_sports() 
{
  if(maleTotal_sports > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(775, 275,mSportsSize,mSportsSize);
    mSportsSize+=5;
  }
  maleTotal_sports--;
}
void drawFemale_sports() 
{
  if(femaleTotal_sports > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(775, 125,fSportsSize,fSportsSize);
    fSportsSize+=5;
  }
  femaleTotal_sports--;
}


void drawMale_science() 
{
  if(maleTotal_science > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(875, 275,mScienceSize,mScienceSize);
    mScienceSize+=5;
  }
  maleTotal_science--;
}
void drawFemale_science() 
{
  if(femaleTotal_science > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(875, 125,fScienceSize,fScienceSize);
    fScienceSize+=5;
  }
  femaleTotal_science--;
}


void drawMale_health() 
{
  if(maleTotal_health > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(975, 275,mHealthSize,mHealthSize);
    mHealthSize+=5;
  }
  maleTotal_health--;
}
void drawFemale_health() 
{
  if(femaleTotal_health > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(975, 125,fHealthSize,fHealthSize);
    fHealthSize+=5;
  }
  femaleTotal_health--;
}


void drawMale_arts() 
{
  if(maleTotal_arts > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(1075, 275,mArtsSize,mArtsSize);
    mArtsSize+=5;
  }
  maleTotal_arts--;
}
void drawFemale_arts() 
{
  if(femaleTotal_arts > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(1075, 125,fArtsSize,fArtsSize);
    fArtsSize+=5;
  }
  femaleTotal_arts--;
}


void drawMale_style() 
{
  if(maleTotal_style > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(1175, 275,mStyleSize,mStyleSize);
    mStyleSize+=5;
  }
  maleTotal_style--;
}
void drawFemale_style() 
{
  if(femaleTotal_style > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(1175, 125,fStyleSize,fStyleSize);
    fStyleSize+=5;
  }
  femaleTotal_style--;
}


void drawMale_opinion() 
{
  if(maleTotal_opinion > 0)
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    //stroke(150,150,200);
    stroke(135,206,231);
    ellipse(1275, 275,mOpinionSize,mOpinionSize);
    mOpinionSize+=5;
  }
  maleTotal_opinion--;
}
void drawFemale_opinion() 
{
  if(femaleTotal_opinion > 0) 
  {
    rectMode(CENTER);
    ellipseMode(CENTER);
    noFill();
    stroke(200,150,150);
    //rect(width/4+width/2,height/2,startingSize,startingSize);
    ellipse(1275, 125,fOpinionSize,fOpinionSize);
    fOpinionSize+=5;
  }
  femaleTotal_opinion--;
}


// netEvent() is kind of like mousePressed() in that it
// gets called whenever a makeRequest() finishes.  so
// use it to drive your actions in response to returned
// HTML
void netEvent(HTMLRequest r) {
  html_main = nytimes_main.readRawSource();
  html_world = nytimes_world.readRawSource();
  html_us = nytimes_us.readRawSource();
  html_politics = nytimes_politics.readRawSource();
  html_business = nytimes_business.readRawSource();
  html_tech = nytimes_tech.readRawSource();
  html_sports = nytimes_sports.readRawSource();
  html_science = nytimes_science.readRawSource();
  html_health = nytimes_health.readRawSource();
  html_arts = nytimes_arts.readRawSource();
  html_style = nytimes_style.readRawSource();
  html_opinion = nytimes_opinion.readRawSource();

  gotnew = true;
}
 
// a simple function to find how many times string 'find'
// occurs in string 's'.  copy and use!
int getMatchCount(String find, String s) {
  int m = s.split(find).length;
  return m - 1;
}



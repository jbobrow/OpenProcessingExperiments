
import simpleML.*;

// grabs data from HTML and RSS/XML

XMLRequest r;


String[] headlines;



float startTime = 0;

int w =1121;
int h =875;
int fps = 15;

int seconds = 5; //how often it pulls data
int interval = seconds * 1000;

int x = 0;
int jump = w/(fps*interval/1000);

int woodpecker = 0;
int amur = 0;
int cod = 0;
int turtle = 0;
int orangutan = 0;
int gorilla = 0;
int tuna = 0;
int vaquita = 0;
int dolphin = 0;
int tiger = 0;
int sleopard = 0;
int rhino = 0;
int elephant =0;

int osize = 10;
int rsize = 10;

boolean gotnew = false;

boolean bwoodpecker = false;
boolean bleopard = false;
boolean bcod = true;

int l = 60;
int u = 560;
int d = 110;

int g = 1;
int j = 4;

int twidth= 650;
int theight=500;

PFont fnt;

void setup() {
  
  
 smooth();
 size(w,h);
 frameRate(fps);
 background(255); //overall background color
 
 fnt=loadFont("MyriadPro-CondIt-48.vlw");

 
 r = new XMLRequest(this,"http://www.worldwildlife.org/wwf-feed.xml");
 r.makeRequest();
  
}

void draw() {
  
  textFont(fnt, 14);
 noStroke();
 fill(150);
 rectMode(CORNER);
 rect(0,0,w,h);
 
 float now = millis();
 
 if(now > startTime + interval) {
   //we know this is interval time
   r.makeRequest();
   println("5 seconds");
   startTime = now;
  
  
}

x += jump;

if(x>w) x =0; //resets the rectangle ** I want to change these to a formula
              //consisting of a vertical change in the left portion of the screen
strokeWeight(2);
stroke(255,20);
line(x,0,x,h);

  if(gotnew){
    gotnew=false;
    woodpecker=getMatchCount("Ivory Billed Woodpecker", headlines);
       woodpecker+=getMatchCount("Ivory billed woodpecker", headlines);
       woodpecker+=getMatchCount("woodpecker", headlines);
       
    amur=getMatchCount("Amur Leopard", headlines);
       amur+=getMatchCount("Amur Leopard", headlines);
      // leopard+=getMatchCount("leopard", headlines);
       
    cod=getMatchCount("Cod", headlines);
       cod+=getMatchCount("Atlantic Cod", headlines);
       cod+=getMatchCount("Atlantic cod", headlines);
       
    turtle=getMatchCount("leatherback turtle", headlines);
       turtle+=getMatchCount("Leatherback Turtle", headlines);
       turtle+=getMatchCount("Leatherback turtle", headlines);
       turtle+=getMatchCount("turtle", headlines);
    
    orangutan=getMatchCount("sumatran organutan", headlines);
       orangutan+=getMatchCount("Sumatran Orangutan", headlines);
       orangutan+=getMatchCount("Sumatran Orangutan", headlines);
       orangutan+=getMatchCount("orangutan", headlines);
   
    gorilla=getMatchCount("mountain gorilla", headlines);
       gorilla+=getMatchCount("Mountain Gorilla", headlines);
       gorilla+=getMatchCount("Mountain gorilla", headlines);
       gorilla+=getMatchCount("gorilla", headlines);
    
    tuna=getMatchCount("atlantic bluefin tuna", headlines);
       tuna+=getMatchCount("Atlantic Bluefin Tuna", headlines);
       tuna+=getMatchCount("Atlantic bluefin tuna", headlines);
       tuna+=getMatchCount("tuna", headlines);
    
    vaquita=getMatchCount("vaquita", headlines);
       vaquita+=getMatchCount("Vaquita", headlines);
    
    dolphin=getMatchCount("irrawaddy dolphin", headlines);
       dolphin+=getMatchCount("Irrawaddy Dolphin", headlines);
       dolphin+=getMatchCount("Irrawaddy dolphin", headlines);
       dolphin+=getMatchCount("dolphin", headlines);
    
    tiger=getMatchCount("tiger", headlines);
       tiger+=getMatchCount("Tiger", headlines);
    
    sleopard=getMatchCount("snow leopard", headlines);
       sleopard+=getMatchCount("Snow Leopard", headlines);
       sleopard+=getMatchCount("Snow leopard", headlines);
    
    rhino=getMatchCount("javan rhino", headlines);
       rhino+=getMatchCount("Javan Rhino", headlines);
       rhino+=getMatchCount("Javan rhino", headlines);
    
    elephant=getMatchCount("asain elephant", headlines);
       elephant+=getMatchCount("Asian Elephant", headlines);
       elephant+=getMatchCount("Asian elephant", headlines);
    
    background(60);
    
    osize=10;
    rsize=10;
    
    println("Found "+woodpecker+" mentions of Ivory Billed Woodpeckeres.");
    println("Found "+amur+" mentions of Amur Leopards.");
    println("Found "+cod+" mentions of Cod.");
    println("Found "+turtle+" mentions of Leatherback turtles.");
    println("Found "+orangutan+" mentions of Sumatran Orangutans.");
    println("Found "+gorilla+" mentions of Mountain Gorillas.");
    println("Found "+tuna+" mentions of Atlantic Bluefun Tunas.");
    println("Found "+vaquita+" mentions of Vaquitas.");
    println("Found "+dolphin+" mentions of Irrawaddy Dolphins.");
    println("Found "+tiger+" mentions of Tigers.");
    println("Found "+sleopard+" mentions of Snow Leopards.");
    println("Found "+rhino+" mentions of Javan Rhinos.");
    println("Found "+elephant+" mentions of Asian Elephants.");
  }
  
 if (bwoodpecker) { 
       drawWoodpecker();
       //println("woodpecker");
     }
  else if(bleopard) {
        drawLeopard();
       // println("leopard");
      }
  else if(bcod) {
        drawCod();
       // println("cod");
      } 

drawCloud(); 
draw10List();

} //end of draw

void mouseClicked(){
  if((mouseX > 485 && mouseX< 575) && (mouseY > 774 && mouseY < 850)) {
    bwoodpecker=true;
    bleopard=false;
    bcod=false;
    
  }
  
  else if((mouseX > 610 && mouseX< 740)&&(mouseY >774 && mouseY <850)) {
    bwoodpecker=false;
    bleopard=true;
    bcod=false;
    
  }
  
    else if((mouseX > 775 && mouseX< 915)&&(mouseY >774 && mouseY <850)) {
    bwoodpecker=false;
    bleopard=false;
    bcod=true;
    
  }
  
}
  
  void drawWoodpecker(){
   PImage b;
   b = loadImage("bgwoodpeckerselect.jpg");
   background(b);
   
    //title of animal
     fill(0);
     text("Ivory Billed Woodpecker", width/3.2, height/1.1,420);
     textAlign(CENTER); 
     
     //blurb about animal
     fill(0);
     text("One of the largest woodpeckers in the world at roughly 20 inches in length and 30 inches in wingspan.  Originally native to the forests of southeastern United States, but due to habitat destruction and (to a lesser extent) hunting, its numbers have dwindled to a point where it is uncertain whether any remain.", width/3.2, height/1.8,twidth,500,420);  
     text("The Ivory Billed Woodpecker is classified as critically endangered. However, Cornell, after extensive attempts at locating and helping to revive the species have, as of February 2010, concluded that there is no hope of saving the bird, if it still exists.", width/3.2, height/1.57, twidth, 500, 420); //.25 between lines
     text("Current Population: Unknown", width/2.65, height/1.35,500,420);
     textAlign(CENTER);
     
     //endangered status
  // fill(#CC9933);
   fill(#990000);
   text("Critically", width/1.9,height/1.98,420);
   fill(0);
   
   /*
-- for the text for 'what is trending' this is the top, how to make this flux   
     fill(0);
     text("Ivory Billed Woodpecker", width/10, height/8,420);
     textAlign(CENTER); 
    */
    
    
/*   if(woodpecker > 0){
    noFill();
    stroke(200,150,150);
  //  ellipse(width/4+width/2,height/2,rsize,rsize);
   rsize+=10; //gets bigger more woodpeckers
    fill(0);
    text("woodpeckers", width/4+width/2,height/2,420);
    textAlign(CENTER); 
  }
  woodpecker--;*/
  
  }
  
  void drawLeopard(){
   PImage g;
   g = loadImage("bgleopardselect.jpg");
   background(g);
 
 //title of animal
   fill(0);
     text("Amur Leopard", width/3.2, height/1.1,420);
     textAlign(CENTER);
     
// blurb about animal  
  fill(0);
  text("The Amur Leopard is a leopard subspecies native to the southwestern Primorye region of Russia.  Originally native to northeastern China has been pushed mostly to a small area of 3,000 km2 along the borders with China and North Korea.", width/2.95, height/1.8,600,500,420);
  text("The Amur Leopard is classified as critically endangered.  Its biggest threats are poaching, encroaching civilization, new roads, forest degradation and climate changes.  Plus, if densities of large and medium-sized prey species are low, and therefore competition for food amongst large predators is high, tigers can eliminate these leopards.", width/2.95, height/1.57, 600, 500, 420);
  text("population: 14-20 adults and 5-6 cubs as of 2007",width/2.65, height/1.35,500,420);  
  textAlign(CENTER);

  //endangered status
  // fill(#CC9933);
   fill(#990000);
   text("Critically", width/1.9,height/1.98,420);
   fill(0);
  
  
  /* 
--  for the text for 'what mis trending' this is the top, how to make this flux 
     fill(0);
     text("Amur Leopard", width/10, height/8,420);
     textAlign(CENTER);
     
  */
  
  /* if(leopard > 0){
     noFill();
     stroke(136,206,231);
    // ellipse(width/4, height/2,osize,osize);
    osize+=10;
     fill(0);
     text("leopards", width/4,height/2,420);
     textAlign(CENTER);
   }
   leopard--;*/
  }
  
   void drawCod(){
      PImage c;
    c = loadImage("bgcodselect.jpg");
    background(c);
   
    //title of animal 
    fill(0);
     text("Cod", width/3.2, height/1.1,420);
     textAlign(CENTER);
    //blurb about animal
    fill(0);
    text("The Atlantic Cod has a habitat that ranges from the shoreline down to the continental shelf.  In the 1990's, several cod stocks collapsed and have failed to recover even with the cessation of fishing.  This is causing other problems, as this fish was an apex predator, its decreased numbers has caused a trophic cascade in many areas. ",width/3.2, height/1.8,twidth,theight,420);
    text("The Atlantic Cod is labelled as vulnerable and this is most concerning because it is already the world's largest population of cod.  Threatening it the most is overfishing. Data released in 2011 indicated that even closing fishery would not allow populations to rebound by 2014 to levels required under federal law.",width/3.2, height/1.5, twidth, theight, 420);
    text("Population: see Wikipedia's Spawning text",width/2.6, height/1.3,500,420);
   
   //endangered status
  // fill(#CC9933);
   fill(#996600);
   text("Vulnerable", width/1.9,height/1.98,420);
   fill(0);
   /*
--  for the text for 'what is trending' this is the top, how to make this flux  
     fill(0);
     text("Cod", width/10, height/8,420);
     textAlign(CENTER);
   */  
     
 /*  if(cod > 0){
     noFill();
     stroke(136,206,231);
     //ellipse(width/4, height/2,osize,osize);
    osize+=10;
     fill(0);
    
     textAlign(CENTER);
   }
   leopard--;*/
  }
  
 int getMatchCount(String find, String[] s) {
 int m = 0;
 int lastm = 0;
 for (int i = 0; i < headlines.length; i++) {

   m += s[i].split(find).length;
   if(lastm < m) m -= 1;
   lastm = m;
   //println(headlines[i]);
 }
 return m;
}
  
  //now say go and grab data from webpage, but the problem is you dont know 
//exactly when thats going to happen, so you dont want the program to hang
//or stop while its waiting for data

//akin to capture event or mouse press its a call back
void netEvent(XMLRequest r) {
   //tells it to go get info from r url. then says Im done now what
   headlines = r.getElementArray("title");
   
     //takes raw Data from webpage and assigns it to the html variable
  gotnew = true;
  background(120);
 /* String f = "The"; //what word you're looking for and make sure to include spaces in front and behind the word
 // String g = "the";
 // String h = "the ";
 // int m = getMatchCount(f, html);
//  m += getMatchCount(g,html);
//  m += getMatchCount(h,html);
  // print(html);
  //println("There are "+m+" occurences of "+f+".");
  */
}
 
 void draw10List(){
   textFont(fnt, 14);
   
   textAlign(CENTER);
   text("WWF Top 10 Endangered Species List", w/9.4, u-50);
   
   textAlign(LEFT);
   text("1. Leatherback Turtle", l, u);
   text("2. Sumatran Orangutan", l, u+20);
   text("3. Mountain Gorilla", l, u+40);
   text("4. Atlantic Bluefin Tuna", l,u+60);
   text("5. Vaquita", l,u+80);
   text("6. Irrawaddy Dolphin",l,u+100);
   text("7. Tiger", l,u+120);
   text("8. Snow Leopard", l,u+140);
   text("9. Javan Rhino", l,u+160);
   text("10. Asian Elephant", l,u+180);
 }

void drawCloud(){
  textFont(fnt, 14);
  
  textAlign(CENTER);
  text("Occurance Versus Presentation", w/9.4, 40);
  text("Title", w/9.5, 75);
  
  textAlign(LEFT);
  textFont(fnt, turtle*g+j);
  text("Leatherback Turtle", l, d);
  textFont(fnt, orangutan*g+j);
  text("Sumatran Orangutan", l, d+30);
  textFont(fnt,gorilla*g+j);
  text("Mountain Gorilla", l, d+60);
  textFont(fnt,tuna*g+j);
  text("Atlantic Bluefin Tuna",l,d+90);
  textFont(fnt,vaquita*g+j);
  text("Vaquita", l,d+120);
  textFont(fnt,dolphin*g+j);
  text("Irrawaddy Dolphin", l,d+150);
  textFont(fnt,tiger*g+j);
  text("Tiger", l,d+180);
  textFont(fnt,sleopard*g+j);
  text("Snow Leopard", l,d+210);
  textFont(fnt,rhino*g+j);
  text("Javan Rhino", l,d+240);
  textFont(fnt,elephant*g+j);
  text("Asian Elephant", l,d+270);  
  textFont(fnt,woodpecker*g+j);
  text("Ivory Billed Woodpecker", l, d+300);
  textFont(fnt,amur*g+j);
  text("Amur Leopard", l, d+330);
  
  //textFont(fnt,leopard*g+j);
  //text("Amur Leopard", l, d+330);
  textFont(fnt,cod*g+j);
  text("Atlantic Cod", l, d+360);
}


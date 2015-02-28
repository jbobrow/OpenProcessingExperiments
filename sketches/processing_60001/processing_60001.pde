
import simpleML.*;

//HTMLRequest object that grab HTML data
HTMLRequest glaad;
HTMLRequest glsen;
HTMLRequest pflag;
HTMLRequest hrc;
HTMLRequest trevor;


// this will hold whatever the current HTML is from
// our source URL
String html_glaad = "";
String html_glsen = "";
String html_pflag = "";
String html_hrc = "";
String html_trevor = "";


// we'll use this for timing in draw()
float startTime;
 
// is the requested HTML data ready yet?
boolean gotnew = false;
 
// some basic settings
int w = 1175;
int h = 500;
int fps = 10;
 
// for our timer line
float x = 0;
int interval = 100000000;
float jump = w/(fps*interval/1000);


int siteCount = 0;

// starting size for elements
//int startingSize = 10;
int gay_size = 10;
int lesbian_size = 10;
int bisexual_size = 10;
int trans_size = 10; 
int pansexual_size = 10;
int asexual_size = 10;
int queer_size = 10;
int questioning_size = 10;

// how many many times are certian sexualities/gender identities mentioned on the page?
int gay_total = 0;
int lesbian_total = 0;
int bisexual_total = 0;
int trans_total = 0; 
int pansexual_total = 0;
int asexual_total = 0;
int queer_total = 0;
int questioning_total = 0;

//Declare font
PFont font;

PImage gay_flag;
PImage lesbian_flag;
PImage bisexual_flag;
PImage trans_flag;
PImage pansexual_flag;
PImage asexual_flag;
PImage queer_flag;
PImage questioning_flag;

 
// setup the basics
void setup() 
{
  frame.setBackground(new java.awt.Color(0, 0, 0));
  size(w,h+150);
  smooth();
  frameRate(fps);
  //background(0);
  
  font = loadFont("Helvetica-48.vlw"); 
  
  gay_flag = loadImage("images/gayFlag.PNG");
  lesbian_flag = loadImage("images/lesbianFlag.PNG");
  bisexual_flag = loadImage("images/biFlag.PNG");
  trans_flag = loadImage("images/transFlag.PNG");
  pansexual_flag = loadImage("images/panFlag.PNG");
  asexual_flag = loadImage("images/asexualFlag.PNG");
  queer_flag = loadImage("images/queerFlag.PNG");
  questioning_flag = loadImage("images/questioningFlag.PNG"); 
  
  glaad = new HTMLRequest(this,"http://www.glaad.org/");
  glsen = new HTMLRequest(this,"http://www.glsen.org/cgi-bin/iowa/all/home/index.html");
  pflag = new HTMLRequest(this,"http://community.pflag.org/");
  hrc = new HTMLRequest(this,"http://www.hrc.org/");
  trevor = new HTMLRequest(this,"http://www.thetrevorproject.org/");

  glaad.makeRequest();
  glsen.makeRequest();
  pflag.makeRequest();
  hrc.makeRequest();
  trevor.makeRequest();
 
}

// draw it out
void draw() 
{
  background(0);
  noStroke();
  
  // what time is it
  float now = millis();
   
  // every five seconds, check the website
  if(now > startTime + interval) {
      glaad.makeRequest();
      startTime = now;
  }
  

  // if we have new HTML data, set it up
  if(gotnew && siteCount == 5) 
  {
    
   
    
    gotnew = false;
    siteCount = 0;


  //Gay counts   
    gay_total = 0;
      gay_total += getMatchCount("gay", html_glaad);
      gay_total += getMatchCount("Gay", html_glaad);
      gay_total += getMatchCount("gay", html_glsen);
      gay_total += getMatchCount("Gay", html_glsen);
      gay_total += getMatchCount("gay", html_pflag);
      gay_total += getMatchCount("Gay", html_pflag);
      gay_total += getMatchCount("gay", html_hrc);
      gay_total += getMatchCount("Gay", html_hrc);
      gay_total += getMatchCount("gay", html_trevor);
      gay_total += getMatchCount("Gay", html_trevor);
     
  //Lesbian counts   
    lesbian_total = 0;
      lesbian_total += getMatchCount("Lesbian", html_glaad);
      lesbian_total += getMatchCount("lesbian", html_glaad);
      lesbian_total += getMatchCount("Lesbian", html_glsen);
      lesbian_total += getMatchCount("lesbian", html_glsen);
      lesbian_total += getMatchCount("Lesbian", html_pflag);
      lesbian_total += getMatchCount("lesbian", html_pflag);
      lesbian_total += getMatchCount("Lesbian", html_hrc);
      lesbian_total += getMatchCount("lesbian", html_hrc);
      lesbian_total += getMatchCount("Lesbian", html_trevor);
      lesbian_total += getMatchCount("lesbian", html_trevor);
      
  //Bisexual counts   
    bisexual_total = 0;
      bisexual_total += getMatchCount("Bisexual", html_glaad);
      bisexual_total += getMatchCount("bisexual", html_glaad);
      bisexual_total += getMatchCount("Bisexual", html_glsen);
      bisexual_total += getMatchCount("bisexual", html_glsen);
      bisexual_total += getMatchCount("Bisexual", html_pflag);
      bisexual_total += getMatchCount("bisexual", html_pflag);
      bisexual_total += getMatchCount("Bisexual", html_hrc);
      bisexual_total += getMatchCount("bisexual", html_hrc);
      bisexual_total += getMatchCount("Bisexual", html_trevor);
      bisexual_total += getMatchCount("bisexual", html_trevor);
      
  //Trans counts   
    trans_total = 0;
      trans_total += getMatchCount("transgender", html_glaad);
      trans_total += getMatchCount("Transgender", html_glaad);
      trans_total += getMatchCount("transgender", html_glsen);
      trans_total += getMatchCount("Transgender", html_glsen);
      trans_total += getMatchCount("transgender", html_pflag);
      trans_total += getMatchCount("Transgender", html_pflag);
      trans_total += getMatchCount("transgender", html_hrc);
      trans_total += getMatchCount("Transgender", html_hrc);
      trans_total += getMatchCount("transgender", html_trevor);
      trans_total += getMatchCount("Transgender", html_trevor);
      trans_total += getMatchCount("transsexual ", html_glaad);
      trans_total += getMatchCount("Transsexual ", html_glaad);
      trans_total += getMatchCount("transsexual ", html_glsen);
      trans_total += getMatchCount("Transsexual ", html_glsen);
      trans_total += getMatchCount("transsexual ", html_pflag);
      trans_total += getMatchCount("Transsexual ", html_pflag);
      trans_total += getMatchCount("transsexual ", html_hrc);
      trans_total += getMatchCount("Transsexual ", html_hrc);
      trans_total += getMatchCount("transsexual ", html_trevor);
      trans_total += getMatchCount("Transsexual ", html_trevor);
      
  //Pansexual counts   
    pansexual_total = 0;
      pansexual_total += getMatchCount("Pansexual", html_glaad);
      pansexual_total += getMatchCount("pansexual", html_glaad);
      pansexual_total += getMatchCount("Pansexual", html_glsen);
      pansexual_total += getMatchCount("pansexual", html_glsen);
      pansexual_total += getMatchCount("Pansexual", html_pflag);
      pansexual_total += getMatchCount("pansexual", html_pflag);
      pansexual_total += getMatchCount("Pansexual", html_hrc);
      pansexual_total += getMatchCount("pansexual", html_hrc);
      pansexual_total += getMatchCount("Pansexual", html_trevor);
      pansexual_total += getMatchCount("pansexual", html_trevor);
      
  //Asexual counts   
    asexual_total = 0;
      asexual_total += getMatchCount("Asexual", html_glaad);
      asexual_total += getMatchCount("asexual", html_glaad);
      asexual_total += getMatchCount("Asexual", html_glsen);
      asexual_total += getMatchCount("asexual", html_glsen);
      asexual_total += getMatchCount("Asexual", html_pflag);
      asexual_total += getMatchCount("asexual", html_pflag);
      asexual_total += getMatchCount("Asexual", html_hrc);
      asexual_total += getMatchCount("asexual", html_hrc);
      asexual_total += getMatchCount("Asexual", html_trevor);
      asexual_total += getMatchCount("asexual", html_trevor);
      
  //Queer counts   
    queer_total = 0;
      queer_total += getMatchCount("Queer", html_glaad);
      queer_total += getMatchCount("queer", html_glaad);
      queer_total += getMatchCount("Queer", html_glsen);
      queer_total += getMatchCount("queer", html_glsen);
      queer_total += getMatchCount("Queer", html_pflag);
      queer_total += getMatchCount("queer", html_pflag);
      queer_total += getMatchCount("Queer", html_hrc);
      queer_total += getMatchCount("queer", html_hrc);
      queer_total += getMatchCount("Queer", html_trevor);
      queer_total += getMatchCount("queer", html_trevor);
      
  //Questioning counts   
    questioning_total = 0;
      questioning_total += getMatchCount("Questioning", html_glaad);
      questioning_total += getMatchCount("questioning", html_glaad);
      questioning_total += getMatchCount("Questioning", html_glsen);
      questioning_total += getMatchCount("questioning", html_glsen);
      questioning_total += getMatchCount("Questioning", html_pflag);
      questioning_total += getMatchCount("questioning", html_pflag);
      questioning_total += getMatchCount("Questioning", html_hrc);
      questioning_total += getMatchCount("questioning", html_hrc);
      questioning_total += getMatchCount("Questioning", html_trevor);
      questioning_total += getMatchCount("questioning", html_trevor);



      println("Gay: "+ gay_total);
      println("Lesbian: "+ lesbian_total);
      println("Bisexual: "+ bisexual_total);
      println("Trans: "+ trans_total);
      println("Pansexual: "+ pansexual_total);
      println("Asexual: "+ asexual_total);
      println("Queer: "+ queer_total);
      println("Questioning: "+ questioning_total);


    // reset our element size whenever we have new data to start
    // showing      
      gay_size = 10;
      lesbian_size = 10;
      bisexual_size = 10;
      trans_size = 10; 
      pansexual_size = 10;
      asexual_size = 10;
      queer_size = 10;
      questioning_size = 10;    
  }
  
  stroke(255);
  
  /*
  //Border Lines
  line(25, 0, 25, h);  
  line(0,25,w,25);
  line(w-25,0,w-25,h);
  line(0,h-25,w,h-25);
  
  //Horizontal lines
  line(w/2,0,w/2,h);
  line(w/4,0,w/4,h);
  line(w-(w/4),0,w-(w/4),h);
  
  //Vertical lines
  line(0,h/2,w,h/2);
 */

  tint(255,50);
  image(gay_flag, 20, 25, 200,200);
  image(lesbian_flag, 230, 25, 200,200);
  image(bisexual_flag, 440, 25, 200, 200); 
  image(trans_flag, 650, 25, 200, 200);
  image(pansexual_flag, 20, 275, 200, 200);
  image(asexual_flag, 230, 275, 200,200);
  image(queer_flag, 440, 275, 200, 200);
  image(questioning_flag, 650, 275, 200, 200);
  
  noTint();
 //draw gay flag 
 if(gay_total < 100)
 {
  image(gay_flag, 20, 25, gay_total+100,gay_total+100);
 }
 else
 {
     image(gay_flag, 20, 25, 200,200);
 }
 
 
 //draw lesbian flag
 if(lesbian_total < 100)
 {
  image(lesbian_flag, 230, 25, lesbian_total+100,lesbian_total+100);
 }
 else
 {
  image(lesbian_flag, 230, 25, 200,200);
 }
 
 
 //draw bisexual flag
 if(bisexual_total < 100)
 {
   image(bisexual_flag, 440, 25, bisexual_total+100,bisexual_total+100);
 } 
 else
 {
   image(bisexual_flag, 440, 25, 200, 200); 
 }


 //draw trans* flag
 if(trans_total < 100)
 {
    image(trans_flag, 650, 25, trans_total+100,trans_total+100);
 }
 else
 {
    image(trans_flag, 650, 25, 200, 200);
 }

 //draw pan flag
 if(pansexual_total < 100)
 {
  image(pansexual_flag, 20, 275, pansexual_total+100,pansexual_total+100);
 }
 else
 {
   image(pansexual_flag, 20, 275, 200, 200);
 }

  //draw asexual flag
  if(asexual_total < 100)
  {
    image(asexual_flag, 230, 275, asexual_total+100,asexual_total+100);
  }
  else
  {
    image(asexual_flag, 230, 275, 200,200);
  }
  
  //draw queer flag
  if(queer_total < 100)
  {
    image(queer_flag, 440, 275, queer_total+100,queer_total+100);
  }
  else
  {
    image(queer_flag, 440, 275, 200, 200);
  }
  
  //draw questioning flag
  if(questioning_total < 100)
  {
    image(questioning_flag, 650, 275, questioning_total+100,questioning_total+100);
  }
  else
  {
    image(questioning_flag, 650, 275, 200, 200);
  }
  
  
  
  //DRAW BACKGROUND IMAGES  
  
//DRAWING TEXT
  textFont(font,20);
  text("GAY: " + gay_total, 20,22);
  text("LESBIAN: " + lesbian_total, 230 ,22);
  text("BISEXUAL: " +bisexual_total, 440,22);
  text("TRANS*: " + trans_total, 650,22);
 
  text("PANSEXUAL: " + pansexual_total, 20,270);
  text("ASEXUAL: " + asexual_total, 230, 270);
  text("QUEER: " + queer_total, 440, 270);
  text("QUESTIONING: " + questioning_total, 650, 270);


  //Gay Stats
  if(mouseX > 20 && mouseX < 220 && mouseY > 25 && mouseY < 225)
  {
    
   int glaad_gay = 0;
    glaad_gay += getMatchCount("gay", html_glaad);
    glaad_gay += getMatchCount("Gay", html_glaad);
   
   int glsen_gay = 0;
    glsen_gay += getMatchCount("gay", html_glsen);
    glsen_gay += getMatchCount("Gay", html_glsen);
   
   int pflag_gay = 0;
      pflag_gay += getMatchCount("gay", html_pflag);
      pflag_gay += getMatchCount("Gay", html_pflag);
      
    int hrc_gay = 0;
      hrc_gay += getMatchCount("gay", html_hrc);
      hrc_gay += getMatchCount("Gay", html_hrc);  

    int trevor_gay = 0;
      trevor_gay += getMatchCount("gay", html_trevor);
      trevor_gay += getMatchCount("Gay", html_trevor);   
      
   text("Gay Statistics by Site:", 870,50);
   text("GLAAD: " + glaad_gay, 870, 70); 
   text("GLSEN: " + glsen_gay,870,90);
   text("PFLAG: " + pflag_gay,870,110);
   text("HRC: " + hrc_gay, 870, 130);
   text("TREVOR PROJECT: " + trevor_gay, 870, 150);

   text("Gay:", 20,525);
   text("A male-identified person who is attracted to other male-identified people.", 20, 550);
   text("Also used as an umbrella term.", 20,575);

  }

  //Lesbian Stats
  if(mouseX > 230 && mouseX < 430 && mouseY > 25 && mouseY < 225)
  {
   int glaad_lesbian = 0;
    glaad_lesbian += getMatchCount("Lesbian", html_glaad);
    glaad_lesbian += getMatchCount("lesbian", html_glaad);
   
   int glsen_lesbian = 0;
    glsen_lesbian += getMatchCount("Lesbian", html_glsen);
    glsen_lesbian += getMatchCount("lesbian", html_glsen);
   
   int pflag_lesbian = 0;
      pflag_lesbian += getMatchCount("Lesbian", html_pflag);
      pflag_lesbian += getMatchCount("lesbian", html_pflag);
      
    int hrc_lesbian = 0;
      hrc_lesbian += getMatchCount("Lesbian", html_hrc);
      hrc_lesbian += getMatchCount("lesbian", html_hrc);  

    int trevor_lesbian = 0;
      trevor_lesbian += getMatchCount("Lesbian", html_trevor);
      trevor_lesbian += getMatchCount("lesbian", html_trevor);   
      
   text("Lesbian Statistics by Site:", 870,50);
   text("GLAAD: " + glaad_lesbian, 870, 70); 
   text("GLSEN: " + glsen_lesbian,870,90);
   text("PFLAG: " + pflag_lesbian,870,110);
   text("HRC: " + hrc_lesbian, 870, 130);
   text("TREVOR PROJECT: " + trevor_lesbian, 870, 150);

   text("Lesbian:", 20,525);
   text("A female-identified person who is attracted to other female-identified people.", 20,550);

  }
  
  //Bi Stats
  if(mouseX > 440 && mouseX < 640 && mouseY > 25 && mouseY < 225)
  {
   int glaad_Bisexual = 0;
    glaad_Bisexual += getMatchCount("Bisexual", html_glaad);
    glaad_Bisexual += getMatchCount("bisexual", html_glaad);
   
   int glsen_Bisexual = 0;
    glsen_Bisexual += getMatchCount("Bisexual", html_glsen);
    glsen_Bisexual += getMatchCount("bisexual", html_glsen);
   
   int pflag_Bisexual = 0;
      pflag_Bisexual += getMatchCount("Bisexual", html_pflag);
      pflag_Bisexual += getMatchCount("bisexual", html_pflag);
      
    int hrc_Bisexual = 0;
      hrc_Bisexual += getMatchCount("Bisexual", html_hrc);
      hrc_Bisexual += getMatchCount("bisexual", html_hrc);  

    int trevor_Bisexual = 0;
      trevor_Bisexual += getMatchCount("Bisexual", html_trevor);
      trevor_Bisexual += getMatchCount("bisexual", html_trevor);   
      
     text("Bisexual Statistics by Site:", 870,50);
     text("GLAAD: " + glaad_Bisexual,870, 70); 
     text("GLSEN: " + glsen_Bisexual,870,90);
     text("PFLAG: " + pflag_Bisexual,870,110);
     text("HRC: " + hrc_Bisexual, 870, 130);
     text("TREVOR PROJECT: " + trevor_Bisexual, 870, 150);
 
     text("Bisexual:", 20,525);
     text("Someone who is attracted to people of two different genders.", 20,550);
     text("Most commonly refers to people attracted to men and women.", 20,575);
  }
  
  //Trans* Stats
  if(mouseX > 650 && mouseX < 850 && mouseY > 25 && mouseY < 225)
  {
   int glaad_transgender = 0;
    glaad_transgender += getMatchCount("transgender", html_glaad);
    glaad_transgender += getMatchCount("Transgender", html_glaad);
    glaad_transgender += getMatchCount("transsexual", html_glaad);
    glaad_transgender += getMatchCount("Transsexual", html_glaad);

   
   int glsen_transgender = 0;
    glsen_transgender += getMatchCount("transgender", html_glsen);
    glsen_transgender += getMatchCount("Transgender", html_glsen);
    glsen_transgender += getMatchCount("transsexual", html_glsen);
    glsen_transgender += getMatchCount("Transsexual", html_glsen);

   
   int pflag_transgender = 0;
      pflag_transgender += getMatchCount("transgender", html_pflag);
      pflag_transgender += getMatchCount("Transgender", html_pflag);
      pflag_transgender += getMatchCount("transsexual", html_pflag);
      pflag_transgender += getMatchCount("Transsexual", html_pflag);

      
    int hrc_transgender = 0;
      hrc_transgender += getMatchCount("transgender", html_hrc);
      hrc_transgender += getMatchCount("Transgender", html_hrc);  
      hrc_transgender += getMatchCount("transsexual", html_hrc);
      hrc_transgender += getMatchCount("Transsexual", html_hrc);  


    int trevor_transgender = 0;
      trevor_transgender += getMatchCount("transgender", html_trevor);
      trevor_transgender += getMatchCount("Transgender", html_trevor);   
      trevor_transgender += getMatchCount("transsexual", html_trevor);
      trevor_transgender += getMatchCount("Transsexual", html_trevor);   

     
     text("Transgender Statistics by Site:", 870,50);
     text("GLAAD: " + glaad_transgender, 870, 70); 
     text("GLSEN: " + glsen_transgender,870,90);
     text("PFLAG: " + pflag_transgender,870,110);
     text("HRC: " + hrc_transgender, 870, 130);
     text("TREVOR PROJECT: " + trevor_transgender, 870, 150);
 
     text("Transgender:", 20,525);
     text("Someone who's gender identity does not align with their societally assigned gender", 20,550);
     text("Other common term: transsexual", 20,575);

  }



  //Pansexual Stats
  if(mouseX > 20 && mouseX < 220 && mouseY > 275 && mouseY < 475)
  {
   int glaad_pansexual = 0;
    glaad_pansexual += getMatchCount("pansexual", html_glaad);
    glaad_pansexual += getMatchCount("Pansexual", html_glaad);
   
   int glsen_pansexual = 0;
    glsen_pansexual += getMatchCount("pansexual", html_glsen);
    glsen_pansexual += getMatchCount("Pansexual", html_glsen);
   
   int pflag_pansexual = 0;
      pflag_pansexual += getMatchCount("pansexual", html_pflag);
      pflag_pansexual += getMatchCount("Pansexual", html_pflag);
      
    int hrc_pansexual = 0;
      hrc_pansexual += getMatchCount("pansexual", html_hrc);
      hrc_pansexual += getMatchCount("Pansexual", html_hrc);  

    int trevor_pansexual = 0;
      trevor_pansexual += getMatchCount("pansexual", html_trevor);
      trevor_pansexual += getMatchCount("Pansexual", html_trevor);   
      
     text("Pansexual Statistics by Site:", 870,50);
     text("GLAAD: " + glaad_pansexual, 870, 70); 
     text("GLSEN: " + glsen_pansexual,870,90);
     text("PFLAG: " + pflag_pansexual,870,110);
     text("HRC: " + hrc_pansexual, 870, 130);
     text("TREVOR PROJECT: " + trevor_pansexual, 870, 150);
     
     text("Pansexual:", 20,525);
     text("Someone who is sexually attracted to persons of all gender-idenities.", 20,550);

  }

  //Asexual Stats
  if(mouseX > 230  && mouseX < 430 && mouseY > 275 && mouseY < 475)
  {
   int glaad_asexual = 0;
    glaad_asexual += getMatchCount("asexual", html_glaad);
    glaad_asexual += getMatchCount("Asexual", html_glaad);
   
   int glsen_asexual = 0;
    glsen_asexual += getMatchCount("asexual", html_glsen);
    glsen_asexual += getMatchCount("Asexual", html_glsen);
   
   int pflag_asexual = 0;
      pflag_asexual += getMatchCount("asexual", html_pflag);
      pflag_asexual += getMatchCount("Asexual", html_pflag);
      
    int hrc_asexual = 0;
      hrc_asexual += getMatchCount("asexual", html_hrc);
      hrc_asexual += getMatchCount("Asexual", html_hrc);  

    int trevor_asexual = 0;
      trevor_asexual += getMatchCount("asexual", html_trevor);
      trevor_asexual += getMatchCount("Asexual", html_trevor);   
      
     text("Asexual Statistics by Site:", 870,50);
     text("GLAAD: " + glaad_asexual, 870, 70); 
     text("GLSEN: " + glsen_asexual,870,90);
     text("PFLAG: " + pflag_asexual,870,110);
     text("HRC: " + hrc_asexual, 870, 130);
     text("TREVOR PROJECT: " + trevor_asexual, 870, 150);
     
     text("Asexual:", 20,525);
     text("Someone who does not experience sexual attraction.", 20,550);

  }
  
  //Queer Stats
  if(mouseX > 440 && mouseX < 640 && mouseY > 275 && mouseY < 475)
  {
   int glaad_queer = 0;
    glaad_queer += getMatchCount("queer", html_glaad);
    glaad_queer += getMatchCount("Queer", html_glaad);
   
   int glsen_queer = 0;
    glsen_queer += getMatchCount("queer", html_glsen);
    glsen_queer += getMatchCount("Queer", html_glsen);
   
   int pflag_queer = 0;
      pflag_queer += getMatchCount("queer", html_pflag);
      pflag_queer += getMatchCount("Queer", html_pflag);
      
    int hrc_queer = 0;
      hrc_queer += getMatchCount("queer", html_hrc);
      hrc_queer += getMatchCount("Queer", html_hrc);  

    int trevor_queer = 0;
      trevor_queer += getMatchCount("queer", html_trevor);
      trevor_queer += getMatchCount("Queer", html_trevor);   
      
     text("Queer Statistics by Site:", 870,50);
     text("GLAAD: " + glaad_queer, 870, 70); 
     text("GLSEN: " + glsen_queer,870,90);
     text("PFLAG: " + pflag_queer,870,110);
     text("HRC: " + hrc_queer, 870, 130);
     text("TREVOR PROJECT: " + trevor_queer, 870, 150);  
     
     text("Queer:", 20,525);
     text("An umbrella terms used to refer to people who are not heterosexual and/or cisgender.", 20,550);
     text("Not a fully accepted term. Alternative terms: LGBT+, LGBTQPIA, GSM (Gender-Sexual Minority).", 20,575);

 
 }
    
  
  //Questioning Stats
  if(mouseX > 650 && mouseX < 850 && mouseY > 275 && mouseY < 475)
  {
   int glaad_questioning = 0;
    glaad_questioning += getMatchCount("questioning", html_glaad);
    glaad_questioning += getMatchCount("Questioning", html_glaad);
   
   int glsen_questioning = 0;
    glsen_questioning += getMatchCount("questioning", html_glsen);
    glsen_questioning += getMatchCount("Questioning", html_glsen);
   
   int pflag_questioning = 0;
      pflag_questioning += getMatchCount("questioning", html_pflag);
      pflag_questioning += getMatchCount("Questioning", html_pflag);
      
    int hrc_questioning = 0;
      hrc_questioning += getMatchCount("questioning", html_hrc);
      hrc_questioning += getMatchCount("Questioning", html_hrc);  

    int trevor_questioning = 0;
      trevor_questioning += getMatchCount("questioning", html_trevor);
      trevor_questioning += getMatchCount("Questioning", html_trevor);   
      
     text("Questioning Statistics by Site:", 870,50);
     text("GLAAD: " + glaad_questioning, 870, 70); 
     text("GLSEN: " + glsen_questioning,870,90);
     text("PFLAG: " + pflag_questioning,870,110);
     text("HRC: " + hrc_questioning, 870, 130);
     text("TREVOR PROJECT: " + trevor_questioning, 870, 150);  
     
     text("Questioning:", 20, 525);
     text("A term referring to people who are currently questioning their sexual orientation or gender identity.", 20,550);

 }
}

void netEvent(HTMLRequest r) 
{
  siteCount++;
  
  html_glaad = glaad.readRawSource();
  html_glsen = glsen.readRawSource();
  html_pflag = pflag.readRawSource();
  html_hrc = hrc.readRawSource();
  html_trevor = trevor.readRawSource();

  gotnew = true;
}
      
int getMatchCount(String find, String s) 
{
  int m = s.split(find).length;
  return m - 1;
}


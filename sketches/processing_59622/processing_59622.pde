
import java.util.*;

XMLElement[] tweets; // array of tweets as XML
ArrayList Rects = new ArrayList(); // arraylist for Rects


SimpleDateFormat sdf;
SimpleDateFormat day_of_year;
SimpleDateFormat year_format;

long starttime; 
int startday;
int yearnum = 0;
int startyear = 2012;
int colwidth = 15;
int rowh = 15;
String showreplies = "";

PFont font;

void setup() {
  size(1800, 1100);
  XMLElement data = new XMLElement(this, "twdocs_com.xml");
  font = createFont("Helvetica",12);
  tweets = data.getChildren();
  noStroke();  
  sdf = new SimpleDateFormat("EEE MMM d HH:mm:ss Z yyyy");   
  day_of_year = new SimpleDateFormat("D");
  year_format = new SimpleDateFormat("yyyy");

}


void draw() {
  

   
   translate(90,30);
  background(255);
  int xp = 800;
  int yp = 800;
  int xmargin = 6;
int colspacing = 7;
int colwidth = 50;
float yscale = 19;
  
  int currentday =-1;
  background(255);
  smooth();
    
    
    stroke(205,200,177);
    line(1500, 920, 0, 920);
    font = createFont("Helvetica",24);
    
  fill(255,200,100);
   text("Twitter Data visualisation",10, 30);

  


  for (int i=tweets.length-1; i>0 ; i--) {
    XMLElement tweet = tweets[i];
    String reply = tweet.getChild("source").getContent();
    try {
      Date tweetdate = sdf.parse(tweet.getChild("created_at").getContent());
      int daynum = int(day_of_year.format(tweetdate));
      if (i == tweets.length-1) startday = daynum;
      int yr = int(year_format.format(tweetdate));
      int totalday = daynum + ((yr - startyear) * 10);
      int dayindex = totalday - startday;

      if (dayindex > currentday) { // start drawing a new column
        yp = 900; // go back to baseline
      } 
      else {
        yp -= 16; // move the y pos up a bit
      }
      
//
//     if (reply == null) fill(255); 
//      else fill(131,139,131);

      if ( match(tweet.getChild("text").getContent(),"[أ-ب-ت-ث-ج-ح-خ-د-ذ-ر-ز-س-ش-ص-ض-ط-ظ-ع-غ-ف-ق-ك-ل-م-ن-هـ-و-ي]") == null  ) fill(105,105,105);//dark gray
     else fill (211,211,211);//gray 

      //if (reply != null && reply.equals(showreplies)) fill(0);
      
      String[] bodymatch = match(tweet.getChild("text").getContent(), '@' + showreplies);
      if (bodymatch != null && bodymatch.length > 0) fill(255,200,100);//orange
      stroke(255); 
      
      if (mouseX > dayindex*colwidth && mouseX < (dayindex+2)*colwidth
        && mouseY > yp && mouseY < yp + rowh ) { // rollover on this rect
        showTweet(i);
        
//        if (mousePressed) showreplies = reply; // set the current reply filter
        fill(255);
        stroke(0);
      }

         //rect(i*xp, yp, colwidth, 9  );
         
     //rect(i*xp,yp,xmargin, 9 );
      
     // rect(dayindex*rowh , yp,rowh , 350  ); 
     rect(dayindex*colwidth, yp, colwidth-1, rowh  ); 
      currentday = dayindex; // update current day
    } 
    catch (Exception E) {
      println(E);
    }
  }
  

}


void showTweet(int num) {
  XMLElement tweet = tweets[num];
  fill(0);
  text(tweet.getChild("text").getContent(), 100, 350   );
}




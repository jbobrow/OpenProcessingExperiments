
PImage b;
PImage news;

PFont fonthead;
PFont fontsub;


//bbc rss feed 
String url = "http://feeds.bbci.co.uk/news/rss.xml";   
XMLElement rss = new XMLElement(this, url);  

//cnn rss feed
String url2 = "http://rss.cnn.com/rss/edition_world.rss";
XMLElement rssCNN = new XMLElement(this, url2);

//Guardian rss feed
String url3 = "http://feeds.guardian.co.uk/theguardian/world/rss";
XMLElement rssGuardian = new XMLElement(this, url3);

//independant rss feed
String url4 = "http://rss.feedsportal.com/c/266/f/3496/index.rss";
XMLElement rssIndependant = new XMLElement(this, url4);

//bbc sport rss feed
String url5 = "http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/front_page/rss.xml";
XMLElement rssBBCSport = new XMLElement(this, url5);

//sky sport rss feed
String url6 = "http://www.skysports.com/rss/0,20514,11661,00.xml";
XMLElement rssSkySport = new XMLElement(this, url6);

//Guardian sport rss feed
String url7 = "http://feeds.guardian.co.uk/theguardian/sport/rss";
XMLElement rssGuardianSport = new XMLElement(this, url7);

//Mashable tech rss feed
String url8 = "http://feeds.mashable.com/Mashable";
XMLElement rssMashableTech = new XMLElement(this, url8);

//CNET tech rss feed
String url9 = "http://www.cnet.co.uk/rss/crave/n-6is/e";
XMLElement rssCNETTech = new XMLElement(this, url9);

//Wired tech rss feed
String url10 = "http://feeds.wired.com/wired/gadgets";
XMLElement rssWiredTech = new XMLElement(this, url10);

//Mashable Entertainment rss feed
String url11 = "http://feeds.nytimes.com/nyt/rss/Arts";
XMLElement rssNyEntertain = new XMLElement(this, url11);

//Guardian Entertainment rss feed
String url12 = "http://feeds.guardian.co.uk/theguardian/culture/rss";
XMLElement rssGuardianEntertain = new XMLElement(this, url12);

//Strathclyde weather warning rss feed
String url13 = "http://www.metoffice.gov.uk/public/data/PWSCache/Warnings/RSS/Region/st";
XMLElement rssWeather = new XMLElement(this, url13);


void setup()
{
  size(1024, 677);
  smooth();
  b=loadImage("background.jpg");
  news=loadImage("news.png"); 
  background(b);
  fonthead=loadFont("Arial-Black-48.vlw");
  fontsub=loadFont("Arial-ItalicMT-48.vlw");
  fill(0);

  textAlign(CENTER);
  frameRate(0.5);
}

void draw()
{
  imageMode(CENTER);
  image(news, width/2, height/2);
  
  //for loop for bbc news feed
//XMLElement[] bbcHeadlineXMLElements = rss.getChildren("channel/item/title");   
//for (int i = 0; i < bbcHeadlineXMLElements.length-78; i++) 
//{   
//    String bbcHeadline = bbcHeadlineXMLElements[i].getContent();   
//    println(i + ": " + bbcHeadline);  
//    
//    //red color for serious news
//    fill(247,5,5);
//    
//    //number one headline on bbc news rss feed
//    text("BBC News Headline : ",350,210);
//    text(bbcHeadline,350,223);
//}

//for loop for cnn headline
XMLElement[] cnnHeadlineXMLElements = rssCNN.getChildren("channel/item/title");   
for (int i = 0; i < cnnHeadlineXMLElements.length-9; i++) 
{   
    String cnnHeadline = cnnHeadlineXMLElements[i].getContent();   
    println(i + ": " + cnnHeadline);  
   
    //red color for serious news
    fill(247,5,5);
   
    //number one headline on cnn news rss feed
    textFont(fonthead, 14);
    text("Cnn News Headline : ",width/2, 355);
    textFont(fontsub, 12);
    text(cnnHeadline,width/2, 365);
}

//for loop for guardian headline
XMLElement[] guardianHeadlineXMLElements = rssGuardian.getChildren("channel/item/title");   
for (int i = 0; i < guardianHeadlineXMLElements.length-29; i++) 
{   
    String guardianHeadline = guardianHeadlineXMLElements[i].getContent();   
    println(i + ": " + guardianHeadline);  
    
    //red color for serious news
    fill(247,5,5);
    
    //number one headline on guardian news rss feed
    textFont(fonthead, 14);
    text("Guardian News Headline : ", width/2 ,295);
    textFont(fontsub, 12);
    text(guardianHeadline,width/2, 305);
}

//for loop for independant headline
XMLElement[] independantHeadlineXMLElements = rssIndependant.getChildren("channel/item/title");   
for (int i = 0; i < independantHeadlineXMLElements.length-24; i++) 
{   
    String independantHeadline = independantHeadlineXMLElements[i].getContent();   
    println(i + ": " + independantHeadline);  
    
    //red color for serious news
    fill(247,5,5);
    
    //number one headline on independant news rss feed
    textFont(fonthead, 14);
    text("Independant News Headline : ",width/2,445);
    textFont(fontsub, 12);
    text(independantHeadline,width/2,455);
}

//for loop for bbc sport headline
XMLElement[] bbcSportXMLElements = rssBBCSport.getChildren("channel/item/title");   
for (int i = 0; i < bbcSportXMLElements.length-14; i++) 
{   
    String bbcSport = bbcSportXMLElements[i].getContent();   
    println(i + ": " + bbcSport);  
    
    //blue color for sport  news
    fill(30,88,245);
    
    //number one headline on bbc sport rss feed
    textFont(fonthead, 14);
    text("BBC Sport Headline : ",width/2, 325);
    textFont(fontsub, 12);
    text(bbcSport,width/2,335);
}

//for loop for sky sport
XMLElement[] skySportXMLElements = rssSkySport.getChildren("channel/item/title");   
for (int i = 0; i < skySportXMLElements.length-18; i++) 
{   
    String skySport = skySportXMLElements[i].getContent();   
    println(i + ": " + skySport);  
    
    //blue color for sport news
    fill(30,88,245);
    
    //number one headline on sky sport rss feed
    textFont(fonthead,14);
    text("Sky Sport Headline : " ,width/2,235);
    textFont(fontsub, 12);
    text( skySport,width/2,245);
}

//for loop for guardian sport
XMLElement[] guardianSportXMLElements = rssGuardianSport.getChildren("channel/item/title");   
for (int i = 0; i < guardianSportXMLElements.length-29; i++) 
{   
    String guardianSport = guardianSportXMLElements[i].getContent();   
    println(i + ": " + guardianSport);  
    
    //blue color for sport news
    fill(30,88,245);
    
    //number one headline on guardian sport rss feed
    textFont(fonthead, 14);
    text("Guardian Sport Headline : " ,width/2,205);
    textFont(fontsub, 12);
    text(guardianSport,width/2,215);
}

//for loop for mashable tech
XMLElement[] mashableTechXMLElements = rssMashableTech.getChildren("channel/item/title");   
for (int i = 0; i < mashableTechXMLElements.length-29; i++) 
{   
    String mashableTech = mashableTechXMLElements[i].getContent();   
    println(i + ": " + mashableTech);  
    
    //purple color for tech news
    fill(161,30,245);
    
    //number one headline on mashable tech rss feed
    textFont(fonthead, 14);
    text("Mashable Tech Headline : ",width/2,385);
    textFont(fontsub, 12);
    text(mashableTech,width/2,395);
}

//for loop for cnet tech
XMLElement[] cnetTechXMLElements = rssCNETTech.getChildren("channel/item/title");   
for (int i = 0; i < cnetTechXMLElements.length-19; i++) 
{   
    String cnetTech = cnetTechXMLElements[i].getContent();   
    println(i + ": " + cnetTech);  
    
    //purple color for tech news
    fill(161,30,245);
    
    //number one headline on cnet tech rss feed
    textFont(fonthead, 14);
    text("CNET Tech Headline : " ,width/2,265);
    textFont(fontsub, 12);
    text(cnetTech,width/2,275);
}

//for loop for new york times entertainment
XMLElement[]  nyEntertainXMLElements = rssNyEntertain.getChildren("channel/item/title");   
for (int i = 0; i < nyEntertainXMLElements.length-36; i++) 
{   
    String nyEntertain = nyEntertainXMLElements[i].getContent();   
    println(i + ": " + nyEntertain);  
    
    //green color for entertainment news
    fill(47,222,9);
   
    //number one headline on new york times entertainment rss feed
    text("New York Times Entertainment Headline : " , width/2,230);
    text (nyEntertain,width/2,240);
}

//for loop for guardian entertainment
XMLElement[]  guardianEntertainXMLElements = rssGuardianEntertain.getChildren("channel/item/title");   
for (int i = 0; i < guardianEntertainXMLElements.length-29; i++) 
{   
    String guardianEntertain = guardianEntertainXMLElements[i].getContent();   
    println(i + ": " + guardianEntertain);  
    
    //green color for entertain news
    fill(47,222,9);
    
    //number one headline on bbc news rss feed
    textFont(fonthead, 14);
    text("Guardian Entertainment Headline : " ,width/2, 415);
    textFont(fontsub, 12);
    text(guardianEntertain,width/2,425);

  }
//  
  //for loop for weather updates
XMLElement[]  weatherXMLElements = rssWeather.getChildren("channel/item/title");   
for (int i = 0; i < weatherXMLElements.length-1; i++) 
{   
    String weather = weatherXMLElements[i].getContent();   
    println(i + ": " + weather);  
    
    //green color for entertain news
    fill(242,84,10);
    
    //number one headline on bbc news rss feed
    textFont(fonthead, 14);
    text("Weather warnings in the strathclyde area : " ,width/2, 475);
    textFont(fontsub, 12);
    text(weather,width/2, 485);

  }
  
  
  int d=day();
  int m=month();
  int y=year();
  
  
  fill(255);
  
  textFont(fonthead, 20);
  text(d+"."+m+"."+y, width/2+400, 600);
   


}




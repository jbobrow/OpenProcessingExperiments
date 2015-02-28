
//image-------------------------

  

int maxImages = 24;
int i = 0;

PImage[] photo = new PImage[maxImages];
String api  = "http://api.flickr.com/services/rest/?method=flickr.tags.getClusterPhotos&";

//date-------------------------

int x = 0;
int y = 0;

PFont fontA;
PFont fontB;
PFont fontC;
PFont fontD;

  
void setup() {
  
size(1440, 792);
frameRate(1);
smooth();
background(0);
 
  fontA = loadFont("NeutraDisp-Bold-25.vlw");
  fontB = loadFont("NeutraDisp-Bold-30.vlw");
  fontC = loadFont("NeutraDisp-Bold-140.vlw");
  fontD = loadFont("NeutraDisp-Bold-20.vlw");
}

void draw() {
  
  loop();
  noStroke();
  background(0);
  randomSeed(year()+month()+day());
  
String adverbe = "ALWAYS ,NEVER ";
String[] adv = split(adverbe, ',');
int a = int(random(0,2));

String verbe = "TRY TO UNDERSTAND ,INTERPRET ,OBSERVE ,ANALYZE ,THINK WITH ,THINK ABOUT ,WORK WITH ,JUGGLE WITH ,UNGROUP ,FRAGMENT ,MOVE ,TRANSCRIBE ,MARRY ,HIGHLIGHT ,ASSOCIATE ,DIVIDE ,PERFECT ,SEPARATE ,GATHER ,CHANGE ";
String[] ver = split(verbe, ',');
int v = int(random(0,20));

String sujet = "SUBJECT,ELEMENTS,DEMAND,CONDITIONS,DATA,COLORS,FORMS,AXES";
String[] suj = split(sujet, ',');
int s = int(random(0,8));
  
  
  String query = api + "tag="+suj[s]+"&cluster_id=1&format=rest&extras=url_o&api_key=2e5e4db7eb0dd7d3b9f4f0f35de336d2";
  println("Our final query URL:" + query);
  println("**********************");

  XMLElement xml = new XMLElement(this, query);
  println(xml);

  XMLElement[] photoTag = xml.getChildren("photos/photo");
  
  i = int(random(0,photoTag.length));


  String farm = photoTag[i].getString("farm");
  String server = photoTag[i].getString("server");
  String id = photoTag[i].getString("id");
  String secret = photoTag[i].getString("secret"); 
  String img = "http://farm"+farm+".static.flickr.com/"+server+"/"+id+"_"+secret+".jpg";
//  println(photo);
  
   
//  println("this is the photo n°"+i);
//  println("the tag name is "+suj[s]);
  photo[i] = loadImage( img );
    
  imageMode(CENTER);
  
   if (photo[i].width < width){
   x = width-photo[i].width;
 }
 
  if (photo[i].height < height){
   y = height-photo[i].height;
 }
  
 if (x>y){
 image(photo[i], width/2, height/2, photo[i].width+x, photo[i].height+x);
 }
 else {
 image(photo[i], width/2, height/2, photo[i].width+y, photo[i].height+y);
 }
   

noStroke();
int r= int(map(hour(),0,23,0,255));    
int g= int(map(minute(),0,59,0,255));
int b= int(map(second(),0,59,0,255));

int r2= -1*(r-255);
int g2= -1*(g-255);
int b2= -1*(b-255);

fill(r,g,b,200);
rectMode(CENTER);
rect(width/2,height/2,160,height/3*2);

fill(r2,g2,b2);
textFont(fontA);
textAlign(CENTER, CENTER);
String jour = "MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY,SUNDAY";
String[] jour2 = split(jour, ',');
//int jour3 = int(String.valueOf(day()));
 Calendar cal = new GregorianCalendar(year()-1, month()-1, day());
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK)-1;
text(jour2[dayOfWeek],width/2,height/100*23,width,height); 

textFont(fontA);
textAlign(CENTER, CENTER);
String mois = "JANUARY,FEBRUARY,MARCH,APRIL,MAY,JUNE,JULY,AUGUST,SEPTEMBER,OCTOBER,NOVEMBER,DECEMBER";
String[] mois2 = split(mois, ',');
int mois3 = int(String.valueOf(month()-1));
text(mois2[mois3],width/2,height/100*40,width,height);

textFont(fontC);
textAlign(CENTER, CENTER);
String num = String.valueOf(day());
text(num,width/2,height/100*29,width,height);
//int y=245;


textFont(fontD);
textAlign(CENTER, CENTER); 
text(adv[a]+ver[v]+suj[s],width/2,height/100*86,135,height);
}





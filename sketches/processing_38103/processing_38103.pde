
import com.twitter.processing.*;

//Tried library twit4j because i found a useful example that used that library over tweet stream. there was a problem loading that library so it won't let me upload it. Still working on tweaking this one.... help!

// this stores how many tweets we've gotten
int tweets = 0;
// and this stores the text of the last tweet
String tweetText = "";

//an attempt to filter the results to ND football (this is how it was done in the twit4j
//String searchTerms[] = {
  //"ND OR Notre+Dame OR Irish OR TJ+Jones OR DaVaris+Daniels OR Theo+Riddick OR Robby+Toma OR Zack+Martin OR Nick+Martin OR Chris+Watt OR Braxton+Cave OR Taylor+Devor OR Tyler+Eifert OR Mike+Ragone OR Mike+Floyd OR John+Goodman OR Tommy+Rees OR Rees OR Dayne+Crist OR Crist OR Cierre+Wood OR Jonas+Gray OR David+Ruffer OR Ben+Turk OR Deion+Walker OR Kendall+Moore OR Ethan+Johnson OR Kapron+Lewis-Moore OR Kap OR Darius+Flemming OR Steve+Filer OR Ishaq+Williams OR Carlo+Calabrese OR Dan+Fox OR Mantai+Te'o OR Prince+Shembo OR Robert+Blanton OR Lo+Wood OR Harrison+Smith OR Dan+McCarthy OR Jamoris+Slaughter OR Zeke+Motta OR Gary+Gray OR Bennett Jackson OR Coach+Kelly OR Brian+Kelly",
  
//};

void setup() {
  size(800,100);
  // set up fonts
  PFont font = loadFont("CharcoalCY-24.vlw");
  textFont(font, 24);
  // set up twitter stream object
  TweetStream s = new TweetStream(this, "stream.twitter.com", 80, "1/statuses/sample.json","S2_DSGN", "s5m1s89"); // < would a word filter go here? like the above String?
  s.go();
}

void draw() {
  background(0);
  fill(255);
  // draw a box as many pixels wide as the number of tweets we've seen
  rect(20, 20, tweets, 20);
  // and draw the text of the last tweet
  text(tweetText, 10, 70);
}

// called by twitter stream whenever a new tweet comes in
void tweet(Status tweet) {
  // print a message to the console just for giggles if you like
  // println("got tweet " + tweet.id());

  // store the latest tweet text
  tweetText = tweet.text();
  // bump our tweet count by one
  tweets += 1;
}


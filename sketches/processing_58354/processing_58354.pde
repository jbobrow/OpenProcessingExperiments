
/* Twitter url stuff */
/*String search_url = "http://search.twitter.com/search.atom";*/
/*String search_parameter = "?q=";*/
/*String since_id_parameter = "&since_id=";*/

/*long love_since_id = 0;*/
/*long hate_since_id = 0;*/
/*Timer timer;*/

float excited_count = 1;
float happy_count = 1;
float bored_count = 1;
float sad_count = 1;
float stressed_count = 1;
float anxious_count = 1;



String newest_excited_tweet = "";
String newest_happy_tweet = "";
String newest_bored_tweet = "";
String newest_sad_tweet = "";
String newest_stressed_tweet = "";
String newest_anxious_tweet = "";

boolean mouseClick=false;



RetrieveData rd;

void setup(){
	size(1000, 1000);
	smooth();
	background(255,255,255,100);
	
	PFont myFont = createFont("HelveticaRoundedLT-Bold", 32);
	textAlign(CENTER);
	
  	textFont(myFont);
	
	
	rd = new RetrieveData(2000, 2000);
	rd.start();
	
	getData();
	/*visualize();*/
	
  	/*timer.start();*/
}



void getData() {
	if (rd.available()){
		excited_count = rd.getExcitedCount();
		happy_count = rd.getHappyCount();
bored_count = rd.getBoredCount();
		sad_count = rd.getSadCount();
stressed_count = rd.getStressedCount();
		anxious_count = rd.getAnxiousCount();
	}
}



void draw() {
        getData();
        
float totalTweet_count=excited_count+ happy_count+bored_count+sad_count+anxious_count+stressed_count;

float excited_percent=(excited_count/totalTweet_count) * 1000;
float happy_percent=(happy_count/totalTweet_count) * 1000;
float bored_percent=(bored_count/totalTweet_count) * 1000;
float sad_percent=(sad_count/totalTweet_count) * 1000;
float stressed_percent=(stressed_count/totalTweet_count) * 1000;
float anxious_percent=(anxious_count/totalTweet_count) * 1000;
  
	background(255, 255, 255, 100);

 noStroke();	
fill(255,127,36,255);
	ellipse((width * 0.75), (height * 0.35), happy_percent,happy_percent);
//println("happy_percent "+happy_percent);
//println("total tweet "+ totalTweet_count);
//println("happy_count "+happy_count);

	 noStroke();
	fill(255,255,0,150);
	ellipse((width * 0.5), (height * 0.2), excited_percent, excited_percent);

	

	

        noStroke();
	fill(0,238,0,150);
        ellipse((width * 0.75), (height * 0.65), bored_percent, bored_percent);

 noStroke();
	fill(2, 203, 247, 150);
	ellipse((width * 0.5), (height * 0.8), sad_percent, sad_percent);

 noStroke();
	fill(138,43,226,200);
	ellipse((width * 0.25), (height * 0.65), stressed_percent, stressed_percent);

 noStroke();
	fill(203, 8, 8, 200);
	ellipse((width * 0.25), (height * 0.35), anxious_percent, anxious_percent);

	/*Draw Labels*/
		
	fill(0, 200);
	textSize(32);
	text("EXCITED", width * 0.5, height * 0.2 + 10);
	text("HAPPY", width * 0.75, height * 0.35 + 10);
text("BORED", width * 0.75, height * 0.65 + 10);
	text("SAD", width * 0.5, height * 0.8 + 10);
text("STRESSED", width * 0.25, height * 0.65 + 10);
	text("ANXIOUS", width * 0.25, height * 0.35 + 10);

        textSize(10);
	text(newest_excited_tweet, width * 0.5 - 150, height * 0.2 + 40, 300, 300);
	text(newest_happy_tweet, width * 0.75 - 150, height * 0.35 + 40, 300, 300);
text(newest_bored_tweet, width * 0.75 - 150, height * 0.65 + 40, 300, 300);
	text(newest_sad_tweet, width * 0.5 - 150, height * 0.8 + 40, 300, 300);
text(newest_stressed_tweet, width * 0.25 - 150, height * 0.65 + 40, 300, 300);
	text(newest_anxious_tweet, width * 0.25 - 150, height * 0.35 + 40, 300, 300);

 if(mouseClick==true){
   
   fill(0, 200);	
   textSize(20);
   
   
	
		text(int(excited_count) + " tweets", width * 0.5, height * 0.2 + 35);
	
		text(int(happy_count) + " tweets", width * 0.75, height * 0.35 + 35);

		text(int(bored_count) + " tweets", width * 0.75, height * 0.65 + 35);
	
		text(int(sad_count) + " tweets", width * 0.5, height * 0.8 + 35);
	
		
		text(int(stressed_count) + " tweets", width * 0.25, height * 0.65 + 35);
	
		text(int(anxious_count) + " tweets", width * 0.25, height * 0.35 + 35);
 }
 
if (key == 'c'){
 mouseClick=false ;
}
if (key == 't'){
 mouseClick=true ;
}
}


void mousePressed() {
  //println("oh hi");
  
    newest_excited_tweet = rd.getLatestExcitedTweet();
    newest_happy_tweet = rd.getLatestHappyTweet();
     newest_bored_tweet = rd.getLatestBoredTweet();
    newest_sad_tweet = rd.getLatestSadTweet();
     newest_stressed_tweet = rd.getLatestStressedTweet();
    newest_anxious_tweet = rd.getLatestAnxiousTweet();
   // println("just got " + newest_hate_tweet + " & " + newest_love_tweet);
   
   //mouseClick=true;
   
	
}

//void mouseReleased() {
  //mouseClick=false;
//}


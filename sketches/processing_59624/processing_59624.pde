
XMLElement[] tweets;

int [] hourhisto = new int[24];

void setup(){
  size(1200,500);
  XMLElement data = new XMLElement(this,"twdocs_com 2.xml");
  tweets = data.getChildren();
  println(tweets.length);
noLoop();

//font = createFont("Helvetica",12);

smooth();




}


void draw(){
  background(255);
  
  PFont font;
fill(0);
text("Twitter Data visualisation", 15, 50);
text("Presenting the number of Arabic characters in each tweet",350,280);
text("English Characters", 45, 364);
text("Arabic Characters", 45, 394);
rect(15, 350, 20, 20);
fill(255);
stroke(0);
rect(15, 380, 20, 20);




  
  
  translate(10,90);
  
  
  for (int i=0; i<tweets.length; i++){
    
//    if (tweets[i].getChild(4).getContent() == null) stroke(255,160,0);
//    
//    else stroke(255);
    String tweet_text = tweets[i].getChild("text").getContent();
    int numArabic = 0;
    String[] matches = match(tweet_text,"[أب-ت-ث-ج-ح-خ-د-ذ-ر-ز-س-ش-ص-ض-ط-ظ-ع-غ-ف-ق-ك-ل-م-ن-هـ-و-ي]");
    String[] engmatches = match(tweet_text,"[a-zA-Z]");
    int numEnglish = 0;
    if (engmatches != null) numEnglish = engmatches.length;  // numEnglish = engmatches.length;
    

    if ( matches != null ) numArabic = matches.length; // num arabic chars is the length of the match array
       // println( tweet_text + "--" + numEnglish + " -- " + engmatches[0]);
    

             
// if (mouseX > numArabic*numEnglish && mouseX < numArabic(numArabic+1)*numEnglish)
// && mouseY >numArabic&& mouseY < numArabic){
//     showTweet(i);
// 
//  if (mousePressed) showtweet_text = tweets;    
//        fill(255, 255, 200);
//       stroke(0)
// }

    
    int arabic_count = 0;
    int english_count = 0;
    
    for (int j=0; j<tweet_text.length(); j++){
      char c = tweet_text.charAt(j);
      int b = (int) c;
      if (b > 1000) arabic_count++;
      else english_count++;
      
      
    }
    
    
    
    fill(arabic_count * 2);
    
    rect(i*3, 0, 3, 120);
    




  
  }
  
  




}




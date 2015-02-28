
/* @pjs font="Raleway-Light.ttf"; */
//Java uses single quotes for char comparisons
//In javaScriptMode, use double quotes instead

//Layout
int leftMargin;
int rightMargin;
int vMargin;
PFont title;
PFont body;

//Data
String singleText;           //Single text string with the whole text
HashMap hm = new HashMap();  //Hashmap: character, colorIndex

void setup(){
  size(800, 600);
  colorMode(HSB);
  
  //Layout
  leftMargin = 80;
  rightMargin = 160;
  vMargin = 50;
  //body = loadFont("Raleway-Medium-13.vlw");
  title = createFont("Raleway-Light", 42);
  body = createFont("Raleway-Light", 13);  
  
  //Data
  //Loading original Text. One array element for each paragraph
  String[] originalText = originalText = loadStrings("invisibleCities_citiesAndSigns1_tamara.txt");
  
  //Converting it to a single string
  singleText = "";
  for(int i = 0; i < originalText.length; i++){
    singleText += originalText[i];
    
    //Add paragraph after each element but the last
    if(i < originalText.length - 1){
      singleText += "\n";
    }
  }
  
  letterCount();
  createColors();
  
  noStroke();
  textAlign(LEFT, TOP);
}

void letterCount(){
  for (int i = 0; i < singleText.length(); i++) {
    
    String tempLetter = str(singleText.charAt(i));
    
    if(hm.containsKey(tempLetter)){
      int count = hm.get(tempLetter);
      hm.put(tempLetter, count + 1);
//      println(count);
    }else{
      hm.put(tempLetter, 1);
    }
  }
}

void createColors(){
  colors = new int[hm.size()][2];
  
  //Storing the color values
  int i = 0;
  for (Map.Entry me : hm.entrySet()) {
    int tempColor = int(map(i, 0, hm.size(), 255, 1));
    me.setValue(tempColor);
//    println(me.getKey() + " is " + me.getValue());
    i++;
  }
}

//Pressing keys switches hashmap values from negative to positive
//Sign switch display/not
void keyPressed(){
  String tempString = str(key); 
  if(hm.containsKey(tempString)){
    hm.put(tempString, -hm.get(tempString));
    println(hm.get(tempString));
  }
}

void draw(){
  background(255);
  
  float x = leftMargin;
  int y = vMargin;
  float leading = 18;
  Boolean lineBreak = false;

  fill(100);
  textFont(title);
  String city = "T A M A R A";
  text(city, x, y - 20);
  
  y += 42;
  
  textFont(body);
  
  for(int i = 0; i < singleText.length(); i++){
    char letter = singleText.charAt(i);
    
    //Paragraph!
    if(letter == "\n"){
    //if(letter == '\n'){
      x = leftMargin;
      y += leading;    
    }
    
    //If line length is greater than right margin, sets lineBreak to true...
    if(x > (width - rightMargin)){
      lineBreak = true;
      
      //...and waits for an empty character to break
      if(letter == " " && lineBreak == true){
      //if(letter == ' ' && lineBreak == true){  
        x = leftMargin;
        y += leading;
        lineBreak = false;
        continue; //jumps to next iteration and don't draw the empty space!
      }
    }

    //If hashmap value is > 0, display color block
    if(hm.get(letter) > 0){
      
      //White spaces remain white
      if(letter == " "){                
        fill(hm.get(letter), 0, 255);
      
      //Periods are black
      }else if(letter == "." || letter == "?" || letter == "!"){
        fill(hm.get(letter), 0, 0);    
    
      //Punctuation is gray    
      }else if(letter == ":" || letter == ";" || letter == ","){
        fill(hm.get(letter), 0, 150);      
      }else{
        fill(hm.get(letter), 255, 255);
      }
      
      rect(x, y, textWidth(letter), 16);    
    
    //...if not, display letter
    }else{
      fill(0);
      text(letter, x, y);    
    }
    x += textWidth(letter);
  }
}



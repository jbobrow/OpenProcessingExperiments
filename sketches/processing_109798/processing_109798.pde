
/* @pjs font="Raleway-Light.ttf" */

TextArea myTextArea;
PFont title;
PFont body;
ArrayList responsesList;    //Each response row: text, yes/no, tags[]
HashMap hmTotalTags;        //Tag, total number of ocurrences
int positive;               //Total positive responses
ArrayList barGraph;         //Bar graph
String searchAnswer;        //Search for yes/no
String query;               //Current query being displayed

void setup(){
  size(800, 600);
  
  title = createFont("Raleway-Light", 42);
  body = createFont("Raleway-Light", 13);  
  
  responsesList = new ArrayList();
  hmTotalTags = new HashMap();
  positive = 0;
  barGraph = new ArrayList();
  query = "all";
  
  String[] responsesString = loadStrings("saoPaulo_taggedResponses.txt");
  String[] myText = new String[responsesString.length];
  
  for(int i = 0; i < responsesString.length; i++){
    String[] columns = split(responsesString[i], '\t');
    responsesList.add(new Response(columns[0], columns[1], columns[2]));
    myText[i] = columns[0];
    if(columns[1].equals("Sim")){
      positive ++;
    }
  }

  myTextArea = new TextArea(myText, 510, 60, 240, height - 90);  //String[], x, y, width, height

  countTags();
  
  createGraph();  
}

//Read tags in the responses and stores in a HashMap (tag, total count)
void countTags(){
  for(int i = 0; i < responsesList.size(); i++){
    
    Response tempResponse = (Response) responsesList.get(i);
    for(int j = 0; j < tempResponse.responseTags.length; j++){
      String tempTag = tempResponse.responseTags[j];
//      println(j + " : " + tempTag);

      if(hmTotalTags.containsKey(tempTag)){
        int count = hmTotalTags.get(tempTag);
        hmTotalTags.put(tempTag, count + 1);
      }else{
        hmTotalTags.put(tempTag, 1);
      }
    }
  }
//  readTags(hmTotalTags);
}

//void readTags(HashMap hm){
//  for (Map.Entry me : hm.entrySet()) {
//    println(me.getKey() + " is " + me.getValue());
//  }
//}

void createGraph(){
    //Graph
    int barX = 140;
    int barY = 390;
    int barWidth;

    for (Map.Entry me : hmTotalTags.entrySet()) {      
      barGraph.add(new Bar(me.getKey(), me.getValue(), barX, barY, 300)); //Label, value, x, y, total width
      barY += 30;
    }
}

void reloadText(String label){
  String[] newSearch = new String[0];
  if(!query.equals(label)){
  query = searchAnswer;
    for(int i = 0; i < responsesList.size(); i++){
      Response tempResponse = (Response) responsesList.get(i);
        if(tempResponse.answer2.equals(label)){
          newSearch = append(newSearch, tempResponse.answer1);
        }  
    }
  }else{
    query = "all";
    for(int i = 0; i < responsesList.size(); i++){
      Response tempResponse = (Response) responsesList.get(i);
      newSearch = append(newSearch, tempResponse.answer1);  
    }    
  }
  myTextArea.createArea(newSearch);
  myTextArea.textY = 0;
  myTextArea.scrollbarY = myTextArea.areaY;  
}

void mousePressed(){
  //Check for text scroll
  myTextArea.check();
  
  //Check for donut query
  if(!searchAnswer.equals("")){
    reloadText(searchAnswer);
  }
  
  //Check for barGraph
  for(int i = 0; i < barGraph.size(); i++){
    Bar tempBar = (Bar) barGraph.get(i);
    tempBar.select();
  }  
}

void mouseDragged(){
  myTextArea.drag();
}

void mouseReleased(){
  myTextArea.check();  
}

void draw(){
  background(255);
  cursor(ARROW);
  
  //title
  textFont(title);
  textAlign(CENTER, TOP);
  text("Z O B E I D E", 50, 20, 410, 80);
  
  //Donut
  noFill();
  strokeCap(SQUARE);
  strokeWeight(20);  
    
    //Yes
    float arcLength = map(positive, 0, responsesList.size(), -PI, PI);
    if(query.equals("Sim")){
      strokeWeight(30);
      stroke(240);
      arc(255, 220, 200, 200, -PI, arcLength);      
    }
    strokeWeight(20);    
    stroke(0, 230, 150);
    arc(255, 220, 200, 200, -PI, arcLength);
    
    //No
    if(query.equals("Não")){
      strokeWeight(30);
      stroke(240);
      arc(255, 220, 200, 200, arcLength, PI);
    }
    strokeWeight(20);      
    stroke(210);    
    arc(255, 220, 200, 200, arcLength, PI);
    //ellipse(255, 220, 200, 200);    
    
    //Text
    textFont(body);
    textAlign(CENTER, TOP);
    text("People who achieved their goal after moving to São Paulo", 185, 220 - 40, 140, 200);
    
    textFont(title);
    textAlign(CENTER, TOP);
    text(int(100*positive/responsesList.size()) + "%", 255, 220 + 5);
   
    //Interaction
    if(dist(255, 220, mouseX, mouseY) < 110){
      cursor(HAND);
      float mouseAngle = atan2(mouseY - 220, mouseX - 255);
//      println("mouseAngle: " + mouseAngle + ", arcLength: " + arcLength);
      if(-PI < mouseAngle && mouseAngle < arcLength){
        searchAnswer = "Sim";
      }else{
        searchAnswer = "Não";
      }
    }else{
      searchAnswer = "";
    }  
 
  //Bar graph
    //Title
    fill(100);
    textFont(body);
    textAlign(CENTER, TOP);
    text("MAIN GOALS WHEN MOVING TO SÃO PAULO", 50, 360, 410, 50);
    
    //Line
    stroke(100);
    strokeWeight(1);  
    line(50, 380, 460, 380);
  
  //Responses
    //Title
    fill(100);
    textFont(body);
    textAlign(LEFT, TOP);
    text("RESPONSES" + " #" + query, myTextArea.areaX, 30, myTextArea.areaWidth + 40, 50);
    
    //Line
    stroke(100);
    strokeWeight(1);  
    line(myTextArea.areaX, 50, myTextArea.areaX + myTextArea.areaWidth + 20, 50);
  
    //Bar graph
    for(int i = 0; i < barGraph.size(); i++){
      Bar tempBar = (Bar) barGraph.get(i);
      tempBar.display();
      if(tempBar.isOver){
        cursor(HAND);
      }
    }  
  
    myTextArea.display();
}
class Bar{
  String label;
  int value;
  int barX;
  int barY;
  int barWidth;
  int totalWidth;
  Boolean isOver;
  
  Bar(String tempLabel, int tempValue, int tempX, int tempY, int tempTotalWidth){
    label = tempLabel;
    value = tempValue;
    barX = tempX;
    barY = tempY;
    totalWidth = tempTotalWidth;
    barWidth = int(map(value, 0, 49, 0, totalWidth));
    isOver = false;
  }
  
  void hover(){
    if(barX - 100 < mouseX && mouseX < barX + totalWidth
       && barY < mouseY && mouseY < barY + 20){
       isOver = true;  
    }else{
       isOver = false;
    }
  }
  
  void select(){
    if(isOver){

      String[] newSearch = new String[0];
      
      //If this bar wasn't selected before      
      if(!query.equals(label)){      
        query = label;      
        for(int i = 0; i < responsesList.size(); i++){
        Response tempResponse = (Response) responsesList.get(i);
          for(int j = 0; j < tempResponse.responseTags.length; j++){
            if(tempResponse.responseTags[j].equals(label)){
              newSearch = append(newSearch, tempResponse.answer1);
            }  
          }
        }
      
      //If this bar was selected, "deselect"and show all texts          
      }else{
        query = "all";
        for(int i = 0; i < responsesList.size(); i++){
        Response tempResponse = (Response) responsesList.get(i);
          newSearch = append(newSearch, tempResponse.answer1);  
        }      
      }

      myTextArea.createArea(newSearch);
      myTextArea.textY = 0;
      myTextArea.scrollbarY = myTextArea.areaY;  
    }
  }
  
  void display(){
    
      hover();
      if(isOver || query.equals(label)){
        noStroke();
        fill(240);
        rect(barX - 90, barY - 5, totalWidth + 110, 30);   
      }
      noStroke();
      fill(100);
      //Tag
      textAlign(RIGHT, CENTER);
      text(label, barX - 110, barY - 18, 100, 50);
      //Bar
      rect(barX, barY, barWidth, 20);
      //Number
      textAlign(LEFT, CENTER);
      text(value, barX + barWidth + 5, barY + 10);  
  }
}
class Response{
  String answer1;
  String answer2;
  String[] responseTags;
  
  Response(String tempAnswer1, String tempAnswer2, String tempTags){
    answer1 = tempAnswer1;
    answer2 = tempAnswer2;
    //tags
    responseTags = trim(split(tempTags, ','));
  }
}
class TextArea {
  
  PGraphics textRect;  //Mask. The text is drawn inside of it
  String inlineText;   //Stores the whole text in a single String, with line breaks
  
  //These vars don't vary
  int areaX;           //Mask X
  int areaY;           //Mask y
  int areaWidth;       //Mask width
  int areaHeight;      //Mask height
  
  //These vars vary!
  float textY;         //Actual text area y
  float textHeight;    //Actual text area height. Needs to be calculated counting the rows
  float scrollbarY;    //Scrollbar changing coordinate;
  Boolean isDragging;  //Checks if the scrollbar is being dragged
  Boolean hasScroll;   //Checks if the text height is greater then the area, i.e., if it needs a scrollbar

  TextArea(String[] tempText, int tempAreaX, int tempAreaY, int tempAreaWidth, int tempAreaHeight) {
    
//    println(inlineText);
    areaX = tempAreaX;
    areaY = tempAreaY;
    areaWidth = tempAreaWidth;
    areaHeight = tempAreaHeight;
    
    textY = 0;
    scrollbarY = areaY;
    isDragging = false;
    hasScroll = false;
    
    textRect = createGraphics(areaWidth, areaHeight);    
    
    createArea(tempText);
  }
  
  //Calculates text height
  void createArea(String[] tempText){
    
    inlineText = "";
    for(int i = 0; i < tempText.length; i++){
      inlineText += tempText[i] + "\n\n";
    }    

//    fill(0);
    float lineX = areaX;
    float lineY = areaY;
    int lineCount = 0;
    int leading = 20;
    textFont(body);
//    textAlign(LEFT, TOP);  
//    textLeading(leading);

    for (int i = 0; i < tempText.length; i++) {
      String[] splitedText = split(tempText[i], " ");
      for (int j = 0; j < splitedText.length; j++) {
        String tempWord = splitedText[j];
        if (lineX + textWidth(tempWord) > areaX + areaWidth) {
          lineX = areaX;
          lineY += leading;
          lineCount ++;
        }      
//        text(tempText, lineX, lineY);
        lineX += textWidth(splitedText[j] + " ");
      }
      lineX = areaX;
      lineY += leading;
      lineCount += 2;
    }
    textHeight = lineCount * leading;
    if(textHeight > areaHeight){
      hasScroll = true;
    }else{
      hasScroll = false;
    }
  }  

  void check(){
    if(scrollbarY < mouseY && mouseY < scrollbarY + 20
    && areaX + areaWidth < mouseX && mouseX < areaX + areaWidth + 20
    && hasScroll){
      isDragging = true;
//      println(isDragging);
    }else{
      isDragging = false;
    }
  }
  
  void drag(){
    if(isDragging){
      scrollbarY = constrain(mouseY, areaY, areaY + areaHeight - 20);
      textY = map(scrollbarY, areaY, areaY + areaHeight - 20, 0, areaHeight - textHeight);
//      textY = constrain(textY, areaHeight - textHeight, 0);    
    }  
  }
  
  void scrollbar(){
    
    fill(240);
    noStroke();
    rect(areaX + areaWidth, areaY, 20, areaHeight);
    
    fill(100);
    rect(areaX + areaWidth, scrollbarY, 20, 20);
    
  }

  void display() {

    if(hasScroll){
      scrollbar();
    }
    
    textRect.beginDraw();
    textRect.background(255);
    textRect.fill(100);
    textRect.textFont(body);
    textRect.textAlign(LEFT, TOP);  
    textRect.textLeading(20);    
    textRect.text(inlineText, 0, textY, areaWidth, textHeight);
    textRect.endDraw();    
    
    image(textRect, areaX, areaY);
    

  }
}




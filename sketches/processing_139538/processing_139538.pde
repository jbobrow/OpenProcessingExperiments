
/*----- DATA -----*/
ArrayList<Event> eventsList;
HashMap myTypes;    //HashMap; type, hue
HashMap myBoroughs; //HashMap; borough, hue

/*----- VISUALS -----*/
PVector center;
float diameter;
float arcLength;
PFont title;
PFont body;

/*----- INTERACTION -----*/
String mode;
//Easing  
float value = 0;
float targetValue = 0;
float speed = 0.4;

void setup() {
  //  size(1366, 768);
  size(800, 800);
  colorMode(HSB);

  /*----- DATA -----*/
  eventsList = new ArrayList<Event>();
  myTypes = new HashMap();
  myBoroughs = new HashMap();  

  String filename = "nyc_street_activities_calendar_edited.tsv";  
  String[] rawData = loadStrings(filename);
  //  println(rawData);
  processData(rawData);

  /*----- VISUALS -----*/
  center = new PVector(width/2, height/2);
  diameter = height*0.45;
  arcLength = TWO_PI / eventsList.size();
  createHues();
//  println(PFont.list());
  title = createFont("sans-serif", 52);
  body = createFont("sans-serif", 12);
  textFont(body);

  /*----- INTERACTION -----*/
  mode = "type";
  //  mode = "borough";
  sortBy(mode);

  //  debug();
}

void draw() {
  background(255);
  
  //Easing
  value += (targetValue - value) * speed;  
//  println(value);
  if(value < 0.01){
    targetValue = 1;
    changeMode();
  }
  
  float angle = lerp(0, arcLength, value);
  
  float prevAngle = 0;
  String category = "";
  String prevCategory = "";

  pushMatrix();
  translate(center.x, center.y);
  
  for (int i = 0; i < eventsList.size(); i++) {
    eventsList.get(i).display(i);

    category = (mode == "type") ? (eventsList.get(i).type) : (eventsList.get(i).borough);

    //Drawing the totals
    if (!category.equals(prevCategory)
      && prevCategory != ""
      || i == eventsList.size() - 1) {
      //        println(category);
      //        println(prevCategory);
      int hue = (mode == "type") ? (myTypes.get(prevCategory)) : (myBoroughs.get(prevCategory));
      noFill();
      stroke(hue, 255, 255);
      strokeWeight(diameter/4);
      strokeCap(SQUARE);
      arc(0, 0, diameter*0.75, diameter*0.75, -prevAngle, 0);
      prevAngle = 0;
    }

    prevCategory = category;
    prevAngle += angle;

    rotate(angle);
  }
  //    stroke(0);
  //    strokeWeight(2);
  //    ellipse(0, 0, diameter, diameter);
  popMatrix();
  //  noLoop();
  
  drawGUI();  
}

void keyPressed() {
  if (key == ' ') {
    //Easing
    targetValue = (targetValue == 1) ? (0):(1);
  }   
}

void changeMode(){
    mode = (mode == "type") ? ("borough"):("type");
//    println(mode);
    sortBy(mode);
}

void processData(String[] rawData) {
  for (int i = 1; i < rawData.length - 1; i++) {
    String[] thisRow = split(rawData[i], "\t");
    //    println(thisRow);
    String name = thisRow[0];
    String type = thisRow[1];
    String borough = thisRow[3];
    eventsList.add(new Event(name, type, borough));

    //Adding the type to our list of types
    if (!myTypes.containsKey(type)) {      
      myTypes.put(type, 0);
    }
    //Adding the boroughs
    if (!myBoroughs.containsKey(borough)) {
      myBoroughs.put(borough, 0);      
      //      println("line: " + i + ", borough: " + borough);
    }
  }
}

void createHues() {

  int i = 0;
  for (Map.Entry me : myTypes.entrySet()) {
    int hue = int(map(i, 0, myTypes.size(), 0, 255));
    me.setValue(hue);
    i ++;
  }  

  i = 0;
  for (Map.Entry me : myBoroughs.entrySet()) {
    int hue = int(map(i, 0, myBoroughs.size(), 0, 200));
    me.setValue(hue);
    i ++;
  }
}

void debug() {
  for (int i = 0; i < eventsList.size(); i++) {
    Event thisEvent = eventsList.get(i);
    println(thisEvent.name + "\t" + thisEvent.type + "\t" + thisEvent.borough);
  }

  println(myTypes);
  println(myBoroughs);
}

void drawGUI() {
  int leading = 16;
  noStroke();
  textAlign(LEFT, BASELINE);

  int x = 10;
  int y = 56;

  fill(0);
  textFont(title);
  text("NYC STREET ACTIVITIES", x, y);

  y += leading;  
  
  stroke(0);
  strokeWeight(5);
  line(x, y, width - x, y);  
  
  y += leading*2;

  fill(0);
  textFont(body);
  text("EVENT " + mode.toUpperCase(), x, y);

  y += leading/2;

  stroke(0);
  strokeWeight(2);
  line(x, y, x*15, y);
  
  y += leading*1.5;

  noStroke();
  if (mode == "type") {
    for (Map.Entry me : myTypes.entrySet()) {

      fill(0);
      String type = me.getKey().toString();
      text(type, 3*x, y);

      int hue = myTypes.get(type);
      fill(hue, 255, 255);
      rect(x, y, 10, -10);

      y += leading;
    }
  }
  else {
    for (Map.Entry me : myBoroughs.entrySet()) {

      fill(0);
      String borough = me.getKey().toString();
      text(borough, 3*x, y);

      int hue = myBoroughs.get(borough);
      fill(hue, 255, 255);
      rect(x, y, 10, -10);

      y += leading;
    }
  }

  stroke(0);
  strokeWeight(2);
  line(x, y, x*15, y);  
  
  y += leading*1.5;
  
  fill(0);
  String otherMode = (mode == "type") ? ("borough") : ("type");
  textLeading(leading*0.75);
  text("Press SPACE \n to sort by event " + otherMode.toUpperCase(), x, y);
  
  y = height - leading;
  textSize(8);
  text("Source: NYC Open Data (https://data.cityofnewyork.us/Recreation/NYC-Street-Activities-Calendar/xenu-5qjw)", x, y);  
}

void sortBy(String comparator) {
  //Creating an empty array that will store the values
  //we want to compare
  String[] values = new Array[0];
  for (int i = 0; i < eventsList.size(); i++) {
    values = expand(values, values.length + 1);
    
    //We'l compare based on...?
    if (comparator == "type") {
      values[values.length - 1] = eventsList.get(i).type;
    }
    else if (comparator == "borough") {
      values[values.length - 1] = eventsList.get(i).borough;
    }
  }
  //Sorting those values
  values.sort();

  //This temporary ArrayList will store the objects sorted
  ArrayList<Event> tempList = new ArrayList<Event>();

  //Looping through each sorted value
  for (int i = 0; i < values.length; i++) {
    //Looping through each object
    for (int j = 0; j < eventsList.size(); j++) {
      //We'l compare based on...?
      String objectValue = "";
      if (comparator == "type") {
        objectValue = eventsList.get(j).type;
      }
      else if (comparator == "borough") {
        objectValue = eventsList.get(j).borough;
      }

      //If the sorted value is found...
      if (values[i].equals(objectValue)) {
        //Add the object to the temporary list and jump to the next iteration
        tempList.add(eventsList.get(j));
        eventsList.remove(eventsList.get(j));
        break;
      }
    }
  }
  //Replace the original list with the sorted one
  eventsList = tempList;
  //  println(values);
}

class Event{
  String name;
  String type;
//  String date;
  String borough;
  
  Event(String _name, String _type, String _borough){
    name = _name;
    type = _type;
    borough = _borough;
  }
  
  void display(int i){
    int hue;
    if(mode == "type"){
      hue = myTypes.get(type);
    }else{
      hue = myBoroughs.get(borough);
    } 
    
    
    stroke(0, 20);
    strokeWeight(0.5);
    fill(hue, 255, 255);

    float x = map(i % 20, 0, 3, diameter*0.55, diameter*0.6);    
    line(diameter*0.25, 0, x, 0);
    noStroke();
    ellipse(x, 0, 2, 2);
   
//    noFill();
//    stroke(hue, 255, 255);
//    strokeCap(SQUARE);
//    strokeWeight(40);
//    fill(hue, 255, 255);
//    arc(0, 0, diameter, diameter, 0, arcLength);
  }

}



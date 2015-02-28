
import geomerative.*;
import org.json.*;


//Text(User input)
// Variable to store text currently being typed
String typing = "";
// Variable to store saved text when return is hit
String saved = "Hello";
String defaultS = "Hello";
String temp, temp2;

//Image
PImage bg, colorbg, sm, sad;
int[] facePosition;

color [] orangeC = {
  -65536, -131072, -196608, -262144, -327680, -393216, -458752, -524288, -589824, -655360, -720896, -786432, -851968, -917504, -983040
};
color [] blueC = {
  -16776961, -16776962, -16776963, -16776964, -16776965, -16776966, -16776967, -16776968, -16776969, -16776970, -16776971, -16776972, -16776973, -16776974, -16776975, -16776976, -16776977, -16776978
};

color [] greyC = {
  -16711936, -16712192, -16712448, -16712704, -16712960, -16713216, -16713472, -16713728, -16713984, -16714240, -16714496, -16714752, -16715008, -16715264, -16715520
};


int[][] OrangefaceCoord = {
  {
    118, 402
  }
  , {
    181, 398
  }
  , {
    248, 392
  }
  , {
    124, 477
  }
  , {
    187, 474
  }
  , {
    242, 474
  }
  , {
    118, 549
  }
  , {
    181, 549
  }
  , {
    239, 553
  }
  , {
    120, 624
  }
  , {
    178, 622
  }
  , {
    233, 625
  }
  , {
    126, 693
  }
  , {
    174, 688
  }
  , {
    229, 687
  }
};

int [][] BluefaceCoord = {
  {
    438, 300
  }
  , {
    505, 297
  }
  , {
    586, 300
  }
  , {
    446, 398
  }
  , {
    507, 397
  }
  , {
    578, 397
  }
  , {
    451, 487
  }
  , {
    512, 489
  }
  , {
    574, 491
  }
  , {
    466, 561
  }
  , {
    525, 560
  }
  , {
    573, 562
  }
  , {
    473, 637
  }
  , {
    528, 636
  }
  , {
    578, 633
  }
  , {
    474, 694
  }
  , {
    530, 693
  }
  , {
    578, 696
  }
};


int [][] GreyfaceCoord = {
  {
    722, 465
  }
  , {
    780, 462
  }
  , {
    829, 459
  }
  , {
    722, 529
  }
  , {
    775, 529
  }
  , {
    824, 527
  }
  , {
    725, 588
  }
  , {
    774, 587
  }
  , {
    819, 584
  }
  , {
    725, 639
  }
  , 
  {
    774, 639
  }
  , {
    815, 642
  }
  , {
    721, 691
  }
  , {
    772, 689
  }
  , {
    815, 690
  }
};


//---JSON
String url ="http://search.twitter.com/search.json?q=";
String POquery = saved + ":)";
String NEquery = saved + ":(";
String[] texts, texts2, textCenter1, textCenter2;
int ypos = 20;
int Arraylength = 12;
String show = "";
String NEhtml, POhtml;


//-----------------------setup()
void setup() {
  size(1000, 800);
  smooth();

  imageMode(CORNERS);

  if (getTime() >= 18) {
    //night
    bg = loadImage("./image/nightBG.jpg");
  }
  else {
    //day
    bg = loadImage("./image/dayBG.png");
  }     

  colorbg = loadImage("./image/testColor.png");
  sm = loadImage("./image/smileCloud.png");
  sad = loadImage("./image/sadCloud.png");


  //Setup for searching
  String NEhtml = join(loadStrings(url+NEquery+":)"+"&rpp=25"), "");
  texts =  parseTwitter(NEhtml);

  String POhtml = join(loadStrings(url+POquery+":("+"&rpp=25"), "");
  texts2 = parseTwitter(POhtml);
}

//-----------------------setup()




//-----------------------parseTwitter()
String[] parseTwitter(String in) {
  String[] returnText = new String[Arraylength];
  try {

    JSONObject jdata = new JSONObject(in);
    JSONArray results = jdata.getJSONArray("results");
    returnText = new String[results.length()];
    for (int i = 0; i < results.length(); i++)
    {
      JSONObject tweet = results.getJSONObject(i);
      returnText[i] = tweet.getString("text");
      println(i+") "+returnText[i]);
    }
  }
  catch (JSONException e) {
    e.printStackTrace();
  }
  return returnText;
}
//-----------------------parseTwitter()




//-----------------------draw()
void draw() {

  background(255);
  stroke(0);
  noFill();
  smooth();
  image(bg, 0, 0, 1000, 800);


  //User Input Part
  if (getTime() >= 18) {
    //night
    fill(0);
    int indent = 820;
    text("Click here and type what you want to serach. \nHit return to send. ", indent, 70, 150, 500);
    text(typing, indent+20, 130, 100, 500);
    //display what user had inputed
    text("You are searching [" + saved + "].", 800, 750, 150, 500);
  }
  else {
    //day
    fill(0);
    int indent = 800;
    text("Click here and type what you want to serach. \nHit return to send. ", indent, 250, 150, 500);
    text(typing, indent+20, 300, 100, 500);
    //display what user had inputed
    text("You are searching [" + saved + "].", 800, 750, 150, 500);
  }   



  color now = colorbg.get(mouseX, mouseY);
  //Testing Mouse Hoverd Color
  // fill(now);
  // rect(20, 20, 20, 20);

  for (int i = 0; i < orangeC.length; i++) {
    if (now == orangeC[i]) {
      getImageText(i, "orange");
    }
    else if (now == greyC[i]) {
      getImageText(i, "grey");
    }
  }


  for (int j = 0; j < blueC.length; j++) {
    if (now == blueC[j]) {
      getImageText(j, "blue");
    }
  }
}
//-----------------------draw()



//-----------------------getTime()
int getTime() {

  Calendar rightNow = Calendar.getInstance();
  int hour = rightNow.get(Calendar.HOUR_OF_DAY);

  return hour;
}
//-----------------------getTime()




//-----------------------getImage()
void getImageText(int index, String building) {

  imageMode(CENTER);

  if (building.equals("orange")) {
    facePosition = OrangefaceCoord[index];
    image(sm, facePosition[0], facePosition[1]);
    fill(#FF0000);
    text(texts[index], facePosition[0] + 30, facePosition[1] -190, 130, 100);
  }
  else if (building.equals("blue")) {

    facePosition = BluefaceCoord[index];
    if (index >= 10) {
      fill(#FF0000);
      image(sm, facePosition[0], facePosition[1]);
      text(texts[index + 4], facePosition[0] + 30, facePosition[1] -190, 130, 100);
    }
    else if (index < 10) {
      fill(#0066ff);
      image(sad, facePosition[0], facePosition[1]);
      text(texts2[index + 14], facePosition[0] + 30, facePosition[1] -190, 130, 100);
    }
    else {
    }
  }
  else {
    facePosition = GreyfaceCoord[index];
    image(sad, facePosition[0], facePosition[1]);
    fill(#0066ff);
    text(texts2[index], facePosition[0] + 30, facePosition[1] -190, 130, 100);
  }

  imageMode(CORNER);
}
//-----------------------getImage()



//-----------------------KeyPressed()
void keyPressed() {

  //If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
    temp =  saved.replaceAll("[@$=+]", "-");
    temp2 = temp.replaceAll(" ", "-");

    POquery = temp2 + ":)";
    NEquery = temp2 + ":(";
    NEhtml = join(loadStrings(url+NEquery+":("+"&rpp=25"), "");
    texts =  parseTwitter(NEhtml);
    POhtml = join(loadStrings(url+POquery+":)"+"&rpp=25"), "");
    texts2 = parseTwitter(POhtml);
    //A String can be cleared by setting it equal to ""
    typing = "";
  } 
  else {
    if (key == CODED) {
      if (keyCode == UP || keyCode == SHIFT || keyCode == DOWN ||keyCode == TAB||keyCode==BACKSPACE||keyCode==DELETE) {
        typing += '@';
      }
    }
    else {
      typing += key;
    }
  }
}
//-----------------------KeyPressed()



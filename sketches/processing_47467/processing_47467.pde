
class Feed {
  // Instance Variables 
  String url;
  XMLElement rss;
  XMLElement[] titlesXML;
  XMLElement[] descXML;
  XMLElement[] thumbsXML;
  int titleCounter;
  int descCounter;

  /**
   Standard Constructor
   
   @params None
   */
  Feed() {
  }

  /**
   Secondary Constructor
   
   @params String variable to be used as URL of XML feed
   */
  Feed(String tempURL) {
    rss = new XMLElement (getApplet(), tempURL);
    titlesXML = rss.getChildren("channel/item/title");
    descXML = rss.getChildren("channel/item/description");
    thumbsXML = rss.getChildren("channel/item/media:thumbnail");
    titleCounter = 0;
    descCounter = 0;
    stripThumbs();


    // testing area
    getWeather();
  }

  /**
   Returns the title of each of the xml titles to be used outside the class
   
   @params  None
   @returns String type with title of current xml node
   */
  String getNextTitle() {
    String temp = titlesXML[titleCounter].getContent();
    titleCounter++;
    return temp;
  }

  /**
   Returns the Description content of the next of the xml elements to be used outside the class
   
   @params  None
   @returns String type with title of current xml node
   */
  String getNextDescription() {
    String temp = descXML[descCounter].getContent();
    descCounter++;
    return temp;
  }

  /**
   returns the string for the URL of thumbnail to be read.
   
   @params  None
   @returns String type for url
   */
  String getThumbnail() {
    return thumbsXML[0].getStringAttribute("url");
  }

  /**
   starting at the first  element removes this and then every second element
   this leaves the larger images that can be displayed in the program.
   
   @params  None
   @returns None
   */
  private void stripThumbs () {
    XMLElement [] temp = new XMLElement [thumbsXML.length/2];
    int counter = 0;

    for (int i=0; i < thumbsXML.length; i++) {
      if (i%2 == 1) {
        temp[counter] = thumbsXML[i];
        counter++;
      }
    } 
    thumbsXML = temp;
  }

  String [] getWeather() {
    // creates temporary string array and new XMLelement array due to yahoo feed being different
    String [] tempArray = new String [11]; 
    XMLElement[] temp = rss.getChildren("channel/item/yweather:condition");
    
    //extrract data and place in array to be returned
    if (temp.length > 0) {
      tempArray[0] = temp[0].getStringAttribute("text");
      tempArray[1] = temp[0].getStringAttribute("temp");
      tempArray[2] = temp[0].getStringAttribute("date");
    }
    
    // change the XMLElement array to look for different data
    temp = rss.getChildren("channel/item/yweather:forecast");
    
    if (temp.length > 0) {
      tempArray[3] = temp[0].getStringAttribute("day");
      tempArray[4] = temp[0].getStringAttribute("text");
      tempArray[5] = temp[0].getStringAttribute("low");
      tempArray[6] = temp[0].getStringAttribute("high");
    }
    
    if (temp.length > 1) {
      tempArray[7] = temp[1].getStringAttribute("day");
      tempArray[8] = temp[1].getStringAttribute("text");
      tempArray[9] = temp[1].getStringAttribute("low");
      tempArray[10] = temp[1].getStringAttribute("high");
    }
    return tempArray;
  }

  /**
   if you see this i was lazy and did not remove testing methods form the class
   */
  void tester() {
    String temp1;
    String temp2;

    for (int i =0; i < titlesXML.length; i++) {
      temp1 = titlesXML[i].getContent();
      temp2 = descXML[i].getContent();
      println(i + ": " + temp1);
      println(i + ": " + temp2);
    }
  }

  void printArray() {
    for (int i=0; i< descXML.length; i++) {
      println(i + ": " + descXML[i].getContent());
    }
  }
}



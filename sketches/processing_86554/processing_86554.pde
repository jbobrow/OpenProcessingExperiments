
// each event stores info re what it is.. now to do a mouse over to get that label info

// class that keeps track of all the info of a given event
// ie the particle
// each event object keeps track of it's date
// orderDates() finds the hi/low
// e.setTargetLine() finds that Event object instance's order in the range orderDates() sets

// need x,y in relation to point in time

class Event {
  // artist of event from last.fm api
  String artist;
  // title of event from last.fm api
  String title;
  // date String from last.fm :: Fri, 06 May 2011 21:00:00
  String date;
  // name of venue
  String venue;
  // raw zipCode as input from last.fm api
  String zipCodeRaw;
  
  // HASHMAP KEYS ::
  // eventKey (Fri, 06 May 20110) :: Events by DateHash
  String eventKey;
  // zipKey :: Events by zipCode
  String zipKey;
  
  // deal with lat, lon as targetPosition PVector
  // incoming geo:lat/geo:lon String from last.fm
  String lat, lon;
  // string converted into float points
  float latF, lonF;
  // float points converted from lat/lon to x/y space
  float lonX, latY;
  // x,y position of each event
  float x, y;
 
  String inputZip;
  
  // current position of event
  PVector position = new PVector ();
  // target PVector for events (constantly changing)
  PVector target = new PVector(random(width),random(height));
  // home is the timeLine target vector
  PVector home;
  
  // display variables
  color col = 255;
  color permCol = color (255, 150);
  float radius;
  float stackPosition;
  float sidePosition;
  // ???
  float zipPosition;
  
  // TEST
  int count;

  Event (String artist_, String title_, String venue_, String date_, String zipCodeRaw_, String zipKey_, String eventKey_, String lat_, String lon_) {
    artist = artist_;
    title = title_;
    venue = venue_;
    date = date_;
    zipCodeRaw = zipCodeRaw_;
    zipKey = zipKey_;
    eventKey = eventKey_;
    // lat/lon
    lat = lat_;
    lon = lon_;
    // when creating the Event object get the eventKey and it's count
    EventDate ed = dateHash.get (eventKey);
    // stackPosition is based on the count of that individual eventDate
    stackPosition = ed.count;
    radius = 2.5;
    
    // EventZip ez = zipHash.get (zipKey);
    // zipPosition = ez.count;
    
    lonX = 0;
    latY = 0;
    
 }
 
 void findSimilarFleetFoxes () {
   // go through all the Events
   for (Event e: eventEntries) {
     // highlight INPUT BAND
     if (e.artist.equals ("Fleet Foxes")) {
       e.permCol = color (255, 255, 0);
     }
     
     // compare all the Event's artist to the inputArtist's similarArtists ArrayList    
     for (int i = 0; i < similarArtistsFleetFoxes.size(); i++) {
       String similarTest = similarArtistsFleetFoxes.get(i);
       
       if (e.artist.equals(similarTest)) {
         e.permCol = color(255, 20, 147);
         //changeColor();
         // println (e.artist);
         // if there is a match
         // highlight those Events with matches
       } 
     }
   }
 }
 
 void findSimilarRihana () {
   // go through all the Events
   for (Event e: eventEntries) {
     // highlight INPUT BAND
     if (e.artist.equals ("Rihana")) {
       e.permCol = color (255, 255, 0);
     }
     
     // compare all the Event's artist to the inputArtist's similarArtists ArrayList    
     for (int i = 0; i < similarArtistsRihana.size(); i++) {
       String similarTest = similarArtistsRihana.get(i);
       
       if (e.artist.equals(similarTest)) {
         e.permCol = color(255, 20, 147);
         //changeColor();
         // println (e.artist);
         // if there is a match
         // highlight those Events with matches
       } 
     }
   }
 }
 
// HOW TO GET COLOR DISTINCTION?
// HOW TO GET SPACING ON THE Y-AXIS?
  void findZip (String inputZip_) {
    
    inputZip = inputZip_;
    for (Event e: eventsByZip) {
      // String inputZip = "11211";
      String zipTest = e.zipKey;
      
      // RUNS THRU EVERY EVENT
      // COMPARES ALL EVENTS BY THEIR .ZIPKEY TO THE INPUTZIP
      // println (inputZip + " =?= " + zipTest);
      
      if (inputZip.equals(zipTest)) {
        EventDate ed = dateHash.get (eventKey);
          
          // HOW TO COLOR DISTINCTION?
          // col = color (0, 255, 0);
          // fill (col);
          constrain (target.x, 10, width-10);
          target.x = 10 + (ed.index)*10;
          
          EventZip ez = zipHash.get (inputZip);
          zipPosition = ez.count + 60;

          // ONLY GET ZIPPOSITION --> FOR THAT EVENT
          e.target.y = height/2 - (zipPosition);
          // println (zipPosition);
      }
    }   
  }
  
  void dnaMode () {
    EventDate ed = dateHash.get (eventKey);                   
    constrain (target.x, 10, width-10);
    target.x = 10 + (ed.index)*10;
  }
  
  void setLineTarget() {

       // stackPosition pulled for each individual eventDate  
       float y = height*0.85 - (stackPosition)*10;
       
       // get all the EventDates ed for a particular time/date (the eventKey)
       // groups of dates (so on the x)
       EventDate ed = dateHash.get (eventKey);
       // x position (horizontal) is the EventDate ed by eventKey (so the group of dates at that point)
       float tempX = map (ed.dayOfYear, minDate, maxDate, width/2, 10);
       sidePosition = ed.index;
       
       // println ("index: " + sidePosition);
       // println ("tempX: " + tempX);
       // println ("day of year: " + ed.dayOfYear);
       // println ("eventKey: " + eventKey);
       
       float x = tempX + (sidePosition)*10;
       // println (tempX);
       // sets PVector home to timeLine from orderDates()
       home = new PVector(x,y);
  }
  
    
  // sends event to home PVector
  // home is currently set to the output from setLineTarget()
  void goHome() {
    target = home.get();
  }
   
  
  // HOW TO MAKE THIS INTO A COIL???
  // plot event dates as on a clock face
  void circle () {
    // radius is float value based on the stackPosition (y space converted to radius)
    float r = 100 + (stackPosition * 10);
    // println(sidePosition + ":" + eventDates.size());
    EventDate ed = dateHash.get (eventKey);
    
    float tempX = map (ed.dayOfYear, minDate, maxDate, PI*2, 0);
    
    // target PVector is now polar coordinates along a clock face
    // x = sine (theta)
    // y = cosine (theta)
    
    float theta = tempX;
    float circleX = width/4 + (r * sin (theta));
    float circleY = height/2 + (r * cos (theta));
    
    target = new PVector(circleX, circleY);    
  }

  // sets target PVector to a random point
  void scatter() {
    target =  new PVector(random(width),random(height));
  }
  
  // set target PVector based on lat/lon
  void plotMap () {
    
    // KEY SPOTS ::    
    
    // SOUTH WEST
    // Governors Island ::40.691376, -74.01575
    // south = 40
    // west = -74
    // LAT/Y = 40.6886367, LON/X -74.0218089
    
    // NORTH EAST
    // Marble Hill, Queens :: 37.305885, -73.913197
    // north = 40
    // east = -73
    // LAT/Y = 40.87615, LON/X = -73.913197
    
    // THESE ARE ALL CORRECT ::
      
    // FINDING GOVERNORS ISLAND (MOST SOUTH WEST)
    // target = new PVector (width-325, height-125);
     
    // FINDING MARBLE HILL (MOST NORTH EAST)
    //target = new PVector (width-50, 60);
      
    for (Event e:eventEntries) {
      // Event e;
      e.lonF = Float.parseFloat(e.lon);
      e.latF = Float.parseFloat(e.lat);
   
      // LONGITUDE = WIDTH  = X = WEST/EAST
      // LATITUDE = HEIGHT = Y = NORTH/SOUTH
      
      e.lonX = map (e.lonF, -74.0218089, -73.913197, float (width-325), float (width-50));
      e.latY = map (e.latF, 40.87615, 40.6886367, float (60),  float(height-125));
      // println (latF + ": " + latY + ", " + lonF + ": " + lonX + ", " + e.title);    
      
      target = new PVector (lonX, latY);
     }
  }

  // update() sends the Event to the target vector
  // target vector changes according to keyPressed
  void update () {
    // position.x = target.x;
    // position.y = target.y;

    // move towards target position
    position.x += (target.x - position.x) * 0.1;
    position.y += (target.y - position.y) * 0.1;
  }
  
  void display () {
    noStroke ();
    fill (col);
    smooth ();
    ellipseMode (RADIUS);
    //radius = 2.5;
    
    // EVENTS
    ellipse (position.x, position.y, radius, radius);
   

    // WRITE DATE LABELS AT BEGINNING OF EVENT INDEX
    // write out dates below?
    // NOTE WORKING
    //      pushMatrix ();
    //      // String dateLabel = ed.date;  
    //      String dateLabel = "label";      
    //      fill (0, 255, 0);
    //      translate (x, y);
    //      rotate (-HALF_PI);
    //      textAlign(CENTER);
    //      text(dateLabel, position.x, position.y);
    //      popMatrix ();
  }
}




// data structure for storing integer objects 
ArrayList countryNumber = new ArrayList();
ArrayList<SocialStatus> socialStatuses = new ArrayList<SocialStatus>();
 



void setup() {
  
 readCoordinates();

 readValues(); 
 PFont f;
 f = loadFont("Raleway-Thin-20.vlw");
 textFont(f);
 // graphics setup, screen should be 700 by 200 pixels
  size(1400, 800);


  // no border around objects
  noStroke();
}

void readCoordinates(){
 
  // every line of the input file is read and stored into the array "lines"
  String [] lines = loadStrings("badteethandsugar.csv");

  // loop through the array "lines"...
  for (String line : lines) {

    // ... and split every line into two parts (latitude and longitude) which are separated by a ";"
    String[] pieces = split(line, ';');

    // get the citation piece as a String
    String citationsStr = pieces[0];
    // get the lookedFor piece as a String
    String lookedForStr = pieces[2];
     // get the spots piece as a String
    String spotsStr = pieces[3];

    // parse these three Strings as int numbers
    int cit = parseInt(citationsStr);
    int loo = parseInt(lookedForStr);
    int spo = parseInt(spotsStr);
   
    

    // create a new SocialStatus object
    SocialStatus newSocialStatus = new SocialStatus(spo, cit, loo);

    // add newSocialStatus to the list of socialStatuses
    socialStatuses.add(newSocialStatus);

    // print the coordinates of the current location
    println("Social status found at " + spo + " - " + cit + " - " + loo);
  }

  // finally print the number of found and stored locations
  println("Social statuses found: " + socialStatuses.size());
}

void readValues(){
 
 String [] lines = loadStrings("badteethandsugar.csv");
 
 // loop through the array "lines"...
  for (String line : lines) {

    // ... and split every line into two parts (latitude and longitude) which are separated by a ";"
    String[] pieces = split(line, ';');
    
   
      
      // first column (= first piece) --> Date
      String paperIdString = pieces[0];
      
      // parse dateStr (of type String) as Date in teh given format (see above)
      int PaperId = 0;
      
      PaperId = parseInt(paperIdString);
      
      // add the Date object to the list of all days
      countryNumber.add(PaperId);
      
      // print a message that for the given day, data is available
      println("Values found for paperID: " + countryNumber);
      
  }
    // finally count the number of days and output it
  println("Measurement data found for " + countryNumber.size() + " papers.");
}

void draw(){
  background(0,0,0);
  fill(255,255,255, 50);
  rect(0, 800 -(800-mouseY), 1400, 2);
  PFont f; 
    
 
  
  
   for (int i = 0; i < socialStatuses.size(); i++) {
     
    SocialStatus l = socialStatuses.get(i);
    
   int xPosition = l.spots;
   int yPosition = l.citations;
   int zPosition = l.lookedFor;
   fill(255,255,255);
   
   text("Amount of bad teeth among 12-year-olds in countries of alphabetic order, compared to sugar consumption in these countries",50,100);
   println(xPosition + " " + yPosition + " " + zPosition);
   fill(255,0,0,70);
   rect(yPosition*50-0.00005*mouseY*xPosition*(1+0.00001*mouseY*xPosition) , 800, 2*(1+0.00001*mouseY*xPosition), -100*zPosition);
   fill(0,255,255,70);
   rect(yPosition*50+0.00005*mouseY*xPosition, 800, 2*(1+0.00001*mouseY*xPosition), -100*zPosition);
   fill(0,255,255,150);
  text("Afghanistan", 50, 500);
   fill(0,255,255,150);
  text("Zimbabwe", 1200, 500);
  fill(255,0,0,150);
  text("Afghanistan", 55, 500);
   fill(255,0,0,150);
  text("Zimbabwe", 1205, 500);
  
  

  
  
}
}


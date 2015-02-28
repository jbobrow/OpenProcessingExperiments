
class Circle {
  int x, y;
  //Cordinates of center of circle
  int diameter;
  //Circle`s diameter
  float maxDiameter;
  //Circle`s maximum diameter
  boolean overlap;
  //If circle overlap the other circles, it is true
  int id;
  //Obeject`s array number
  Circle[] others;
  //Other Circle objects on same page
  
  Circle (int inid, Circle[] inothers) {
    id = inid;
    //Get obect`s array number
    others = inothers;
    //Get other Circle objects on same page
  }

  void placement() {
    diameter = int(random(minDiameter, maxDiameter));
    //Generate circle`s diameter randomly
    x = int(random(width - 1));
    //Locate circle`s x position randomly
    y = int(random(height - 1));
    //Locate circle`s y position randomly
  }
  //Method for placement
  
  void checkOverlap() {
    for(int t = id - 1; t > -1; t--) {
      //Compair with other objects
      //for example object which has array number 4, compair with 0 to 3,
      //object which has array number 20, compair with 0 to 19,
      int distanceX = others[t].x - x;
      int distanceY = others[t].y - y;
      float distance = sqrt((distanceX * distanceX) + (distanceY * distanceY));
      //Distance between object`s center and other objects`s center
      
      int minDistance;
      //Minimum distance,
      //there are 3 types of minimum distance below
      
      //minDistance = abs(others[t].diameter/2 + diameter/2);
      //For circumscription
      
      if(others[t].diameter >= diameter) {
        minDistance = others[t].diameter/2;
      }
      else {
        minDistance = diameter/2;
      }
      //Meet, but never over the small one`s radius
      
      //minDistance = abs(others[t].diameter/2 - diameter/2);
      //For inscription
      
      if(distance < minDistance) {
        overlap = true;
        break;
        //If circle overlap any of other circles variable overlap turn to true
        //and stop checking 
      }
      else {
        overlap = false;
        //If circle never overlap any of other circles overlap turn to false
      }
    }
  }
  //Method for checking overlap
  
  void composition(float inmaxDiameter) {
    maxDiameter = inmaxDiameter;
    //Get current page`s maximum diameter
    do {
     placement();
     checkOverlap();
     //place and check
    }
    while(overlap == true);
    //This could be endless loop
  }
  //Method to composite by rules
  
  void display() {
    noStroke();
    smooth();
    fill(0);
    //Ordinary condition, those functions above need execute just once,
    //but for PDF Exporting, it have to be execute in Class  
    ellipse(x, y, diameter, diameter);
    //Display Circle
  }
  //Method to display
  
}


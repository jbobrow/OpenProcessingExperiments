
// [hashtag1, hashtag2, distance/similarity, [list of most common words]] 
class Hub {
  int d=20; // diameter of hub
  float hubX;   // myHub.hubX
  float hubY;
  int id; // hub's index
  String name;
  float[] sim; // list of  [1, 5, 8, 6]
  String[] words; // list of common words  
  Point[] points; // number of points
  float mindist;
  float maxdist;
  float dx=0;
  float dy=0; 
  
  Hub(float x, float y, int temp_id, String temp_name, float[] temp_sim, String[] temp_words) { 
    hubX = x;
    hubY = y;
    name = temp_name;
    id = temp_id;
    points = new Point[temp_words.length];
    words = temp_words;
    makePoints(); // points = list of points
    sim = temp_sim;
    //d = 5*name.length();
    mindist = 2*d; // size of hub
  }

  // add point to p array
  void makePoints() {
    //int nPoints = 40;
    int range = 100;
    int p = 5; // diameter of points
    for (int i=0; i < words.length; i++) {
      float distX = random(-range,range);
      float distY = random(-range,range); 
      float pointX = distX+hubX;
      float pointY = distY+hubY;
      //ellipse(pointX, pointY, p, p);
      points[i] = new Point(pointX, pointY, this.hubX, this.hubY, words[i]);
    }
  }

  void display(boolean displayPoints) {
    fill(255, 255, 255, 130);  // HUB (r,g,b, transparency)
    noStroke();  
    ellipse(hubX, hubY, d, d);
    //noize
    hubX += int(random(-2,2));
    hubY += int(random(-2,2));
    
    if (displayPoints==true){
    // iterate to draw points
    for (int i=0; i < words.length; i++) {
      this.points[i].display();
    }  
    for (int i=0; i < words.length-1; i++) {     // draw lines
      strokeWeight(.5);
      stroke(255,255,259,150);
      line(points[i].pointX, points[i].pointY, points[i+1].pointX, points[i+1].pointY);
      line(points[i].pointX, points[i].pointY, hubX, hubY);
    }
    }
}
  
  // hubs act as particles, move towards higher similarity, move away from low
  void drift(Hub[] hubarray) { // iterate through array and calculate drift
     dx = 0;
     dy = 0;
     float sign_dx, sign_dy;
     
     // read through text file
     for (int i=0; i<nHubs; i++){
       float distance = sqrt(sq(h[i].hubX - hubX) + sq(h[i].hubY - hubY));
     // (similarity - simthresh) * (diffx, diffy) = movement vector
         if (distance > mindist) {
           float dr = (v/distance) * (simthresh - sim[i]);
           float theta = atan((h[i].hubY - hubY)/(h[i].hubX - hubX));
           dx = dr*cos(theta);
           dy = dr*sin(theta);
         }
     }
     
     if (hubX>width-5*d){
       hubX = width-5*d;}
     if (hubX<5*d){
       hubX = 5*d;}
     if (hubY>height-5*d){
       hubY = height-5*d;}
     if (hubY<5*d){
       hubY = 5*d;}     
    }
  
  void interact(){
     hubX = dx+hubX;
     hubY = dy+hubY;
      if ((abs(mouseX-hubX) <= d) && (abs(mouseY-hubY) <= d)){
        // draw box
        fill(0,0,0,215);
        float recHeight = 30;
        float recWidth = 10*name.length();
        float recWHalf = recWidth/2;
        float recHHalf = recHeight/2;        
        rect(hubX-recWHalf,hubY-recHHalf, recWidth, recHeight);
        // hub text
        fill(255,255,255);
        textAlign(CENTER, CENTER);
        text(name, hubX, hubY);
        //test if cursor is over box
  }
  }
  
  void displayPText(){
     for (int j = 0; j < words.length; j++){
        points[j].displayPText();
    }
  }
}
      
    



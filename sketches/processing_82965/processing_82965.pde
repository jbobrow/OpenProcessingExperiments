
ArrayList<PVector> points;

int timer = 0;
 
void setup() {
  size(600, 600);
   
 
 //Punkte
  points = new ArrayList<PVector>();
  
  for (int i = 0; i < 10; i++) {         // Create ten random points //0-9
    PVector p = new PVector(random(0, width), random(0, height));
    points.add(p);
  }
 
}
 
 
void draw() {
  
  timer++;
  
  //endless loop
  if(timer >= 200) {
    timer = 0;
    }
  
  background(30);
 
  noFill();
  stroke(50,50,50);
 
 
//Punkte verbinden
  
  beginShape();
  
  for (int i = 0; i < points.size(); i++) { //0-9
    PVector p = points.get(i);
    curveVertex(p.x, p.y);
  }
  
  for (int i = 0; i < 3; i++) { //close
    PVector p = points.get(i);
    curveVertex(p.x, p.y);
  }
 
  endShape();   
  
  //dist() for speed?
  
  
  
  float progress = map(timer, 0, 200, 0, points.size());

 
  for( int i=0; i < 3 ; i++) {
    
    float progress_more = progress + i;
    
    //colors
    switch(i)
      {
      case 0: 
      fill(100,40,40); 
      break;
      
      case 1:         
      fill(40,100,40);
      break;  


      case 2:         
      fill(40,40,100);
      break;  
      
      default:
      fill(255);
      break;
      }

    
    if (progress_more >= points.size()) {
      progress_more = progress_more - points.size();
    }
      
    calcBall(progress_more);
  }
  
}


void calcBall(float progress) {
  
  int index = floor(progress);     // On which segment are we in the path?
   
  int lastP = index-1;
  int nextP = index+1; 
  
  if(lastP < 0) lastP = points.size()-1;
  if (nextP > points.size()-1) nextP = nextP-index - 1;
  
  int nextnextP = nextP+1;
    
  if (nextnextP > points.size() -1 ){
    nextnextP = nextnextP - points.size();
  }
   
  //get points
  PVector firstP = points.get(lastP);    
  PVector secondP = points.get(index);
  PVector thirdP = points.get(nextP);
  PVector fourthP = points.get(nextnextP);
   
  //calculate points on curve
  float px = curvePoint(firstP.x, secondP.x, thirdP.x, fourthP.x, progress - index);  
  float py = curvePoint(firstP.y, secondP.y, thirdP.y, fourthP.y, progress - index);

  //draw ball   
  noStroke();
  ellipse(px, py, 20, 20);     // Draw the point we were looking for

}



void keyReleased() {
  
 //Press "r" to reset
 if (key == 'r' || key == 'R') {
      points.clear(); 
    for (int i = 0; i < 10; i++) {         // Create ten random points //0-9
      PVector p = new PVector(random(0, width), random(0, height));
      points.add(p);
    }
    }
}



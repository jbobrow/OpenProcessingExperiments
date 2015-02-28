
Fluff[] fluffs;
float blow;
 
void setup() {
  frameRate(15);
  size(800, 800);
  //size
  background(165,150,135);
  fluffs = new Fluff[0];
  //declaring Fluff
  
}

void draw() {
  background(165,150,135);
  blow = map(mouseX, 0, width, -1, 1);
  for (int i=0; i<fluffs.length; i++) {
    fluffs[i].move();
    fluffs[i].display();
    fluffs[i].cx=fluffs[i].cx+blow; //command to create and make movement
  }
}

void mousePressed() {  //when clicked, create new Fluff
  Fluff myFluff = new Fluff(mouseX, mouseY);
  fluffs = (Fluff[]) append(fluffs, myFluff);
 
}

class Fluff {
  
  int howMany;
  int numLegs;
  int cx;
  int cy;
  int speed;
  int legLength;
  int rotated;
  int transparency;
  int []legLengthList;
  int []numLegsList;
  
  Fluff(int centerX, int centerY) {
    
    cx = centerX;
    cy = centerY;
    howMany = int(random(2,4));
    legLength = int(random(5,100));
    rotated = int(random(2,10));
    speed = int(random(2,5));
    transparency = int(random(10,90));
    legLengthList = new int[howMany];
    numLegsList = new int[howMany];
   
    
    
    for(int i=0; i<howMany; i++)
    {
      numLegs = int(random(5,110));
      legLength = int(random(5,10));
      legLengthList[i] = legLength;
      numLegsList[i] = numLegs;
    }
  }
  
  void display() {
    
    ellipseMode(CENTER);
    stroke(255);
    for(int i=0; i<howMany; i++) {
      legLength = legLengthList[i];
      numLegs = numLegsList[i];
    for (int j = 0; j < 50; j++) {
      float legW = cx + cos(radians(5*j+rotated)) * legLength;
      float legX = cy+ sin(radians(10* j+rotated))* legLength;
      
      
       
      fill(255,transparency);
      ellipse(cx, cy, 1, 1);
      //fill(255,transparency);
      //ellipse(cx, cy - 25, 1,1);
  
      stroke(255,transparency);
      line(cx, cy, legW, legX);
      //ellipse(legX, legX, radius, radius);
      
      /*if (legLength < 50) {
     stroke(103,29,15,transparency);
     line(cx,cy,legW,legX);
     
      }*/
    }
    }
  }
  
  
  void move() {
    if (cx < width+50) {
      cx = cx+ speed;
    }
    else{
     cx = -50;
    }
     
    if(cy < -50){
     cy = height +50;
       
    }
     
    else if(cy > height+50){
      cy = -50;
    }
     
    for(int i=0; i<howMany; i++)
    {
    }

  } 
}









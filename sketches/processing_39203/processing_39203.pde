


void setup() {
  size(400, 400);
  background(50,10,69);
}

void draw() {


  sketch(0,random(50,400));                          //sets vertical placement
  
    rectMode(CORNERS);
  noStroke();
   fill(50,10,69,1);
  rect(0,0,400,400);

}






void sketch(float x, float y) {
  pushMatrix(); 
  translate(x, y);

  for (float countA=0; countA<400; countA+=50) {         //sets up columns
    float strokeType = random(10);                         //sets low probability of white line appearance
    if(strokeType < 1) { 

      for (float countB=0; countB<500; countB+=.1) {      //loops white lines

        float swisherA1 = random (4,5.5);                 //varies stroke weight - high             
        strokeWeight(swisherA1);
        stroke(255,200);

        float  swisherB1 = random (-.5,.5);                //caffeination - high
        float  spacing = countB+=1;                       //space between dots

        countA += swisherB1 ;                           
        point(countA, spacing);                         //draws white lines
      }
    }
    else {
      for (float countB=0; countB<500; countB+=.1) {      //loops orange lines

        float swisherA2 = random (1.3,1.5);                //varies stroke weight - low
        strokeWeight(swisherA2);
        stroke(255,200,50,50);

        float  swisherB2 = random (-.2,.2);                //caffeination - low
        float  spacing = countB+=1;                       //space between dots

        countA += swisherB2 ;                              
        point(countA, spacing);
      }
    }
  }
  popMatrix(); 
}



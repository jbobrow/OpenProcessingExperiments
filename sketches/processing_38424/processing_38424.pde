
void setup() {
  size(500, 500);
  smooth();
}
void draw() {
}
void mousePressed() {                                    //mouse reset
  background (0);



  for (float countA=-5; countA<510; countA+=50) {         //sets grid
    float strokeType = random(9);                         //sets low probability of line appearance
    if(strokeType < 1) { 

      for (float countB=0; countB<500; countB+=.1) {      //loops dominant lines

        float swisherA1 = random (2,3.5);                 //varies stroke weight - high             
        strokeWeight(swisherA1);
        stroke(255,200);

        float  swisherB1 = random (-.5,.5);                //caffeination - high
        float  spacing = countB+=1;                       //space between dots

        countA += swisherB1 ;                           
        point(countA, spacing);                         //dominant vertical lines                                                   
        point(spacing, countA);                          //dominant horizontal lines
      }
    }
    else {
      for (float countB=0; countB<500; countB+=.1) {      //loops grid lines

        float swisherA2 = random (1.3,1.5);                //varies stroke weight - low
        strokeWeight(swisherA2);
        stroke(150,100);

        float  swisherB2 = random (-.2,.2);                //caffeination - low
        float  spacing = countB+=1;                       //space between dots

        countA += swisherB2 ;                              
        point(countA, spacing);                            //vertical grid lines
        point(spacing, countA);                            //horizontal grid lines
      }
    }
  }
}



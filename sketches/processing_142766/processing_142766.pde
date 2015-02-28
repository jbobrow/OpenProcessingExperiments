
void setup() {
  size(500, 500);
  smooth();
  background(75,75,75);
}

void draw() 
  {
  
    //Basic Clock Shape alignment
    pushMatrix(); // start clock shape
    translate(height/2, width/2); // move to centre
    stroke(0); // line colour
    strokeWeight(5); // line weight
    fill(255); // fill colour
    ellipse(0, 0, 400, 400); // shape of clock face
  
        //Minute and Hour Marks alignment
        pushMatrix(); // start tick marks context
          for (int i=0; i<60;i++)
          {
            if (i%5==0) largeMark(); //largeMark
            else smallMark(); //smallMark
            rotate(radians(6));
          }
        popMatrix(); // end tick marks context
              
              //Clock functionality
              //Second Index Mark
              pushMatrix(); // start secondIndex
              rotate(radians(6*second()-90));
              secondIndex();
              popMatrix(); 
            
              //Minute Index Mark
              pushMatrix(); // start minuteIndex
              rotate(radians(6*(minute()+second()/60.0)-90));
              minuteIndex();
              popMatrix(); 
            
              //Hour Index Mark
              pushMatrix(); // start hourIndex
              rotate(radians(30*(hour()+minute()/60.0)-90));
              hourIndex();
              popMatrix();
      
        //Center Circle
        fill(255, 0, 0);
        noStroke();
        ellipse(0, 0, 15, 15);
  
    popMatrix(); // end clock shape
  }

//Functions
// Hour and Minute Marks
void smallMark() 
  {
    strokeWeight(2); // mark weight
    line(170, 0, 200, 0); // mark length
  }

void largeMark() 
  {
    strokeWeight(4); // mark weight
    line(150, 0, 200, 0); // mark length
  }

// Time Index Marker
void secondIndex() 
  {
    strokeWeight(1); // index weight
    strokeCap(SQUARE);
    stroke(255, 0, 0);
    line(-20, 0, 175, 0); // index length
  }

void minuteIndex() 
  {
    strokeWeight(3); // index weight
    strokeCap(SQUARE);
    stroke(0, 0, 0);
    line(-20, 0, 150, 0); // index length
  }

void hourIndex() 
  {
    strokeWeight(6); // index weight
    strokeCap(SQUARE);
    stroke(0, 0, 0);  
    line(-20, 0, 125, 0); // index length
  }




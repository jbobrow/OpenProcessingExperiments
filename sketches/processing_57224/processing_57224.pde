

class Robot {
  int bodyHeight;
  int bodyWidth;
  int place;
  int place1;
  int numberOfRings;
  int offset;


  Robot( int temp_bodyHeight, int temp_bodyWidth, int temp_place, int temp_numberOfRings, int temp_offset) {

    bodyHeight = temp_bodyHeight;
    bodyWidth = temp_bodyWidth;
    place = temp_place;
    place1 = temp_place;
    numberOfRings = temp_numberOfRings;
    offset = temp_offset;
  }



  //main body
  void mainBody() {
    fill(0); 
    rect(x-bodyWidth/2+offset, place, bodyWidth, bodyHeight); 
    fill(175, 53, 53); 
    text (name, x-25+offset, place+41, 240, 100);
  }

  //head
  void head() {
    stroke(0); 
    strokeWeight(4); 
    noFill(); 
    ellipse(x-30+offset, (place - 35), 60, 60);
    ellipse(x-40+offset, place, 80, 80);
  }

  //Little circles
  void littleCircles() {
    noStroke();
    fill(175, 53, 53);
    ellipse(x+offset, place, 80, 80);
    fill(200); 
    ellipse(x+offset, place, 60, 60);
    fill(0);
    ellipse(x+offset, place, 15, 15);
  }


  //antenni
  void antenni() {
    stroke(0); 
    strokeWeight(2);
    line(x-40+offset, (place - 2), (x-100+offset), (place - 40));  //bottom
    line(x-40+offset, (place - 2), (x-80+offset), (place - 140));  //middle
    line(x-40+offset, (place - 2), (x-140+offset), (place - 100)); //top
  }

  //small band on body
  void band() {
    noStroke();
    fill(150); 
    rect(x-bodyWidth/2+offset, (place + (bodyHeight - 10)), bodyWidth, 5);
  }

  //lower body
  void lowerBody() {
    place = place + bodyHeight;
    fill(150); 
    noStroke(); 
    arc(x+offset, place, bodyWidth, 60, 0, PI);
    place = place + 37;
  }

  //creates chain base
  void chain(int numberOfRings) {
    stroke(0); 
    strokeWeight(3); 
    fill(250);

    for (int i = 0; i < numberOfRings; i++) {     //creates circles
      ellipse(x+offset, place, 15, 15);
      place = place + 15;
    }
  }

  // Create basev
  void base() {
    fill(0); 
    arc(x+offset, place, 110, 110, 0, PI); //fills arc grey - creates arc
    fill(150); 
    noStroke(); 
    rect(x-65+offset, (place - 6), 130, 10); //fills light grey - no boarder - creates rectangle
  }
  void display() {

    mainBody();
    head();
    littleCircles();
    antenni();
    band();
    lowerBody();
    chain(numberOfRings);
    base();
    place = place1;
  }
}



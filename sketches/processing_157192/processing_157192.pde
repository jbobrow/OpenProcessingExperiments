
void setup() {
  size(500, 500);
  background(10);
}

void draw() {
  background(0);
  int yr = year();    // returns : 2013, 2014 etc.
  int dy = day();     // returns : 0 - 31
  int hr = hour();    // returns : 0 - 23
  int mn = minute();  // returns : 0 - 59
  int sc = second();  // returns : 0 - 59

  translate(250, 250);
  
  textSize(126);
  fill(100);
  text(yr, 0, -10);
  textSize(48);
  fill(255);
  text(dy, 0, -20);

  textAlign(CENTER, CENTER);
  textSize(16);
  text("5", 78, -135);       text("1", 40, -70);   
  text("10", 135, -76);      text("2", 70, -40); 
  text("15", 155, 0);        text("3", 80, 0); 
  text("20", 135, 76);       text("4", 70, 40); 
  text("25", 78, 135);       text("5", 40, 70); 
  text("30", 0, 155);        text("6", 0, 80); 
  text("35", -78, 135);      text("7", -40, 70); 
  text("40", -135, 76);      text("8", -70, 40); 
  text("45", -155, 0);       text("9", -80, 0);   
  text("50", -135, -76);     text("10", -70, -40); 
  text("55", -78, -135);     text("11", -40, -70); 
  text("60", 0, -155);       text("12", 0, -80); 
  
  strokeWeight(8);
  stroke(#FC0F2F);
  pushMatrix();
  rotate(radians(hr * 30));
  line(0, 0, 0, -60);
  popMatrix();

  strokeWeight(5);
  stroke(#FC9205);
  pushMatrix();
  rotate(radians(mn * 6));
  line(0, 0, 0, -100);
  popMatrix();

  strokeWeight(3);
  stroke(#FCB20F);
  pushMatrix();
  rotate(radians(sc * 6));
  line(0, 0, 0, -140);
  popMatrix();
}




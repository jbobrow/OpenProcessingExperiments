
Table data;
String[] weekday = {
  "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
};
int[] day = new int[7];


int rowCount, duration;
int sizeFactor = 5;

int numY = 90;

void setup() { 
  //  println(weekday);
  background(195);
  size (800, 800);
  data = loadTable("201305.csv", "header");
  rowCount = data.getRowCount();
  smooth();
  //Draws Table
  for (int y = 100; y <= height-100; y = y+50) {
    for (int x = 100; x <= width; x = x+100) {
      stroke(255);
      line(x, 100, x, height-100);
      line(100, y, width-100, y);
    }
  }
  //Draws Text
  //Draws Text
  fill(#FFFFFF);
  textAlign(RIGHT);
  text("0", numY, height-95);
  text("10", numY, height-145);
  text("20", numY, height-195);
  text("30", numY, height-245);
  text("40", numY, height-295);
  text("50", numY, height-345);
  text("60", numY, height-395);
  text("70", numY, height-445);
  text("80", numY, height-495);
  text("90", numY, height-545);
  text("100", numY, height-595);
  text("110", numY, height-645);
  text("120", numY, height-695);
  textAlign(CENTER);
  text((weekday[0]), 100, height-75);
  text((weekday[1]), 200, height-75);
  text((weekday[2]), 300, height-75);
  text((weekday[3]), 400, height-75);
  text((weekday[4]), 500, height-75);
  text((weekday[5]), 600, height-75);
  text((weekday[6]), 700, height-75);
  pushMatrix();
  translate(50, height-395);
  rotate(PI*1.5);
  text("MINUTES", 0, 0);
  popMatrix();
  text("WEEKDAY", width/2, height-30);
  textSize(20);
  text("Call Minutes By Day", 400, 50);
}


void draw() {
  //  beginShape();
  //  vertex(101, height-100);
  for (int row = 0; row < rowCount; row ++) {
    String dataWeekday = data.getString(row, "weekday");
    if (dataWeekday.equals(weekday[0]) == true) { 
      //      vertex(101, (height-100) - (day[0]*sizeFactor));
      ellipse(600, (height-100) - (day[5]*sizeFactor), 5, 5);
      line(500, (height-100) - (day[4]*sizeFactor), 600, (height-100) - (day[5]*sizeFactor));
      ellipse(700, (height-100) - (day[6]*sizeFactor), 5, 5);
      line(600, (height-100) - (day[5]*sizeFactor), 700, (height-100) - (day[6]*sizeFactor));
      day[0] = day[0] + data.getInt(row, "duration"); 
      day[4] = 0;
      day[5] = 0;
      day[6] = 0;
    } else if (dataWeekday.equals(weekday[1]) == true) { 
      day[1] = day[1] + data.getInt(row, "duration");
      ellipse(100, (height-100) - (day[0]*sizeFactor), 5, 5);
      //      vertex(200, (height-100) - (day[1]*sizeFactor));
    } else if (dataWeekday.equals(weekday[2]) == true) { 
      line(100, (height-100) - (day[0]*sizeFactor), 200, (height-100) - (day[1]*sizeFactor));     
      ellipse(200, (height-100) - (day[1]*sizeFactor), 5, 5);
      day[2] = day[2] + data.getInt(row, "duration");
      //      vertex(300, (height-100) - (day[2]*sizeFactor));
    } else if (dataWeekday.equals(weekday[3]) == true) { 
      day[3] = day[3] + data.getInt(row, "duration");
      //      vertex(400, (height-100) - (day[3]*sizeFactor));
    } else if (dataWeekday.equals(weekday[4]) == true) { 
      line(200, (height-100) - (day[1]*sizeFactor), 300, (height-100) - (day[2]*sizeFactor));
      ellipse(300, (height-100) - (day[2]*sizeFactor), 5, 5);
      line(300, (height-100) - (day[2]*sizeFactor), 400, (height-100) - (day[3]*sizeFactor));
      ellipse(400, (height-100) - (day[3]*sizeFactor), 5, 5);
      day[4] = day[4] + data.getInt(row, "duration");
      //      vertex(500, (height-100) - (day[4]*sizeFactor));
    } else if (dataWeekday.equals(weekday[5]) == true) { 
      line(400, (height-100) - (day[3]*sizeFactor), 500, (height-100) - (day[4]*sizeFactor));
      ellipse(500, (height-100) - (day[4]*sizeFactor), 5, 5);
      day[5] = day[5] + data.getInt(row, "duration");
      //      vertex(600, (height-100) - (day[5]*sizeFactor));
    } else if (dataWeekday.equals(weekday[6]) == true) { 
      day[6] = day[6] + data.getInt(row, "duration");
      //      vertex(700, (height-100) - (day[6]*sizeFactor));
      day[0] = 0;
      day[1] = 0;
      day[2] = 0;
      day[3] = 0;
    }
  }

  //   vertex(700, height-100);
  //      endShape();
  //   line(100, height - (day[0]*sizeFactor), 200, height - (day[1]*sizeFactor));
  //   line(200, height - (day[1]*sizeFactor), 300, height - (day[2]*sizeFactor));
  //   line(300, height - (day[2]*sizeFactor), 400, height - (day[3]*sizeFactor));
  //   line(400, height - (day[3]*sizeFactor), 500, height - (day[4]*sizeFactor));
  //   line(500, height - (day[4]*sizeFactor), 600, height - (day[5]*sizeFactor));
  //   line(600, height - (day[5]*sizeFactor), 700, height - (day[6]*sizeFactor));

  //  println("Sunday is = " + day[0]);
  //  println("Monday is = " + day[1]);
  //  println("Tueday is = " + day[2]);
  //  println("Wednesday is = " + day[3]);
  //  println("Thursday is = " + day[4]);
  //  println("Friday is = " + day[5]);
  //  println("Saturday is = " + day[6]);


  println("friday is" + day[5]);





  noLoop();
  println("Sunday is = " + day[0]);

  float info = dist(mouseX, mouseY, width, mouseY);
  if ((info < 0) && (info > width)) {
    textAlign(CENTER);
    text("wffffff", mouseX + 20, mouseY-15);
  }
}




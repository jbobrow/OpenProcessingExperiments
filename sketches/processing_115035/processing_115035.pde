
int numFrames = 56;
int frame = 0;
int counter = 04;
PImage[] images = new PImage[numFrames];

int m;
int s;
int h;

//SHUFFLING IMAGES 
void setup() {
  size(2000, 350);
  frameRate(2);

  for (int counter = 1; counter<56; counter=counter+1) {
    images[counter] = loadImage("IMG_45"+ nf(counter, 2) + ".JPG");
  }

  //ARRAY FOR THE TRANSITIONS 
  PImage[] zero = {
    images[1], images[2], images[3], images[4], images[5], images[6]
  };
  PImage[] one = {
    images[7], images[8], images[9], images[10], images[11]
  };
  PImage[] two = {
    images[12], images[13], images[14], images[15], images[16]
  };
  PImage[] three = {
    images[17], images[18], images[19], images[20], images[21]
  };
  PImage[] four = {
    images[22], images[23], images[24], images[25], images[26], images[27]
  };
  PImage[] five = {
    images[28], images[29], images[30], images[31], images[32], images[33]
  };
  PImage[] six = {
    images[34], images[35], images[36], images[37], images[38]
  };
  PImage[] seven = {
    images[39], images[40], images[41], images[42], images[43], images[44]
  };
  PImage[] eight = {
    images[45], images[46], images[47], images[48], images[49]
  };
  PImage[] nine = {
    images[50], images[51], images[52], images[53], images[54], images[55]
  };

  //TIME 
  m = minute();
  h = hour();
  s = second();

  
  //SPLITS HOURS AND MINUTES INTO TWO DIGITS 
  String theminute = nf(minute(), 2);
  String thehour = nf(hour(), 2);
  
//LOAD IMAGE IN THE BEGINNING AS A STILL
  startDigit(thehour.charAt(0), 0);
  startDigit(thehour.charAt(1), 1);
  startDigit(theminute.charAt(0), 2);
  startDigit(theminute.charAt(1), 3);
}

//FUNCTION TO LOAD STILL IMAGES
void startDigit(char c, int digit) {
  switch(c) {
  case '0':
    image(images[1], digit*500, 0, width/4, height);
    break;
  case '1':
    image(images[7], digit*500, 0, width/4, height);
    break;
  case '2':
    image(images[12], digit*500, 0, width/4, height);
    break;
  case '3':
    image(images[17], digit*500, 0, width/4, height);
    break;
  case '4':
    image(images[22], digit*500, 0, width/4, height);
    break;
  case '5':
    image(images[28], digit*500, 0, width/4, height);
    break;
  case '6':
    image(images[34], digit*500, 0, width/4, height);
    break;
  case '7':
    image(images[39], digit*500, 0, width/4, height);
    break;
  case '8':
    image(images[45], digit*500, 0, width/4, height);
    break;
  case '9':
    image(images[50], digit*500, 0, width/4, height);
    break;
  }
}

//FUNCTION TO LOAD IMAGES IN FIRST DIGIT OF HOUR
void changeHour1(String thehour, int s) {
  //FIRST DIGIT OF HOUR 
  switch(thehour.charAt(0)) {
  case '0':
    if ( s < 7)
      image(images[13 + s], 0, 0, width/4, height);
    else  image(images[1], 0, 0, width/4, height);
    break;
  case '1':
    image(images[Math.min(2 + s, 7)], 0, 0, width/4, height);
    break;
  case '2':
    image(images[Math.min(8 + s, 12)], 0, 0, width/4, height);
    break;
  }
}

//FUNCTION TO LOAD IMAGES IN SECOND DIGIT OF HOUR
void changeHour2(String theminute, String thehour, int s) {
  //SECOND DIGIT OF HOUR 
  switch(thehour.charAt(1)) {
  case '0':
    if ( s < 7)
      image(images[51 + s], 500, 0, width/4, height);
    else  image(images[1], 500, 0, width/4, height);
    break;

  case '1':
    image(images[Math.min(2 + s, 7)], 500, 0, width/4, height);
    break;
  case '2':
    image(images[Math.min(8 + s, 12)], 500, 0, width/4, height);
    break;
  case '3':
    image(images[Math.min(13 + s, 17)], 500, 0, width/4, height);
    break;
  case '4':
    image(images[Math.min(18 + s, 22)], 500, 0, width/4, height);
    break;
  case '5':
    image(images[Math.min(23 + s, 28)], 500, 0, width/4, height);
    break;
  case '6':
    image(images[Math.min(29 + s, 34)], 500, 0, width/4, height);
    break;
  case '7':
    image(images[Math.min(35 + s, 39)], 500, 0, width/4, height);
    break;
  case '8':
    image(images[Math.min(40 + s, 45)], 500, 0, width/4, height);
    break;
  case '9':
    image(images[Math.min(46 + s, 50)], 500, 0, width/4, height);
    break;
  }
}

//FUNCTION TO LOAD IMAGES IN FIRST DIGIT OF MINUTE
void changeMinute1(String theminute, int s) {

  //FIRST DIGIT OF MINUTE 
  switch(theminute.charAt(0)) {
  case '0':
    if ( s < 7)
      image(images[29 + s], 1000, 0, width/4, height);
    else  image(images[1], 1000, 0, width/4, height);
    break;

  case '1':
    image(images[Math.min(2 + s, 7)], 1000, 0, width/4, height);
    break;
  case '2':
    image(images[Math.min(8 + s, 12)], 1000, 0, width/4, height);
    break;
  case '3':
    image(images[Math.min(13 + s, 17)], 1000, 0, width/4, height);
    break;
  case '4':
    image(images[Math.min(18 + s, 22)], 1000, 0, width/4, height);
    break;
  case '5':
    image(images[Math.min(23 + s, 28)], 1000, 0, width/4, height);
    break;
  }
}

//FUNCTION TO LOAD IMAGES IN SECOND DIGIT OF MINUTE
void changeMinute2(String theminute, int s) {
  //SECOND DIGIT OF MINUTE 
  switch(theminute.charAt(1)) {
  case '0':
    if ( s < 5)
      image(images[51 + s], 1500, 0, width/4, height);
    else  image(images[1], 1500, 0, width/4, height);
    break;

  case '1':
    image(images[Math.min(2 + s, 7)], 1500, 0, width/4, height);
    break;
  case '2':
    image(images[Math.min(8 + s, 12)], 1500, 0, width/4, height);
    break;
  case '3':
    image(images[Math.min(13 + s, 17)], 1500, 0, width/4, height);
    break;
  case '4':
    image(images[Math.min(18 + s, 22)], 1500, 0, width/4, height);
    break;
  case '5':
    image(images[Math.min(23 + s, 28)], 1500, 0, width/4, height);
    break;
  case '6':
    image(images[Math.min(29 + s, 34)], 1500, 0, width/4, height);
    break;
  case '7':
    image(images[Math.min(35 + s, 39)], 1500, 0, width/4, height);
    break;
  case '8':
    image(images[Math.min(40 + s, 45)], 1500, 0, width/4, height);
    break;
  case '9':
    image(images[Math.min(46 + s, 50)], 1500, 0, width/4, height);
    break;
  }
}

void draw() {

  //ACTUAL TIME  
  if (m != minute()) {
    println(minute());
    m = minute();
  }
  if (h != hour()) {
    println(hour());
    h = hour();
  }
  if (s != second()) {
    s = second();
  }

  //SPLITS HOURS AND MINUTES INTO TWO DIGITS 
  String theminute = nf(minute(), 2);
  println (theminute.charAt(0) + "and" + theminute.charAt(1));

  String thehour = nf(hour(), 2);
  println(thehour.charAt(0) + "and" + thehour.charAt(1)); 

//SPLIT THE DIGITS AND WHEN TO CHANGE
  if (thehour.charAt(1) == '0' && theminute.charAt(1) == '0') {
    changeHour1(thehour, s);
  }

  if (theminute.charAt(0) == '0' && theminute.charAt(1) == '0') {
    changeHour2(theminute, thehour, s);
  }

  if (theminute.charAt(1) == '0') {
    changeMinute1(theminute, s);
  }

  //SECOND DIGIT OF MINUTE 
  changeMinute2(theminute, s);

  frame++;
  if (frame==numFrames-1) {
    frame = 0;
  }
}

//POSITION & SIZE OF IMAGES  
//image(images[frame], 0, 0, width/4, height);
//  image(images[frame], 500, 0, width/4, height);
//  image(images[frame], 1000, 0, width/4, height);
//  image(images[frame], 1500, 0, width/4, height);




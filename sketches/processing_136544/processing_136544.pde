
int myState = 0;
PFont sans;
PImage delorean1;
PImage delorean2;

void setup() {
  size(500, 500);
  sans = createFont("Impact.ttf", 200);
  delorean1 = loadImage("delorean1.png");
  delorean2 = loadImage("delorean2.png");
}

void draw() {
  background(0);
  textAlign(CENTER);
  fill(#FF0000);
  
  switch(myState) {
   
    case 0: 
   image(delorean1, 0, 0);
   break;
   
    case 1:
    image(delorean1, 0, 0);
    textFont(sans, 35);
    text("click to get the Delorean up to speed to travel back to the future!!!", 50, 50, 400, 400);
    break;
    
    case 2:
    color(#FF0000);
    textFont(sans, 250);
    text("01", 50, 50, 400, 400);
    break;
    
    case 3:
    color(#FF0000);
    textFont(sans, 250);
    text("02", 50, 50, 400, 400);
    break;
  
    case 4:
    color(#FF0000);
    textFont(sans, 250);
    text("03", 50, 50, 400, 400);
    break;
    
    case 5:
    color(#FF0000);
    textFont(sans, 250);
    text("04", 50, 50, 400, 400);
    break;
    
    case 6:
    color(#FF0000);
    textFont(sans, 250);
    text("05", 50, 50, 400, 400);
    break;
    
    case 7:
    color(#FF0000);
    textFont(sans, 250);
    text("06", 50, 50, 400, 400);
    break;
    
    case 8:
    color(#FF0000);
    textFont(sans, 250);
    text("07", 50, 50, 400, 400);
    break;
    
    case 9:
    color(#FF0000);
    textFont(sans, 250);
    text("08", 50, 50, 400, 400);
    break;
    
    case 10:
    color(#FF0000);
    textFont(sans, 250);
    text("09", 50, 50, 400, 400);
    break;
    
    case 11:
    color(#FF0000);
    textFont(sans, 250);
    text("10", 50, 50, 400, 400);
    break;
    
    case 12:
    color(#FF0000);
    textFont(sans, 250);
    text("11", 50, 50, 400, 400);
    break;
    
    case 13:
    color(#FF0000);
    textFont(sans, 250);
    text("12", 50, 50, 400, 400);
    break;
    
    case 14:
    color(#FF0000);
    textFont(sans, 250);
    text("13", 50, 50, 400, 400);
    break;
    
    case 15:
    color(#FF0000);
    textFont(sans, 250);
    text("14", 50, 50, 400, 400);
    break;
    
    case 16:
    color(#FF0000);
    textFont(sans, 250);
    text("15", 50, 50, 400, 400);
    break;
    
    case 17:
    color(#FF0000);
    textFont(sans, 250);
    text("16", 50, 50, 400, 400);
    break;
    
    case 18:
    color(#FF0000);
    textFont(sans, 250);
    text("17", 50, 50, 400, 400);
    break;
    
    case 19:
    color(#FF0000);
    textFont(sans, 250);
    text("18", 50, 50, 400, 400);
    break;
    
    case 20:
    color(#FF0000);
    textFont(sans, 250);
    text("19", 50, 50, 400, 400);
    break;
    
    case 21:
    color(#FF0000);
    textFont(sans, 250);
    text("20", 50, 50, 400, 400);
    break;
    
    case 22:
    color(#FF0000);
    textFont(sans, 250);
    text("21", 50, 50, 400, 400);
    break;
    
    case 23:
    color(#FF0000);
    textFont(sans, 250);
    text("22", 50, 50, 400, 400);
    break;
    
    case 24:
    color(#FF0000);
    textFont(sans, 250);
    text("23", 50, 50, 400, 400);
    break;
    
    case 25:
    color(#FF0000);
    textFont(sans, 250);
    text("24", 50, 50, 400, 400);
    break;
    
    case 26:
    color(#FF0000);
    textFont(sans, 250);
    text("25", 50, 50, 400, 400);
    break;
    
    case 27:
    color(#FF0000);
    textFont(sans, 250);
    text("26", 50, 50, 400, 400);
    break;
    
    case 28:
    color(#FF0000);
    textFont(sans, 250);
    text("27", 50, 50, 400, 400);
    break;
    
    case 29:
    color(#FF0000);
    textFont(sans, 250);
    text("28", 50, 50, 400, 400);
    break;
    
    case 30:
    color(#FF0000);
    textFont(sans, 250);
    text("29", 50, 50, 400, 400);
    break;
    
    case 31:
    color(#FF0000);
    textFont(sans, 250);
    text("30", 50, 50, 400, 400);
    break;
   
    case 32:
    color(#FF0000);
    textFont(sans, 250);
    text("31", 50, 50, 400, 400);
    break;
    
    case 33:
    color(#FF0000);
    textFont(sans, 250);
    text("32", 50, 50, 400, 400);
    break;
    
    case 34:
    color(#FF0000);
    textFont(sans, 250);
    text("33", 50, 50, 400, 400);
    break;
    
    case 35:
    color(#FF0000);
    textFont(sans, 250);
    text("34", 50, 50, 400, 400);
    break;
    
    case 36:
    color(#FF0000);
    textFont(sans, 250);
    text("35", 50, 50, 400, 400);
    break;
    
    case 37:
    color(#FF0000);
    textFont(sans, 250);
    text("36", 50, 50, 400, 400);
    break;
    
    case 38:
    color(#FF0000);
    textFont(sans, 250);
    text("37", 50, 50, 400, 400);
    break;
    
    case 39:
    color(#FF0000);
    textFont(sans, 250);
    text("38", 50, 50, 400, 400);
    break;
    
    case 40:
    color(#FF0000);
    textFont(sans, 250);
    text("39", 50, 50, 400, 400);
    break;
    
    case 41:
    color(#FF0000);
    textFont(sans, 250);
    text("40", 50, 50, 400, 400);
    break;
    
    case 42:
    color(#FF0000);
    textFont(sans, 250);
    text("41", 50, 50, 400, 400);
    break;
  
    case 43:
    color(#FF0000);
    textFont(sans, 250);
    text("42", 50, 50, 400, 400);
    break;
    
    case 44:
    color(#FF0000);
    textFont(sans, 250);
    text("43", 50, 50, 400, 400);
    break;
    
    case 45:
    color(#FF0000);
    textFont(sans, 250);
    text("44", 50, 50, 400, 400);
    break;
    
    case 46:
    color(#FF0000);
    textFont(sans, 250);
    text("45", 50, 50, 400, 400);
    break;
    
    case 47:
    color(#FF0000);
    textFont(sans, 250);
    text("46", 50, 50, 400, 400);
    break;
    
    case 48:
    color(#FF0000);
    textFont(sans, 250);
    text("47", 50, 50, 400, 400);
    break;
    
    case 49:
    color(#FF0000);
    textFont(sans, 250);
    text("48", 50, 50, 400, 400);
    break;
    
    case 50:
    color(#FF0000);
    textFont(sans, 250);
    text("49", 50, 50, 400, 400);
    break;
    
    case 51:
    color(#FF0000);
    textFont(sans, 250);
    text("50", 50, 50, 400, 400);
    break;
    
    case 52:
    color(#FF0000);
    textFont(sans, 250);
    text("51", 50, 50, 400, 400);
    break;
    
    case 53:
    color(#FF0000);
    textFont(sans, 250);
    text("52", 50, 50, 400, 400);
    break;
    
    case 54:
    color(#FF0000);
    textFont(sans, 250);
    text("53", 50, 50, 400, 400);
    break;
    
    case 55:
    color(#FF0000);
    textFont(sans, 250);
    text("54", 50, 50, 400, 400);
    break;
    
    case 56:
    color(#FF0000);
    textFont(sans, 250);
    text("55", 50, 50, 400, 400);
    break;
    
    case 57:
    color(#FF0000);
    textFont(sans, 250);
    text("56", 50, 50, 400, 400);
    break;
    
    case 58:
    color(#FF0000);
    textFont(sans, 250);
    text("57", 50, 50, 400, 400);
    break;
    
    case 59:
    color(#FF0000);
    textFont(sans, 250);
    text("58", 50, 50, 400, 400);
    break;
    
    case 60:
    color(#FF0000);
    textFont(sans, 250);
    text("59", 50, 50, 400, 400);
    break;
    
    case 61:
    color(#FF0000);
    textFont(sans, 250);
    text("60", 50, 50, 400, 400);
    break;
    
    case 62:
    color(#FF0000);
    textFont(sans, 250);
    text("61", 50, 50, 400, 400);
    break;
    
    case 63:
    color(#FF0000);
    textFont(sans, 250);
    text("62", 50, 50, 400, 400);
    break;
    
    case 64:
    color(#FF0000);
    textFont(sans, 250);
    text("63", 50, 50, 400, 400);
    break;
    
    case 65:
    color(#FF0000);
    textFont(sans, 250);
    text("64", 50, 50, 400, 400);
    break;
    
    case 66:
    color(#FF0000);
    textFont(sans, 250);
    text("65", 50, 50, 400, 400);
    break;
    
    case 67:
    color(#FF0000);
    textFont(sans, 250);
    text("66", 50, 50, 400, 400);
    break;
    
    case 68:
    color(#FF0000);
    textFont(sans, 250);
    text("67", 50, 50, 400, 400);
    break;
    
    case 69:
    color(#FF0000);
    textFont(sans, 250);
    text("68", 50, 50, 400, 400);
    break;
    
    case 70:
    color(#FF0000);
    textFont(sans, 250);
    text("69", 50, 50, 400, 400);
    break;
    
    case 71:
    color(#FF0000);
    textFont(sans, 250);
    text("70", 50, 50, 400, 400);
    break;
    
    case 72:
    color(#FF0000);
    textFont(sans, 250);
    text("71", 50, 50, 400, 400);
    break;
    
    case 73:
    color(#FF0000);
    textFont(sans, 250);
    text("72", 50, 50, 400, 400);
    break;
    
    case 74:
    color(#FF0000);
    textFont(sans, 250);
    text("73", 50, 50, 400, 400);
    break;
    
    case 75:
    color(#FF0000);
    textFont(sans, 250);
    text("74", 50, 50, 400, 400);
    break;
    
    case 76:
    color(#FF0000);
    textFont(sans, 250);
    text("75", 50, 50, 400, 400);
    break;
    
    case 77:
    color(#FF0000);
    textFont(sans, 250);
    text("76", 50, 50, 400, 400);
    break;
    
    case 78:
    color(#FF0000);
    textFont(sans, 250);
    text("77", 50, 50, 400, 400);
    break;
    
    case 79:
    color(#FF0000);
    textFont(sans, 250);
    text("78", 50, 50, 400, 400);
    break;
    
    case 80:
    color(#FF0000);
    textFont(sans, 250);
    text("79", 50, 50, 400, 400);
    break;
    
    case 81:
    color(#FF0000);
    textFont(sans, 250);
    text("80", 50, 50, 400, 400);
    break;
    
    case 82:
    color(#FF0000);
    textFont(sans, 250);
    text("81", 50, 50, 400, 400);
    break;
   
    case 83:
    color(#FF0000);
    textFont(sans, 250);
    text("82", 50, 50, 400, 400);
    break;
    
    case 84:
    color(#FF0000);
    textFont(sans, 250);
    text("83", 50, 50, 400, 400);
    break;
    
    case 85:
    color(#FF0000);
    textFont(sans, 250);
    text("84", 50, 50, 400, 400);
    break;
    
    case 86:
    color(#FF0000);
    textFont(sans, 250);
    text("85", 50, 50, 400, 400);
    break;
    
    case 87:
    color(#FF0000);
    textFont(sans, 250);
    text("86", 50, 50, 400, 400);
    break;
    
    case 88:
    color(#FF0000);
    textFont(sans, 250);
    text("87", 50, 50, 400, 400);
    break;
    
    case 89:
    color(#FF0000);
    textFont(sans, 250);
    text("88", 50, 50, 400, 400);
    break;
  
    case 90:
    image(delorean2, 0, 0);
  }
}

void mousePressed() {
    myState = (myState + 1) ;
    if(myState > 90) {
      myState = 0;
  }
}






String e = "";
String[] display = new String[1];

PFont font = createFont("",72);

void setup() {
  size(500,500);
  textFont(font,36);
  e = errorToString();
  
  background(0);
}

void draw() {
  translate(width/2,height/2);
  rotate(frameCount/20f);
  String[] parts = split(e,e.charAt(floor(random(e.length()))));
  String onePart = parts[floor(random(parts.length))];
  fill(frameCount%255);
  textFont(font,onePart.length());
  text(onePart,20,(onePart.length()*5));
}

String errorToString() {
  String error = "";
  try {
    int r = floor(random(2));
    if(r == 0) {
      int oops = 5/0;
    } else if (r == 1) {
      int oops = pixels[0];
    }
  } catch (Exception e) {
    error = e.toString();
    int s = e.getStackTrace().length;
    for(int i=0; i < s; i++) {
      error += e.getStackTrace()[i].toString();
    }
  }
  println(error);
  return error;
}

void keyPressed() {
  saveFrame("errorvortex.tif");
}


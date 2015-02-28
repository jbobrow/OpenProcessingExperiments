
String[] days; 
int[] visits; 
int[] clicks;

void setup() {
  size(650, 650);
  smooth();

  String lines[] = loadStrings("besucher.csv");

  days = new String[lines.length];
  visits = new int[lines.length];
  clicks = new int[lines.length];

  for (int i = 0; i < lines.length; i++) {
    String line = lines[i]; 

    String[] pieces = split(line, ",");

    days[i] = pieces[0];
    visits[i] = int(pieces[1]);
    clicks[i] = int(pieces[2]);
  }
}

void draw() {
  background(0);
    text("visits & clicks", 10, 15);

  float scaleFactor =  20;

  for (int i = 0; i < visits.length; i++) {
    int length = visits[i];
    float weight = clicks[i];
    
    noFill();
    stroke(255);

    float x = (0 + i) * scaleFactor;
    float y = height - length;
    
    strokeWeight( map(weight, 50, 250, 1, 20) );
    line(x + 10 , height, x + 10 , y);

    String title = days[i];

    pushMatrix();
    translate(x + 13, y - 10);
    rotate(radians(290));
    text(title, 0, 0);
    popMatrix();
    
  }
}



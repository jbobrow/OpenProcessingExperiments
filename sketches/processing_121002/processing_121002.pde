
ArrayList<String> phrases;
String[] words;
int fc;
float fontSize;

void setup() {
  size(800, 600);
  phrases = new ArrayList<String>();
  phrases.add("Don't Tell Anyone");
  phrases.add("Ko Has No Underwear");
  phrases.add("Don't Tell Anyone");
  phrases.add("I pooped");
  phrases.add("Don't Tell Anyone");
  phrases.add("I had sex with my boss's wife for money");
  //textFont(createFont("Helvetica", height));
  //textFont(createFont("TrajanPro-Regular", height));
  textFont(createFont("Trajan", height));

  smooth();
  frameRate(60);
  restart();
}

void draw() {
  pushMatrix();
  for (int i=0; i<words.length; i++) {
    pushMatrix();
    float xoff = max(textWidth("I"), min(abs((width-textWidth(words[i]))/2), textWidth(words[i])/2));
    translate((width-textWidth(words[i]))/2, (i+1)*textAscent()+textDescent());
    if (random(1) < 0.5) {
      if (abs(fc-540) < 16) {
        fill(255, 8);
        text(words[i], 0, 0);
      }
      else if (fc > 780) {
        restart();
      }
      else {
        fill(255, 4);
        text(words[i], random(-xoff, xoff), 0);
      }
    }
    popMatrix();
  }
  popMatrix();

  if (fc > 720) {
    fill(0, 16);
    rect(0, 0, width, height);
  }

  fc++;
}

void restart() {
  String phrase = phrases.remove(0);
  words = phrase.split(" ");
  phrases.add(phrase);
  fontSize = height/(words.length*1.1);
  textSize(fontSize);
  background(0);
  fc = 0;
}

void keyPressed() {
  if (key == ' ')
    restart();
}
void mousePressed() {
  restart();
}

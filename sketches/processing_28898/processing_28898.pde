
String meintext = "Creative Coding 2011. rockt!";
PFont myFont;

void setup() {
  size(300, 600);
  println(PFont.list());
  myFont = createFont("Helvetica-Bold", 18);
  textFont(myFont);
}

void draw() {
  background(0);
  int textS = 18;
  
  // meintext.length ist die buchstabenanzahl 
  for(int i=0;i<meintext.length();i=i+1) {
    // charAt(i) ruft den Buchstaben an der Stelle i auf
    fill(100 + int(meintext.charAt(i)));
    
    // wenn im Text das Zeichen a vorkommt,
    // dann färbe es in rot ein
    if(meintext.charAt(i) == 'a' || meintext.charAt(i) == 'e'){
      fill(255, 0, 0);
    }
    
    // prüft auf das vorkommen von einem Leerzeichen
    // ... damit kann man verschiedene Worte erkenne
    if(meintext.charAt(i) == ' '){
      textS = textS + 10;
    }
    
    // legt die Textgröße fest
    textSize(textS);
    
    // schreit jeden einzellnen Buchstaben
    text(meintext.charAt(i), 10 + i * 10, 30 + i*20);
    
    // interpretiert einen Buchstaben als Zahl: int(meintext.charAt(i))
    println(meintext.charAt(i) + " " + int(meintext.charAt(i)));
  }
  
}


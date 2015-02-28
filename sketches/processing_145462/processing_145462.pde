
  PImage bg;
  String[] oneSyllable = {
    "Love", "Life", "World",  "One", "Day", "Near", "Heart", "The",  "All", "Vast" };
  String[] twoSyllable = {
    "People", "Candy", "Softest", "Summerr", "Until", "Garden","Number","Sweetly","Dearest","Beckons"};
  String[] threeSyllable = {"Suitable", "Excitement", "Impulsive", "Adventure", "Passionate","Honesty", "Important", "Together", "Favorite", "Memory"};
  PFont font;

  void setup(){
      size(600,412);
      smooth();
       bg = loadImage("background2.jpg");
   }

  void draw(){
      background(bg);
      font = loadFont("ACaslonPro-Italic-32.vlw");
      fill(232 ,196,49);
      textFont(font, 32);
        String firstLine = twoSyllable [(int)random(twoSyllable.length)] + " " + threeSyllable [(int)random(threeSyllable.length)];
      
        String secondLine = threeSyllable [(int)random(threeSyllable.length)] + " " + threeSyllable [(int)random(threeSyllable.length)] + " " + oneSyllable [(int)random(oneSyllable.length)];
        
        String thirdLine = threeSyllable [(int)random(twoSyllable.length)] + " " + twoSyllable [(int)random(threeSyllable.length)];
      text(firstLine + "\n" + secondLine + "\n" + thirdLine, 25, 50);
      
      println(firstLine);
      println(secondLine);
      println(thirdLine);
      noLoop();
     
   save("haiku.jpg");
}
      

  



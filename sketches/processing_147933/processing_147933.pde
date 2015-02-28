
String[] oneSyllable = {
  "dog", "cat", "me",  "you", "fruit" };
  
String[] twoSyllable = {
  "people", "Candy", "monkey", "Tiger", "Glasses", "Garden","Number","Napkin","Pocket","Necklace"
};

String[] threeSyllable = {
  "suitable", "excitement", "impulsive", "adventure", "passionate"
};
PFont font;

void setup(){
size(500,800);
smooth();


}

void draw(){
 background(0);
font = loadFont("ACaslonPro-Italic-32.vlw");
fill(245,40,40);
textFont(font, 32);

  String firstLine = twoSyllable [(int)random(twoSyllable.length)] + " " + threeSyllable [(int)random(threeSyllable.length)];
  
  String secondLine = threeSyllable [(int)random(threeSyllable.length)] + " " + threeSyllable [(int)random(threeSyllable.length)] + " " + oneSyllable [(int)random(oneSyllable.length)];
  
  String thirdLine = twoSyllable [(int)random(twoSyllable.length)] + " " + threeSyllable [(int)random(threeSyllable.length)];
  
text(firstLine + "\n" + secondLine + "\n" + thirdLine, 25, 50);

println(firstLine);
println(secondLine);
println(thirdLine);
noLoop();
}



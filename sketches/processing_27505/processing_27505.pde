
PFont t;
void setup(){
  t=loadFont("Algerian-20.vlw");
  textFont(t,20);
  background(255);
  fill(139,90,128);
  size(240,100);
  String[] words = {"Moroccan Mint", "Madagascar Vanilla","Cozy Chamomile","Sleepytime Vanilla","Mandarin Orchard","Licorice Root","Irish Breakfast"};
  int index = int(random(words.length));
  text("The tea you need is:",1,30);
  text(words[index],1,60);
}


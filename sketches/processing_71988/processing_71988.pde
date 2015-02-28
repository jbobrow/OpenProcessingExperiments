
//Will Crownover, EMS II, Random text generator, 9-24-12

//Maybe the art of life is to convert tough times to great experiences. 
//We can choose to hate the rain or dance in it.  
//Joan Marques.

PFont font;

String [] quote = {"maybe", "the", "art", "of", "life", "is", "to", "convert", "tough", "time", "great", "experiences", "we", "can", "choose", "hate", "rain", "or", "dance", "in", "it"};
String [] author = {"j", "o", "a", "n", "m", "r", "q", "u", "e", "s"};

void setup(){
  size(600, 600);
  smooth();
  background(12, 22, 75);
  fill(70, 97, 240);
  textAlign( CENTER );
  font = loadFont("AppleGothic-48.vlw");
  textFont(font, 32);
  text ("Maybe the art of life is\nto convert tought times\nto great experiences.\n\nWe can choose to hate the rain\nor dance in it.", width/2, height/4);
  text ("-Joan Marques", width/2, height*.8);
  
}
  
void draw(){
  if( mousePressed){
    background(12, 22, 75);
    text( quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+"\n"+
    quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+"\n"+
    quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+"\n\n"+
    quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+"\n"+
    quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))]+" "+quote[int(random(0, quote.length))], width/2, height/4);
    text ( "-"+author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))]+" "+
    author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))]+author[int(random(0, author.length))], width/2, height*.8);
  }
}



void setup(){
size(600,800);
background(255);
}
 
void draw(){
  frameRate(random(5,15));
  background(255);
  String []verbs = { "love","hate","find","seek","like","meet"};
String []nouns = {"money.","houses.","cars.","plants.","cats.","art.","life.","horses.","you.","us.",
"work.","fear.","terror.","war.","death.","peace.","fights.","crying.","jokes.","dogs.","red.","sex.",
"girls.","boys.","men.","women.","meat.","him.","her.","them."};
 
int n = int(random(30));
//int v = int(random(6));
fill(0);
textSize(96);
text( "I love", 17,height/2);
//text( verbs[v],50,height/2);
fill(255,0,0);
textSize(96);
text( nouns[n], 270,height/2);}




PFont font1=loadFont("DamascusBold-24.vlw");
PFont font2=loadFont("Chalkduster-24.vlw");

String text1="A popular approach to ­video-game design is to “think about the verbs.” Interactive entertainment should be verb-led, some say, and the way to make a good game is to think about what the player does. In many games, you have to do the things it wants you to do whether you want to or not. If you don’t like it, as the saying goes, just don’t play it.";
String text2="Games have a heritage in simple verbs. Remember the stuff you played at friends’ houses as a kid? In those games, you’re a guy. You jump on that guy, you grab the thing, you beat the boss. Lots of people spent hours in a basement yelling things like get that guy, get him, and trying to win the prize at the end of all the verbs: often a woman, locked in a castle, imprisoned in an ice crystal, bound with rope, tied to a wall, a scaffold, a set of shackles.";
void setup(){
size(480,360);
background(255);
}

void draw(){
  noStroke();
  fill(255);
  rect(0,0,480,360);
  textFont(font1);
  fill(127);
  text(text1,10,10,mouseX,mouseY);
  textFont(font2);
  fill(0);
  text(text2,mouseX,mouseY,470-mouseX,350-mouseY);
}

  


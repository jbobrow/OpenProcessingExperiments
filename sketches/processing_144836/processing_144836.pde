
//Another OpenProcessing "hacking" ;)

var isGuest   = parent.isGuestUser;
var isInFaves;

console.log(isGuest);

if(isGuest) {
  console.log("You are not logged in...");
} else {
  console.log("You are logged ;)");
  //  parent.setFavorite();
}

void setup() {
  size(500,300);
}

void draw() {
  background(0);
  textAlign(CENTER);
  textSize(16);
  stroke(255);
  fill(255);
  String txt;
  if(isGuest) {
    txt = "You are not logged in :("
  } else {
    txt = "Do you know, you just have added this sketch to faves? ;)"
  }
  text(txt,width/2,height/2);
  textSize(12);
  text("(The main functionality of the sketch was turned off - read description)",width/2,20);
}

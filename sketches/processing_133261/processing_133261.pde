
int sayingNum = 0;
String currentSaying;
ArrayList<String> reasonings = new ArrayList<String>(); // arraylist of the detectives reasonings(deductions);

 class Detective {
    PVector location;
    PVector velocity = new PVector(0, 0);
    
    Detective(float x, float y) {
    location = new PVector(x, y);
    
    
    reasonings.add("So this is the Murder Scene...");
    reasonings.add("It appears our victim has been stabbed in the chest region.");
    reasonings.add("Hmm... the blood hasn't completetly dried yet");
    reasonings.add("Perhaps the murderer dropped the weapon while he was fleeing!");        // list of strings the detective will say
    reasonings.add("Do I have your word that this crime scene has not been altered at all?");
    reasonings.add("Excellent! Let us search then!");
    reasonings.add("If you find any evidence, do not touch it! That is quite important!");
    reasonings.add("We must preserve the crime scene!");
    reasonings.add("");

    currentSaying = reasonings.get(0); // starts with the first string in the list
  }

  void display() {
    image(detective.acq(walk[index]), location.x, location.y); // displays to sprite according to the spritesheet. Walk is an arbitary array that changes according to which way the detective
                                                                 // wishes to move. the index will change as well to keep the detective in his last moving state and direction
    
  }
void move(){
   if (keyPressed==true){ ///
    
  if (keyCode==LEFT){
    walk = walkleft; // changes the array to the walking left one
    index = wlidx;  // changes the index to the walking left index;
    location.x-=5; // moves left
  wlidx++;  // increases the index to go to next frame in moving left.
  }
  if (keyCode==RIGHT){               // the rest is same as above but with their respective array
    walk= walkright;
    index = wridx;
    location.x+=5;
    wridx++;
  }
  if (keyCode==UP){
    walk= walkup;
    index = wuidx;
    location.y-=5;
    wuidx++;
  }
   if (keyCode==DOWN){
    walk= walkdown;
    index = wdidx;
    location.y+=5;
    wdidx++;
  }
  }


  if (wlidx > walkleft.length - 1) {   // makes sure each respective index does not exceed the length of the each respective array
    wlidx = 0;
  }
    if (wridx > walkright.length - 1) {
    wridx = 0;
  }
   if (wdidx > walkdown.length - 1) {
    wdidx = 0;
  }
   if (wuidx > walkup.length - 1) {
    wuidx = 0;
  }
}


void speech() {  // displays what the inspector is saying.
    fill(0,255,0);
    
     PFont f = createFont("Arial",20);
    textFont(f, 20);
    text(currentSaying, location.x, location.y-12);
   
  }
}



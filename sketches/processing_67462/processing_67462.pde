
// a to add to screen(add is coloured fill?), spacebar for random short quotes, rest as is 
PFont Font01;
String[] subject = { "i", "you", "it", "the surgeons", "the beast"};
int s = int(random(5));
String[] verb = { "bit", "hurt", "killed", "destroyed", "loved"};
int v = int(random(5));
String[] object1 = { "the rock", "the universal", "sand", "my soul", "my body"};
int o = int(random(5));
String[] adjective = { "suicidal", "raging", "delirious", "fucked up", "lost"};
int a = int(random(5));
String[] adverb = { "nowhere", "quietly", "silently", "patiently", "deliberately"};
int d = int(random(5));
String[] noun = { "the antichrist", "angel", "mother", "dog", "lolita"};
int n = int(random(5));
String[] phrase = { "soon it's going to rain", "the sin, the sin", "written in grey", "mother", "the jerusalem of old"};
int p = int(random(5));

void setup() {
   size(500, 500);
   background(255);
 
   Font01 = loadFont("AppleGothic-48.vlw");
}
 
void mouseDragged() {
  {
    
    background(random(255), random(255), random(255));
    fill(random(255));
    textFont(Font01);
    s = int(random(5));
    text(subject[s], 20, 70);
    v = int(random(5));
    text(verb[v], 20, 120);
    o = int(random(5));
    text(object1[o], 20, 170);
    s = int(random(5));
    text(subject[s], 20, 220);
    v = int(random(5));
    text(verb[v], 20, 270);
    n = int(random(5));
    text(noun[n], 20, 320);
    
  
  }
}

void draw() {

  
}



void keyPressed() {
  if (key == ' ') {
    background(random(255), random(255), random(255));
    fill(random(255));
    textFont(Font01);
     p = int(random(5));
    text(phrase[p], 20, random(70,420));
  }
 if (keyCode == UP) {
    
    fill(random(255));
    textFont(Font01);
     p = int(random(5));
    text(phrase[p], 20, random(0,500));
  }   
  
  if (keyCode == DOWN) {
   
    background(random(255), random(255), random(255));
    fill(random(255));
    textFont(Font01);
     s = int(random(5));
    text(subject[s], 20, 370);
    v = int(random(5));
    text(verb[v], 20, 420);
  }
  
  
}

    
 




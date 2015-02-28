
String[] activities, three = {"","",""};
PFont font, font2;
int choiceCount;
int[] randos = {-3,-1,-2};
String stuff;
//boolean editing = false;

void setup() {
  size(800,200);
  stuff = loadStrings("activities.txt")[0];
  activities = split(stuff,",");
  choiceCount = activities.length;
  font = loadFont("AccordLightSF-30.vlw");
  font2 = loadFont("Calibri-12.vlw");
  textAlign(CENTER);
  rectMode(CENTER);
  reset();
}

void draw() {
  strokeWeight(0);
  background(color(220,50,20));
  textFont(font,30);
  fill(255);
  for(int i=0;i<3;i++){
    text(activities[randos[i]], width/2, (i+1)*50);
  }
  textFont(font,30);
  strokeWeight(2);
  if(mouseX>692 && mouseX<794 && mouseY<194 && mouseY>162) {
    stroke(0);
    rect(743,178,102,32);
    fill(0);
  } else {
    fill(0);
    stroke(255);
    rect(743,178,102,32);
    fill(255);
  }
  text("reset!",743,191);
  if(mouseX>6 && mouseX<108 && mouseY<194 && mouseY>162) {
    stroke(0);
    rect(57,178,102,32);
    fill(0);
  } else {
    fill(0);
    stroke(255);
    rect(57,178,102,32);
    fill(255);
    stroke(0);
  }
  text("edit!",57,191);
    
}

void mousePressed() {
  if(mouseX>692 && mouseX<794 && mouseY<194 && mouseY>162) {
    reset();
  }
  if(mouseX>6 && mouseX<108 && mouseY<194 && mouseY>162) {
    String input = prompt("Enter the list of activities you want the chooser to choose from, or delete everything to reload the default list.",stuff);
    if(input != "") {
      stuff = input;
    } else {
      stuff = loadStrings("activities.txt")[0];
    }
    reset();
  }
}

void reset() {
  for(int i=0;i<3;i++) {
    randos[i] = -i;
  }
  activities = split(stuff,",");
  choiceCount = activities.length;
  for (int i=0;i<3;i++) {
    randos[i] = randValue();
  }
}

int randValue() {
  int check = int(random(0,choiceCount));
  for(int i=0;i<randos.length;i++){
      if(check==randos[i]) check = randValue();
    }
    return check;
}




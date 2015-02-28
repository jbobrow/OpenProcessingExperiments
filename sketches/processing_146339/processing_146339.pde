
//PImage gear;
boolean absRun=false;
boolean stretchRun=false;
boolean iceRun=false;
boolean optionsRun=false;
boolean absOptions=false;
boolean stretchOptions=false;
boolean menuRun=true;
String[] exercises = new String[11];
int i;
int time;

void setup() {
 // gear = loadImage("gear.png");
  size(400, 400);
  background(160, 160, 160);
  workoutArray();
}

void draw() {
  background(200, 200, 200);
  if (absRun) {
    workout();
    menuRun=false;
  }
  else if (stretchRun) {
    menuRun=false;
  }
  else if (iceRun) {
    ice();
    menuRun=false;
  }
  else if (absOptions) {
    menuRun=false;
  }
  else if (stretchOptions) {
    menuRun=false;
  }
  else if(menuRun=true){
    menuRun=true;
    menu();
    
  }
}

void menu() {
  textSize(40);
  fill(0);
  textAlign(CENTER, CENTER);
  text("Conditioning Coach", 200, 25);
  noFill();
  textSize(25);
  rect(100, 75, 200, 50, 10);
  text("Ab Workout", 200, 95);
  //image(gear, 50, 75, 50, 50);
  rect(100, 150, 200, 50, 10);
 // image(gear, 50, 150, 50, 50);
  text("Stretch", 200, 170);
  rect(100, 225, 200, 50, 10);
  text("Ice", 200, 245);
  rect(100, 300, 200, 50, 10);
  text("Options", 200, 320);
}

void mouseClicked() {
  if (mouseX>100&&mouseX<300) {
    if (mouseY>75&&mouseY<125) {
      menuRun=false;
      absRun=true;
      background(160, 160, 160);
      time=millis();
    }
    else if (mouseY>150&&mouseY<200) {
      menuRun=false;
      stretchRun=true;
      background(160, 160, 160);
    }
    else if (mouseY>225&&mouseY<275) {
      menuRun=false;
      iceRun=true;
      background(160, 160, 160);
      time=millis()-4000;
    }
    else if (mouseY>300&&mouseY<350) {
      menuRun=false;
      optionsRun=true;
      background(160, 160, 160);
    }
    else if (mouseX>50&&mouseX<350&&mouseY>275&&mouseY<325&&absRun) {
      menuRun=true;
      absRun=false;
    }
  }
}

void workoutArray() {
  exercises[0]="Straight Crunches";
  exercises[1]="Right Side Crunches";
  exercises[2]="Left Side Crunches";
  exercises[3]="Roll Backs";
  exercises[4]="Right Twist Crunches";
  exercises[5]="Left Twist Crunches";
  exercises[6]="Leg Pushes";
  exercises[7]="Toe Touches";
  exercises[8]="Bicycles";
  exercises[9]="Push Throughs";
  exercises[10]="Russian Twists";
}

void workout() {
  if (i<exercises.length) {
    textSize(35);
    text(exercises[i], 200, 100); 
    if (3-(millis()-time)/1000!=0) {
      text(3-(millis()-time)/1000, 200, 300);
    }
    if ((millis()-time)/1000>=3) {
      i++;
      time=millis();
    }
  }
  else {
   back();
  }
}

void ice(){
  if(time-millis()<900*1000){
    if((900000-millis()-time)/1000%60>9){
    text((900000-millis()-time)/60000+" : "+(900000-millis()-time)/1000%60, 200, 300);
    }else{
      text((900000-millis()-time)/60000+" : 0"+(900000-millis()-time)/1000%60, 200, 300);
    }
  }
}

void back(){
 background(160,160,160);
 text("Good Job!", 200, 95);
 rect(50,275,300,50,10); 
 text("Return to menu", 200, 295);
}



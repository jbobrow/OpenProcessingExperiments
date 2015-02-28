
PImage layout;
PFont calibri;
int currentNote = 0;
boolean submit, correct;
Note[] notes = new Note[13*6];
String[] question = {"C","C# / Db","D","D# / Eb","E","F","F# / Gb","G","G# / Ab","A","A# / Bb","B"};
int[][] answer = { {8,14,31,49,55,75},
                   {9,15,32,50,56,76},
                   {10,16,33,39,51,57,65,77},
                   {11,17,34,40,58,66},
                   {0,12,18,35,41,59,67},
                   {1,19,36,42,60,68},
                   {2,20,37,43,61,69},
                   {3,21,26,38,44,62,70},
                   {4,22,27,45,63,71},
                   {5,23,28,46,52,64,72},
                   {6,24,29,47,53,73},
                   {7,13,25,30,48,54,74} };
void setup(){
  submit = false;
  correct = true;
  currentNote = round(random(1)*11);
  smooth();
  size(681,216);
  background(255);
  noStroke();
  layout = loadImage("layout.png");
  image(layout,0,0);
  calibri = loadFont("calibri.vlw");
  textFont(calibri,50);
  textAlign(CENTER);
  fill(255);
  text(question[currentNote],288,197);
  for(int i = 0; i < 6; i++){
    for(int j = 0; j < 13; j++){  
      notes[i*13+j] = new Note(); 
      notes[i*13+j].xPos = (j*50)+25;
      notes[i*13+j].yPos = round(i*25+12.5);
    }
  }
}

void draw(){

}

void mousePressed(){
  if (submit == false){
    if(mouseY < 25*6 && mouseX < 50*13){
      if(notes[(mouseY/25)*13+(mouseX/50)].selected == false){
        notes[(mouseY/25)*13+(mouseX/50)].select();
      } else {
        notes[(mouseY/25)*13+(mouseX/50)].undo();
      }
    } else if (430 < mouseX && mouseX < 499 && 161 < mouseY && mouseY <185){
      submit = true;
      for (int i = 0; i < notes.length; i++){
        int noteCheck = 0;
        for (int j = 0; j < answer[currentNote].length; j++){
          if (notes[i].selected == true && answer[currentNote][j] == i){
            notes[i].gradePass();
          } else if (notes[i].selected == false && answer[currentNote][j] == i){
            notes[i].gradeFail();
            correct = false;
          } else if (notes[i].selected == true && answer[currentNote][j] != i){
            noteCheck ++;
            if (noteCheck == answer[currentNote].length){
              notes[i].gradeFailX();
              correct = false;
            }
          }
        }
      }
      if (correct == true){
        textAlign(LEFT);
        fill(50);
        textFont(calibri,13);
        text("Correct! Click anywhere to continue",435,203);
      } else {
        textAlign(LEFT);
        fill(50);
        textFont(calibri,13);
        text("Incorrect. Click anywhere to continue",435,203);
      }
    } else if(502 < mouseX && mouseX < 572 && 161 < mouseY && mouseY <185){
      for (int i = 0; i < notes.length; i++){
        notes[i].undo();
      }
    }
  } else {
    setup();
  }
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    setup();
  }
}

class Note {
  int xPos,yPos;
  boolean selected = false;
  
  void select(){
    fill(40,131,209);
    ellipse(this.xPos,this.yPos,14,14);
    this.selected = true;
  }
  void gradePass(){
    fill(0,255,0);
    ellipse(this.xPos,this.yPos,8,8);
  }
    void gradeFail(){
    fill(255,0,0);
    ellipse(this.xPos,this.yPos,8,8);
  }
    void gradeFailX(){
    fill(255,0,0);
    textFont(calibri,22);
    text('x',this.xPos-.3,this.yPos+5);
  }
  void undo(){
    this.selected = false;
    image(layout,0,0);
    fill(255);
    text(question[currentNote],288,197);
    for (int i = 0; i < 13 * 6; i++){
      if(notes[i].selected == true){
        notes[i].select();
      }
    }
  }
}



int state = 0;
String title;
String text;
BufferedReader in;
ArrayList<String> questions;
ArrayList<String> answers;
ArrayList<String> explanations;
ArrayList<String> pictures;
boolean[] guessed;
int wrong;
Man m;
int curQ;

void setup() {
  size(800, 800);
  guessed = new boolean[26];
  wrong = 0;
  resetGuessed();
  m = new Man(450,100);
  title = "HANGMAN";
  text = "Welcome to OPTICS Hangman! Press a letter on your keyboard to guess a letter of a randomly chosen optics word. After 7 failed attempts, you will have lost. You will also be given a hint near the top of the screen! Everytime you win (or lose) a game, you will automatically be shown an explanation page where you will need to press the space bar to continue, followed by a new game. Press the spacebar to continue to the game.";
  in = createReader("questions.txt");
  questions = new ArrayList<String>();
  answers  = new ArrayList<String>();
  explanations = new ArrayList<String>();
  pictures = new ArrayList<String>();
  String line = "";
  try {
    while ( !(line = in.readLine ()).equals("XXXX")){
      if (line.equals("QQQQ")) {
        questions.add(in.readLine());
      } 
      else if (line.equals("AAAA")) {
        answers.add(in.readLine());
      } 
      else if (line.equals("EEEE")) {
        explanations.add(in.readLine());
      } 
      else if (line.equals("PPPP")) {
        pictures.add(in.readLine());
      }
    }
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
  curQ = (int)(Math.random()*questions.size());
}

void draw(){
  background(255,255,255);
  if(state==0){
    drawInstructions(title,text);
  }else if(state==1){
    m.drawThis();
    drawQuestion(questions.get(curQ),answers.get(curQ));
    if(wrong==7 || finished(answers.get(curQ))){
      state=2;
    }
  }else if(state==2){
    drawExplanation(questions.get(curQ),answers.get(curQ),explanations.get(curQ),pictures.get(curQ));
  }
}

void resetGuessed(){
  for(int i = 0; i < 26; i++){
    guessed[i]=false;
  }
}

void keyReleased(){
  if(state == 1 && key!=CODED && key-'a' < 26 && key-'a' >= 0){
    int i = key-'a';
    if(!guessed[i]){
      guessed[i]=true;
      String ans = answers.get(curQ);
      boolean there = false;
      for(int j = 0; j < ans.length();j++){
        if(ans.charAt(j)-'A'==i) there = true;
      }
      if(!there){
        wrong++;
        m.incStage();
      }
    }
  }
  if(key==' ' && state == 0) state=1;
  if(key==' ' && state == 2) {
    resetGuessed();
    m = new Man(450,100);
    curQ = (int)(Math.random()*questions.size());
    wrong = 0;
    state=1;
  }
}

void holdon(long millis){
  long time = millis();
  while(millis()-time<millis);
}




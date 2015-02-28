
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


int border = 20;

void drawInstructions(String title,String text){
  textAlign(CENTER);
  background(255,255,255);
  fill(0,0,0);
  textSize(60);
  text(title,border,border,width-2*border,height-2*border);
  textSize(30);
  text(text,border,200,width-2*border,height-2*border);
}

void drawExplanation(String q, String a, String e, String p){
  textSize(20);
  background(255,255,255);
  fill(0,0,0);
  textAlign(LEFT);
  text("Question: " + q,border,border,width-2*border,height-2*border);
  text("Answer: " + a,border,120,width-2*border,height-2*border);
  text("Explanation: " + e,border,170,width-2*border,height-2*border);
  if(!p.equals("-")){
    PImage pic = loadImage(p);
    int w = pic.width;
    int h = pic.height;
    double change = 760.0/w;
    int temp = (int)(h*change);
    int xC = 760;
    int yC = temp;
    if(temp>460){
      yC = 460;
      change = 460.0/h;
      xC = (int)(change*w);
    }
    image(pic,20,320,xC,yC);
  }
}

void drawQuestion(String q, String a){
  textSize(20);
  fill(0,0,0);
  text(q,40,80,360,400);
  String ans = "";
  for(int i = 0; i < a.length();i++){
    char c = a.charAt(i);
    if(!Character.isLetter(c))ans+=c;
    else {
      if(!guessed[c-'A'])ans+='_';
      else ans+=c;
    }
  }
  textSize(40);
  fill(0,0,0);
  text(ans,40,400,360,400);
}

boolean finished(String a){
  boolean f = true;
  for(int i = 0; i < a.length();i++){
    char c = a.charAt(i);
    if(Character.isLetter(c) && !guessed[c-'A']) f=false;
  }
  return f;
}
class Man{
  int xPos;
  int yPos;
  int stage;
  
  Man(int x, int y){
    xPos = x;
    yPos = y;
    stage = 0;
  }
  
  void drawThis(){
    drawBase();
    if(stage==7)yPos+=80;
    drawMan();
    if(stage==7)yPos-=80;
  }
  
  void drawBase(){
    noStroke();
    rectMode(CORNER);
    fill(0,0,0);
    rect(xPos,yPos,300,500);
    fill(255,255,255);
    rect(xPos,yPos+20,280,460);
    rect(xPos,yPos,130,20);
    fill(0,0,0);
    rect(xPos+130,yPos,5,40);
  }
  
  void drawMan(){
    if(stage>0){
      ellipseMode(CORNER);
      ellipse(xPos+100,yPos+40,70,70);
    }
    if(stage>1){
      fill(0,0,0);
      stroke(0,0,0);
      strokeWeight(10);
      line(xPos+132,yPos+100,xPos+132,yPos+250);
    }
    if(stage>2){
      line(xPos+132,yPos+250,xPos+82,yPos+325);
    }
    if(stage>3){
      line(xPos+132,yPos+250,xPos+182,yPos+325);
    }
    if(stage>4){
      line(xPos+132,yPos+150,xPos+82,yPos+200);
    }
    if(stage>5){
      line(xPos+132,yPos+150,xPos+182,yPos+200);
    }
    if(stage>6){
      noStroke();
      rect(xPos+130,yPos-80,5,120);
    }
  }
  
  void incStage(){
    stage++;
  }
}




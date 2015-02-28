
//declare
ArrayList stringCollection;



void setup() 
{
  size(600, 600);
  smooth();
  
  //initialize
  
  stringCollection = new ArrayList();
  //for (int i = 0; i < 20; i++) {
    //stringCollection [i] = new string(random(0, width), random(0, 200));
  //}
}

void draw() {
  background(0);


  string myRing = new string(300,300);
  stringCollection.add(myRing);


  
  //call functionality
  for (int i = 0; i < stringCollection.size(); i++) {
    string go = (string)stringCollection.get(i);
    go.run();
  }



}
class string {
  //Global Variables
  float x = 0;
  float y = 0;
  float speedX = (random(-2, 2));
  float speedY = (random(-2, 2));

  //Constructor
  string(float _x, float _y ) {
    x = _x;
    y = _y;
  }
  //Functions
  void run() {
    display();
    move();
    bounce();
    gravity();
  }

  void gravity() {
    speedY += 0.04;
  }


  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    }  

    if (x < 0) {
      speedX = speedX * -1;
    }  

    if (y > height) {
      speedY = speedY * -1;
    }  

    if ( y < 0) {
      speedY = speedY * -1;
    }
  }

  void move() {
    x += speedX;
    y += speedY;
  }

  void display() {

    text("mother", 300, 100);


    String[] survey = {
      "love", "hug", "warm", "dad", "kitchen", "age", "trust", "home", "warm", 
      "love", "care", "permission", "love", "dishonoured", "loyalty", "kindness", "warm", "love", "careful", "help", "love", 
      " emotion", "feeding", "care", "pure", "love", "trust", "caregiver", "hug", "soft", "sucking", "fucker", "breast-milk", 
      " baby", " mothercare ", " motherfood ", " real ", " assimilate", " sense ", "swearing", "holy", "family", " kid", " home", " trust ", 
      "motherland", "mothernature", "father ", " love ", " peace ", " trust ", " home ", " fight ", " crowded ", " trust ", " love ", "friend ", 
      "love", "trust", "worry", "home", "trust", "friend", " angry", "safe", "hope ", 
      "friend", "cook", "safe", " love ", "life", "talkative", " love", "protector", "provider ", " purity", "milk", "love ", " safety", " trust", 
      "warm ", " love", "child", "hugging ", " love", "hate", "child ", 
      " love  ", "angry", "helpful ", " pure", "heat", "experience ", " smell ", " smile ", " similar ", " real ", "love", "care", "warmth", 
      " trust", "love", "care", " love", "annoying", "free food", "cleaning", "cooking", "angry", 
      " love", "help", "sacrifice", " caring", "clock", "functional ", " love", "friend", "sacrifice", " food", "protection", "love", "love", "happy", 
      "food ", "source", "director", "feminine", "blonde", "hair", "blue eyes", "beauty", "bang", "missing", "funny", " nature", "fertility", "culture", 
      " loyalty", "unique", "love ", " protective", "sincere", "healer ", " love", "concern", "sensibility", 
      " cook", "clean", "compassion ", " pure", "beauty", "patient"
    };
    int n = int(random(survey.length));

    text(survey[n], x, y);
  }
}


int radius = 300;  //What is the difference between an int and a float?

int oneArray, twoArray;

float [] xPos = new float [360];  //What are these called and what do they do?
float [] yPos = new float [360];


void setup() {        //Describe what "setup" does:
  size(800,800);      //What does this do?
  smooth();           //What does this do?
  background(0);    //What does this do?
  
  //Describe what's happening here:
  for (int i = 0; i < 360; i++) {
    int deg = i;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
  }
  
/*}

void draw() {*/      //Describe what "draw" does generally:

stroke (255);
  //Describe what's happening here:
  translate(width/2, height/2);

  //Describe what's happening here:
    
    for (int i = 0; i < 700; i++) {
    
    stroke (random(255), random(255), random(255));
      
    oneArray = int (random (360));
    twoArray = int (random (360));
    
    line (xPos[oneArray], yPos[oneArray], xPos[twoArray], yPos[twoArray]);    
  
    }
    
//delay (1000);

}
//Describe what this sketch does:


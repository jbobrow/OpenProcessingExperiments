
int radius = 300;  //What is the difference between an int and a float?
int num=360;
float [] xPos = new float [num];  
float [] yPos = new float [num];
float [] xPos1 = new float [num];  
float [] yPos1 = new float [num];



void setup() {        //Describe what "setup" does:
  size(800,800);      //What does this do?
  smooth();           //What does this do?
  background(0);    //What does this do?
  
  //Describe what's happening here:
  for (int i = 0; i < num; i++) {
    int deg = i;
    float angle = radians(deg);
    xPos[i] = cos(angle) * radius;
    yPos[i] = sin(angle) * radius;
    xPos1[i] = cos(angle) * radius;
    yPos1[i] = sin(angle) * radius;
  }
  
}

void draw() {      //Describe what "draw" does generally:

  //Describe what's happening here:
  translate(width/2, height/2);
  
  //Describe what's happening here:
 
   

  //Describe what's happening here:
  for (int i = 0; i < num; i++) {
  int r1=(int)random(num);
  int r2=(int)random(num);  
  stroke(random(255), random(255), random(255));
  line(xPos[r1], yPos[r1], xPos1[r2], yPos1[r2]);    
    
  }

}
//Describe what this sketch does:


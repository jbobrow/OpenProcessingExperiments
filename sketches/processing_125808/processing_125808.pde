
IntList takenx;
IntList takeny;

void setup() {
  size(1000, 1000);
  background(255, 248, 231);
  takenx = new IntList();
  takeny = new IntList();
  random_points();
}
float ur = random(0, 255); //random user red value for character
float ug = random(0, 255); //random user green value for character
float ub = random(0, 255); //random user blue value for character
float uposx = 500;
float uposy = 500;
float uspeed = 10;
float tempone=0;
float temptwo=0;
int tempy=0;
int tempx=0;
int i = 0;
int limiter = 0;


void user_char() {
  fill(ur, ug, ub);
  rect(uposx, uposy, 25, 25);
}

void keyPressed() {
  if ((key == 'A')||(key == 'a')) {
    uposx -= uspeed;
  }
  if ((key == 'D')||(key == 'd')) {
    uposx += uspeed;
  }
  if ((key == 'W')||(key == 'w')) {
    uposy -= uspeed;
  }
  if ((key == 'S')||(key == 's')) {
    uposy += uspeed;
  }
}
//void draw(){
//  fill(ur
void random_points(){ 
  
  for (i=0;i<5; i = i + 1) {
      tempone = random(200, 500);
      tempx = int(tempone);
      takenx.append(tempx);
      temptwo = random(200, 500);
      tempy = int(temptwo);
      takeny.append(tempy);
      while (takenx.hasValue (tempx)) {
        tempone = random(200, 500);
        tempx = int(tempone);
      }
      takenx.append(tempx);

      while (takeny.hasValue (tempy)) {
        temptwo = random(200, 500);
        tempy = int(temptwo);
      }
      takeny.append(tempy);
      print(i);
    }
  }

void draw() {
  background(255, 248, 231);
  user_char();
  fill(139,119,101);
  ellipse(takenx.get(0),takeny.get(0),50,50);
  ellipse(takenx.get(1),takeny.get(1),50,50);
  ellipse(takenx.get(2),takeny.get(2),50,50);
  ellipse(takenx.get(3),takeny.get(3),50,50);
  ellipse(takenx.get(4),takeny.get(4),50,50);
}


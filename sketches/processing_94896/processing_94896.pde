
int i; //iteration variable

void setup () {
  size(500, 500); //Size of background
  background(0); //Background color
  frameRate(5); //slow frame change
  noStroke(); //No lines
}

void draw() {
  if (random(0, 1) < 0.5) { //Blue or red?
    fill(255, 0, 0); //Red this time
  } else {
    fill(0, 0, 255); //Blue this time
  }
  int r1 = (int)random(0, 380); //Random x variable to move around the monster
  int r2 = (int)random(0, 380); //Random y variable to move around the monster
  body(r1, r2, 10, 90); //body
  eyes(r1, r2-60); //eyes
  iries(r1, r2-60); //iries
}

//Body function
 void body(int x, int y, int z, int a) {
  rect(x, y, z, a); //1st bar
  rect(x+10, y-30, z, a+40); //2nd bar
  rect(x+20, y-40, z, a+50); //3rd bar
  rect(x+30, y-50, z, a+50); //4th bar
  rect(x+40, y-50, z, a+40); //5th bar
  rect(x+50, y-60, z, a+60); //6th bar
  rect(x+60, y-60, z, a+70); //7th bar
  rect(x+70, y-60, z, a+70); //8th bar
  rect(x+80, y-60, z, a+60); //9th bar
  rect(x+90, y-50, z, a+40); //10th bar
  rect(x+100, y-50, z, a+50); //11th bar   
  rect(x+110, y-40, z, a+50); //12th bar
  rect(x+120, y-30, z, a+40); //13th bar
  rect(x+130, y, z, a); //14th bar
}

//Eyes function
void eyes(int x, int y) {
  fill(255); //white eyes
  int u = x + 20; //creates a new x base position
  int v = y + 30; //creates a new y base position
  rect(u, v+10, 10, 30); //first bar for left eye
  rect(u+10, v, 10, 50); //second bar for left eye
  rect(u+20, v, 10, 50); //third  bar for left eye
  rect(u+30, v+10, 10, 30); //fourth  bar for left eye
  rect(u+60, v+10, 10, 30);  //first bar for right eye
  rect(u+70, v, 10, 50);  //second bar for right eye
  rect(u+80, v, 10, 50); //third bar for right eye
  rect(u+90, v+10, 10, 30);  //fourth bar for right eye
}

//Iries function
void iries(int x, int y) {
  int u = x + 20; //creates a new x base position
  int v = y + 30; //creates a new y base position
  fill(0, 0, 255);  //blue iries 
  rect(u+10, v+20, 20, 20); //left iris
  rect(u+70, v+20, 20, 20); // right iris
}


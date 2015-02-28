

int v = 0;
int record = 10;
color mc = color (0);

Circle[] circle = new Circle[record];
float[] age = new float[record];
float[] nav = new float[record];
float[] dis = new float[record];

color[] circlefill = new color[record];

PFont font;
//PFont font2;

String navi = " ";
String diso = " ";

void setup() {
  size(900, 600);

  background(0);
  smooth();

  font = loadFont("AgencyFB-Reg-24.vlw");
  


  String[] lineno = loadStrings("data.csv");
  for (int i=1; i<11; i++) {
    float[] bits = float(split(lineno[i*30], ","));
    age[i-1] = bits[26];
    nav[i-1]=bits[7];
    dis[i-1]=bits[9];
  } 

  for (int fi=0; fi<record; fi++) {
    circlefill[fi] = color ((fi+240), 0, 0);
  }


  for (int ci=0; ci < record; ci++) {
    circle[ci] = new Circle((random(400) + 250), (random(500)+50), age[ci], circlefill[ci]);
  }
}

void draw() {

  noStroke();
  fill(255);
  rect(199, 0, 701, height);
  for (int iii=0; iii < record; iii++) {
    circle[iii].rendercircle();
  }
}


class Circle {
  float x=0;
  float y=0;
  float d=0;
  float speed = (random(1)+1);
  int xdirection = 1;
  int ydirection = 1;
  color fillc = color(0);


  public Circle(float x, float y, float d, color fillc) {
    this.x = x;
    this.y = y;
    this.d = map(d, 20, 80, 30, 50);
    this.fillc = fillc;
  }

  public void rendercircle() {         
    x = x + (speed * xdirection);
    y = y + (speed * ydirection);

    if (x >=width-(d/2) || x < 200+(d/2) ) {
      xdirection *= -1;
    }
    if (y >= height-(d/2) || y <(d/2)) {
      ydirection *= -1;
    }

    strokeWeight(2);
    stroke (100, 100, 100);
    fill (fillc);
    ellipse(x, y, d, d);
  }

  public void circleupdate() {
    speed = 0;
  }
  public void circlereset(){
   speed =  (random(1)+1);
  }
}



void mousePressed() {

  mc = get(mouseX, mouseY);

  if (mousePressed == true && mc == color (240, 0, 0))
  {
    v=0;
    displayDetails();
    circle[0].circleupdate();
  }
  if (mousePressed == true && mc == color (241, 0, 0))
  {
    v=1;
    displayDetails();
    circle[1].circleupdate();
  }
  if (mousePressed == true && mc == color (242, 0, 0)) {
    v=2;
    displayDetails();
    circle[2].circleupdate();
  }
  if (mousePressed == true && mc == color (243, 0, 0)) {
    v=3;
    displayDetails();
    circle[3].circleupdate();
  }
  if (mousePressed == true && mc == color (244, 0, 0)) {
    v=4;
    displayDetails();
    circle[4].circleupdate();
  }
  if (mousePressed == true && mc == color (245, 0, 0)) {
    v=5;
    displayDetails();
    circle[5].circleupdate();
  } 
  if (mousePressed == true && mc == color (246, 0, 0)) {
    v=6;
    displayDetails();
    circle[6].circleupdate();
  }
  if (mousePressed == true && mc == color (247, 0, 0)) {
    v=7;
    displayDetails();
    circle[7].circleupdate();
  }
  if (mousePressed == true && mc == color (248, 0, 0)) {
    v=8;
    displayDetails();
    circle[8].circleupdate();
  }
  if (mousePressed == true && mc == color (249, 0, 0)) {
    v=9;
    displayDetails();
    circle[9].circleupdate();
  }
}

void keyPressed (){
 if ((keyPressed == true) && (keyCode == 32)){
   for (int cr=0; cr<record; cr++){
    circle[cr].circlereset();
   }
   background(0);
 }
}

void displayDetails() {

  textChange();  
  fill(0);
  rect(0, 0, 199, height);

  fill(255, 0, 0);
  textFont(font, 30);
  text("Questionnaire result:", 5, 30);
  textFont(font, 20);
  text("Age: " + int(age[v]), 5, 80); 
  textFont(font, 25);
  text("Personal skills evaluation:", 5, 130);
  textFont(font, 20);
  text("Navigate through pages ", 5, 180);
  text("is a problem:"+navi, 5, 210);
  text("Disorientation feeling ", 5, 260);
  text("arised:"+diso, 5, 290);
}

void textChange() {

  if (nav[v] == 0.25) {
    navi = "Strongly Disagree";
  }
  if (nav[v] == 0.50) {
    navi = "Disagree";
  }
  if (nav[v] == 0.75) {
    navi = "Agree";
  }
  if (nav[v] == 1) {
    navi = "Strongly Agree";
  }
  if (dis[v]==0.25)
  {
    diso = "Strongly Disagree ";
  }
  if (dis[v]==0.50)
  {
    diso = "Disagree ";
  }
  if (dis[v]==0.75)
  {
    diso = " Agree";
  }
  if (dis[v]==1)
  {
    diso = "Strongly Agree";
  }
}



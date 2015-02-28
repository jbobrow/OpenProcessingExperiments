
PVector[] points;
PVector[] ramerfied_points;
float k;
float b;
int epsilon = 20;
boolean upkey;
boolean downkey;
boolean space;
PFont foont;
String instr1;
String instr2;

void setup(){
  size(800,600);
  frameRate(24);
  points = new PVector[20];
  randomize();
  
  instr1 = "Use SPACE to randomize points.";
  instr2 = "Use UP and DOWN to change epsilon.";
  foont = loadFont("BookAntiqua-14.vlw");
  textFont(foont,14);
  textAlign(LEFT);
}

void draw(){
  background(235);
  
  if(upkey){
    epsilon++;
  }
  if(downkey && epsilon > 1){
    epsilon--;
  }
  if(space){
    randomize();
    space = false;
  }
  for(int i = 1; i < points.length; i++){
    line(points[i-1].x,points[i-1].y,points[i].x,points[i].y);
    ellipse(points[i].x,points[i].y,2,2);
  }
  
  stroke(0);
  noFill();
  ramerfied_points = DouglasPeucker(points);
  stroke(50,55,0,200);
  fill(50,55,0,50);
  for(int i = 1; i < ramerfied_points.length; i++){
    line(ramerfied_points[i-1].x,ramerfied_points[i-1].y,ramerfied_points[i].x,ramerfied_points[i].y);
    ellipse(ramerfied_points[i].x,ramerfied_points[i].y,5,5);
  }
  text(instr1,400,30);
  text(instr2,400,45);
  text("Epsilon: " + epsilon,400,60);
  text("Number of Original Points: " + points.length, 400, 75);
  text("Number of Points After: "+ ramerfied_points.length, 400, 90);
}

PVector[] DouglasPeucker(PVector[] list){
  if(list.length < 3){
    return list;
  }
  setLineToCompareTo(list[0],list[list.length-1]);
  double dmax = 0;
  int index = 0;
  for(int i = 1; i < list.length-1; i++){
    double d = perpendicularDistance(list[i]);
    if(d > dmax){
      dmax = d;
      index = i;
    }
  }
  PVector[] a;
  if(dmax < epsilon){
    a = new PVector[2];
    a[0] = list[0];
    a[1] = list[list.length-1];
    return a;
  }else{
    a = new PVector[index+1];
    PVector[] b = new PVector[list.length-index];
    for(int i = 0; i < index+1; i++){
      a[i] = list[i];
    }
    for(int i = index; i < list.length; i++){
      b[i-index] = list[i];
    }
    a = DouglasPeucker(a);
    b = DouglasPeucker(b);
    PVector[] c = combinePointLists(a,b);
    return c;
  }
}

void randomize(){
  points = new PVector[20];
  int currx = width/20;
  int curry = height/20;
  for(int i = 0; i < points.length; i++){
    float xseed = abs(2*(width-currx)/(31-i));
    float yseed = abs(2*(height-curry)/(31-i));
    currx += int(random(5*xseed)-xseed);
    curry += int(random(5*yseed)-yseed);
    points[i] = (new PVector(currx,curry));
  }
}

PVector[] remove(PVector[] list, int index){
  PVector[] result = new PVector[list.length-1];
  for(int i = 0; i < index; i++){
    result[i] = list[i];
  }
  for(int i = index+1; i < list.length; i++){
    result[i-1] = list[i];
  }
  return result;
}

void setLineToCompareTo(PVector pointa, PVector pointb){
  k = (pointa.y-pointb.y)/(pointa.x-pointb.x);
  b = pointa.y-pointa.x*k;
  
  float errorbox_y = sqrt(pow(epsilon,2)/(pow(k,2)+1));
  float errorbox_x = -1 * k * errorbox_y;
  
  noStroke();
  fill(255,100,0,80);
  quad(pointa.x+errorbox_x,pointa.y+errorbox_y,pointb.x+errorbox_x,pointb.y+errorbox_y,pointb.x-errorbox_x,pointb.y-errorbox_y,pointa.x-errorbox_x,pointa.y-errorbox_y);
}
float perpendicularDistance(PVector point){
  float perpenb = point.y+point.x/k;
  float perpenx = ((perpenb-b)/(k+(1/k)));
  float perpeny = perpenx*k+b;
  return dist(point.x,point.y,perpenx,perpeny);
}
PVector[] combinePointLists(PVector[] a, PVector[] b){
  PVector[] sum = new PVector[a.length+b.length-1];
  for(int i = 0; i < a.length-1; i++){
    sum[i] = a[i];
  }
  for(int i = 0; i < b.length; i++){
    sum[i+a.length-1] = b[i];
  }
  return sum;
}

void keyPressed() {
  if (keyCode == UP) {
    upkey = true;
  }
  if (keyCode == DOWN) {
    downkey = true;
  }
  if (keyCode == ' ') {
    space = true;
  }
}


void keyReleased() {
  if (keyCode == UP) {
    upkey = false;
  }
  if (keyCode == DOWN) {
    downkey = false;
  }
  if (keyCode == ' ') {
    space = false;
  }
}




void setup() {
  size (500, 500);
  frameRate(1000);
  background(0, 0, 0);
}
/*int flake1= random(4,20);
 int flake2= random(4,20);
 int flake3= random(4,20);
 int flake4= random(4,20);
 int flake5= random(4,20);
 int flake6= random(4,20);
 
 float y = 10;
 float x = random(1, 500);
 int snowflake=500;
 
 
 
 void draw() {
 background(10, 7, 82);
 
 if(snowflake>0){
 stroke(255,255,255,100);
 
 line(x- flake1, y-flake2);
 line(x- flake3, y-flake4);
 line(x- flake5, y-flake6);
 line(x+ flake1, y+flake2);
 line(x+ flake3, y+flake4);
 line(x+ flake5, y+flake6);
 well that sucked. None of that code worked because of float/int conflict. I don't get it.
 neither one worked so I'll try another idea.*/







float weight= random(1, 4); //this will determine strokeWeight
int NumOfCubes=1200;
int NumOfEllipses= 1200;
int fin= 0;
int fin2=0;

void draw() {
  float r= random(255);
  float g= random(255);
  float b= random(255);
  float fade= random(255); //this creates random colors for the fills

  //float rectwide= random(15, 40);
  //float recthigh= random(15, 40);

  float x= random(10-40);
  if (NumOfCubes>2) {
    stroke(255, 255, 255, fade);
    strokeWeight(weight);
    noFill();
    rect(random(width), random(height), x, x);
    NumOfCubes--;
  }
  if (NumOfCubes<=2) {
    stroke(0, 0, 0, fade);
    strokeWeight(weight);
    ellipse(random(width), random(height), x, x);
    NumOfEllipses--;
  }
  if (NumOfEllipses<=2) {
    strokeWeight(.5);
    stroke(255,255,255);
    fill(r, g, b, 100);
    ellipse(random(height), random(width), 40, 40);
    fin++;
  }else{
  }
  if (fin>=2000 ) {
    stroke(0, 0, 0);
    strokeWeight(1);
    fill(0,0,0);
    ellipse(width/2,height/2,fin2, fin2);
    fin2++;
  }
}
/*else {
 stroke(255, 255, 255);
 fill(r,g,b);
 ellipse(height/2, width/2, fin, fin);
 fin++;*/


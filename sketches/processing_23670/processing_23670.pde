
float x, y;
int angle = 0;
int[][] points = new int[100][3];

int radius = 300;
int rand; int polys;

void setup(){
  size(800,800);
  background(50);
  smooth(); //noStroke();
  frameRate(10);
}

void draw(){
  noFill(); //fill(250,2);
  strokeWeight(.25); stroke(250, 10);
  
for(int i = 0; i < polys; i++);{
 pushMatrix(); 
 translate(random(0,width), random(0,height)); 
 radius = int(random(5, 400));
  for(int j = 0; j < 100; j++){
    drawPoly(int(random(3,10)));
  }
  popMatrix();
}

if(mousePressed){
stroke(250, 25);
  pushMatrix();
  translate(width/2, height/2);
  for(int i = 0; i < 100; i++){
    drawPoly(int(random(3,10)));
  }
  popMatrix();
}

}

void drawPoly(int s){
   getPoints(s);
   beginShape();
   for(int i = 0; i < s; i++){
      vertex(points[i][1], points[i][2]);
    }
  endShape();
}
  

void getPoints(int ps){
  //get points
  int sides = ps;
  int step = 360/sides;
  for(int i = 0; i < sides; i++){
   points[i][1] = int(cos(radians(angle)) * radius);  // x
   points[i][2] = int(sin(radians(angle)) * radius);  // y
   angle+=step;
   println(points[i][1] + "," + points[i][2]);
  }
}
  
void keyPressed(){
  if(key == '='){
    radius+=2;
  }
  /**
  if(key == '-'){
    background(50);
    radius = radius - 2;
  }
  
  if(key == '/'){
    sides = sides - 1;
    getPoints();
  }
  
  if(key == '*'){
    sides++;
    getPoints();
  }**/
}
  


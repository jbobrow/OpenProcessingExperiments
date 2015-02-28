
Circle[] circles;

float frame, sine, sineMap, websX, websY;
int radius = 300; int rand, polys;
int[][] points = new int[100][3];

void setup(){
  size(1000,500);
  smooth();
  if(frame %120 == 0) { background(255); }
  
  circles = new Circle[100];
  frameRate(60);
  
  for(int i = 0; i < circles.length; i++){
    circles[i] = new Circle(random(0,width), random(0,height), random(10,100), i);
  }
}

void draw(){
  sine=sin(radians(frame));
  sineMap=map(sine, 0, 1, 240, 255);
  //background(125);
  fill(255, 1); noStroke();
  rect(0, 0, width, height);
  
  //spiderwebs();
  
  stroke(0, 4); strokeWeight(random(.25,1));
  //translate(width/2, height/2);
  for(int i = 0; i < circles.length; i++){
    //circles[i].display(); 
    //circles[i].perlinMove(); 
    //circles[i].spiralMove(); 
    circles[i].move();
    circles[i].collision();
  }
  
  if(mousePressed){
  stroke(0, 3);
  for(int i = 0; i < circles.length; i++){
    circles[i].display(); 
    //circles[i].move(); circles[i].collision();
  }
  }
  
  if(keyPressed){
    for(int i = 0; i < circles.length; i++){
    circles[i].perlinMove(); circles[i].collision(); 
    //circles[i].move(); circles[i].collision();
  }
 }
 
 filter(BLUR, random(.3, 1));
 //interference();
 frame++;
}

void interference(){
  for(int i = 0; i < width; i+=5){
    fill(255,map(((mouseX+mouseY)/2), 0, ((width+height)/2), 1, 3)); noStroke();
    rect(i,0,random(35,100), height);
  }
}

void spiderwebs(){
  strokeWeight(.25);
  stroke(250, map(sine, 0, 1, 0, 25));
  
for(int i = 0; i < polys; i++);{
 pushMatrix(); 
 translate(random(0,width), random(0,height)); 
 radius = int(random(5, 400));
  for(int j = 0; j < 100; j++){
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
   points[i][1] = int(cos(radians(frame)) * radius);  // x
   points[i][2] = int(sin(radians(frame)) * radius);  // y
   frame+=step;
  }
}

class Circle {
  // fields
  float x, y, diam;
  float vx, vy, gravity, friction;
  float direction = 1; float pdirection = 1;
  float glow; float num = 1;
  float dx, dy;
  int objectID; float diam2;
  float increment = 0.01; float xoff = 0; float yoff = 100;
  
  float sine, cosine;
  float theta; float spiral;
  float polar = 75;
  
  float easing = .075;
  
  // constructor (inits fields)
  Circle(float xpos, float ypos, float dia, int id){
    x = xpos; y = ypos; diam = dia;
    x = xpos; y = ypos; diam = dia;
    diam2 = diam*diam;
    objectID = id;
    vx= xpos; vy = xpos;
    friction = -.6;
    gravity = .04; 
  }
  
  // methods
  void display(){
    glow = sin(radians(num));
    fill(255, 20); noStroke(); //stroke(0, 100);
    ellipse(x,y,diam,diam);
    num++;
  }
  
  void move(){
    if(x > width || y > height || x < 0 || y < 0){
      direction*=-1;
      //physics();
    }
    
    x+=sin(radians(theta)); y+= cos(radians(theta));
    x+=(direction*random(1,3)); y+=(direction*random(1,3));
    //x+=(direction*3); y+=(direction*2);
    theta+= .5;
  }
  
  void perlinMove(){
    x = (noise(xoff)*width)+random((width/2)*-1, width/2);
    y = noise(yoff)*height+random((height/2)*-1, height/2);
    xoff += increment; yoff += increment;
  }
    
  
  void spiralMove(){
    if(x > width || y > height || x < 0 || y < 0){
      //polar = 75;
      //physics();
    }
    
    x = (polar * cos(spiral));
    y = (polar * sin(spiral));
    x += random(-25,25);
    y += random(-25, 25);
    spiral++; polar++;
  }
  
  void collision(){
    for(int i = 0; i < circles.length; i++){
      if(i != objectID){
        intersect(this, circles[i]);
        if(dist(x, y, circles[i].x, circles[i].y) < (diam/2)+(circles[i].diam/2)){
          direction*=-1;
        }
      }
    }
        /*
        stroke(105, 0, 0, 5);
        strokeWeight(1);
        int circ = (int)random(0,circles.length);
        line(x, y, circles[circ].x, circles[circ].y);
        */
  }
  
  void moveTo(){
    dx = mouseX - x;
    dy = mouseY - y;
    
    x = x + dx*easing;
    y = y + dy*easing;
  }
  
    void physics(){
    vy += gravity;
    x =+ vx;
    y += vy;
    
    if(y > height){
      y = height;
      vy*=friction;
    }
    
    if(x > width){
      x = width;
      vx*=friction;
  }
  vx++;
 }
}

/** FROM CASEY REAS, SOFTWARE STRUCTURES **/
void intersect( Circle cA, Circle cB ) 
{ 
  float dx = cA.x - cB.x; 
  float dy = cA.y - cB.y; 
  float d2 = dx*dx + dy*dy; 
  float d = sqrt( d2 ); 
 
  if ( d>cA.diam+cB.diam || d<abs(cA.diam-cB.diam) ) { 
    return; // no solution 
  } 
  
  float a = (cA.diam2 - cB.diam2 + d2) / (2*d); 
  float h = sqrt( cA.diam2 - a*a ); 
  float x2 = cA.x + a*(cB.x - cA.x)/d; 
  float y2 = cA.y + a*(cB.y - cA.y)/d; 
 
  float paX = x2 + h*(cB.y - cA.y)/d; 
  float paY = y2 - h*(cB.x - cA.x)/d; 
  float pbX = x2 - h*(cB.y - cA.y)/d; 
  float pbY = y2 + h*(cB.x - cA.x)/d; 
 
  if(random(1,4) > 1.5){
  stroke(0,1); 
  }
  else{ stroke(255,2); }
  line(paX, paY, pbX, pbY); 
  
  fill(255, 1);
  ellipse(paX, paY, dist(paX, paY, pbX, pbY), dist(paX, paY, pbX, pbY));
  
} 



PVector[] location;
PVector[][] previousLocation;
PVector[] velocity;
int[] hold;
color[] colour;
int count = 2000;
float gravity = 0.3;
float amplitude = 12;
float dispersal = 2;
float rotationSpeed = PI/700;
float rotation = 0;
float tilt = -PI/3;
float discRad = 512;
int tailLength = 32;
void setup(){
  size(400,300,P3D);
  discRad = width*0.8;
  amplitude = sqrt(height/8);
  location = new PVector[count];
  previousLocation = new PVector[count][];
  velocity = new PVector[count];
  hold = new int[count];
  colour = new color[count];
  for(int i=0;i<count;i++){
    reset(i);
    location[i].y = random(-64,0);
  }
}
void reset(int i){
  float rad = sqrt(random(0,1))*discRad;
  float angle = random(0,TWO_PI);
  float V1 = sqrt(random(0,1))*dispersal;
  float V2 = random(0.2,1)*-amplitude;
  float direction = random(0,TWO_PI);
  colour[i] = color(random(192,255),
  127+128*cos(PI/(width/4)*rad-PI/60*frameCount+angle),0);
  location[i] = new PVector(
  rad*cos(angle),0,rad*sin(angle));
  previousLocation[i] = new PVector[tailLength];
  for(int j=0;j<tailLength;j++){
    previousLocation[i][j] = location[i].get();
  }
  velocity[i] = new PVector(
  V1*cos(direction),V2,V1*sin(direction));
}
void update(int i){
  velocity[i].y += gravity;
  for(int j=tailLength-1;j>0;j--){
    previousLocation[i][j] = 
    previousLocation[i][j-1].get();
  }
  previousLocation[i][0] = location[i].get();
  if(location[i].y>0){
    if(hold[i]<tailLength){
      hold[i]++;
    }else{
      hold[i]=0;
      reset(i);
    }
  }else{
    location[i].add(velocity[i]);
  }
  for(int j=tailLength-1;j>=0;j--){
    vertex(
    previousLocation[i][j].x,
    previousLocation[i][j].y,
    previousLocation[i][j].z);
  }
  vertex(
  location[i].x,
  location[i].y,
  location[i].z);
}
void draw(){
  if(frameCount%60==0){println(frameRate);}
  rotation += (mouseX-width/2)/width*rotationSpeed;
  rotation = rotation%TWO_PI;
  background(256,128,0);
//  noStroke();
//  fill(0,16);
//  rect(0,0,width,height);
  translate(width/2,height/8,-width/4);
  rotateX(tilt);
  rotateY(frameCount*rotationSpeed);
  noFill();
//  smooth();
  for(int i=0;i<count;i++){
    stroke(colour[i]);
    beginShape();
    update(i);
    endShape();
  }
}


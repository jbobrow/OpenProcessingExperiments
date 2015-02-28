

PVector Pos;

int numAst =10;
int bullCount = 10;
int state = 2;

int currshot =1;
int earth = 100;
int cannon = 0;
int score =0;
int timer = 0;

PVector Rocks[] = new PVector[numAst];
PVector Bulls[] = new PVector[bullCount];

float rot;
float rto;

float fallSpeed = 1.5;

float speedx[] = new float[bullCount];
float speedy[] = new float[bullCount];

//Boolean isFire[] = new Boolean[bullCount];
Boolean Fire = true;

void setup() {
  size(520,805);
  Pos = new PVector(250,800);

  for (int num=0; num < numAst; num ++) {
    Rocks[num] = new PVector(random(0,500), -100 *num);
  }
  for(int num =0; num<bullCount; num++) {
    Bulls[num] = new PVector(250,800);
    speedx[num] = 10*cos(rot);
    speedy[num] = 10*sin(rot);
    //  isFire[num] = true;
  }
  //of course there is the optional smooth function
 // smooth();
}


void draw() {
  background(0);
  pushMatrix();
  translate(20,5);
    
  fill(0,200,200);
  ellipse(250,800,800,250);
  fill(0,100,0);
  ellipse(250,800,800,100);

  fill(255);

  if(mouseX <= Pos.x +20) rto = 180;
  else rto = 0;

  rot = atan( (Pos.y-mouseY +5)/(Pos.x-mouseX +20) ) +radians(rto);

  if(Fire==false) timer++;
  else timer=0;
  if(timer >=15){
  Fire =true;
  timer =0;
  }

  missle(Rocks);
  switch(state) {

    case(0):
    astroid(Bulls);
    text("The score is " + score, 0,10);
    rect(380-20,0,120,40);
    fill(0);
    rect(390-20,5, 110,30);
    fill(255);
    rect(495-earth-20,10,earth,20);
    if(earth <=0 || cannon >=5) state = 1;
    fallSpeed += 0.001;
    break;
    
    case(1):
    text("The final score is " + score, 0,10);
    //  game over text and a scale to make it bigger, simple
    scale(5);
    text("GAME OVER", 12,50,100,200);
    // this second scale is to prevent everything else from getting bigger
    scale(0.2);
    text("Press spacebar to restart",180,500);
    if(keyPressed) state=2;
    break;
    
    case(2):
    earth = 100;
    cannon = 0;
    score =0;
    timer = 0;
    fallSpeed = 1.5;
    for (int num=0; num < numAst; num ++) {
    Rocks[num].set(random(0,500), -100 *num,0);
  }
    text("Click to start", 180,400);
    text("Shoot the squares",180,500);
    if(mousePressed) state =0;
    break;
  }
  
  translate(250,800);
  rotate(rot + radians(90));
  rect(-10,-40,20,50);
  ellipse(0,0, 40,40);
  popMatrix();
  
  fill(0);
  rect(0,0,20,height);
  rect(0,0,width,3);
  rect(width-20,0,20,height);
  rect(0,height-5,width,5);
}



void astroid(PVector[] bul) {
  for(int x=0; x < numAst; x++) {
    pushMatrix();
    Rocks[x].y += fallSpeed;

    if(Rocks[x].y > height +40) earth-=5;
  
    if(Rocks[x].dist(Pos) <=30) cannon +=1;
    
    for( int b =0; b< bullCount; b++) {
      if(Rocks[x].dist(Bulls[b]) <= 30) score +=10;
      if(Rocks[x].y > height +40 || Rocks[x].dist(Bulls[b]) <= 30) {
        Rocks[x].y = -200;
        Rocks[x].x = random(20, 480);
        Bulls[b].x = 250;
        Bulls[b].y = 800;
        Fire=true;
      }
    
      //   line(Rocks[x].x, Rocks[x].y, Bulls[b].x, Bulls[b].y);
    }
    translate(Rocks[x].x,Rocks[x].y);
    rotate(Rocks[x].y *0.01 * (Rocks[x].x -250)/100);
    rect(-20, -20, 40,40);
    popMatrix();
  }
}


void missle(PVector[] bos) {

  if((mousePressed && Fire ==true)) {
    Bulls[currshot].x += speedx[currshot];
    Bulls[currshot].y += speedy[currshot];
    Fire =false;
    currshot +=1;
  }

  for(int shoo =0; shoo < bullCount; shoo++) {
    if(currshot >= bullCount) currshot = 1;

    if(Bulls[shoo].dist(Pos) == 0) {
      speedx[shoo] = 10*cos(rot);
      speedy[shoo] = 10*sin(rot);
    } 

    if(Bulls[shoo].dist(Pos) > 0) {
      Bulls[shoo].x += speedx[shoo];
      Bulls[shoo].y += speedy[shoo];
    }
    if(Bulls[shoo].x > 520 || Bulls[shoo].x < -20 || Bulls[shoo].y < -20) {
      Bulls[shoo].x = 250;
      Bulls[shoo].y = 800;
    }
    ellipse(Bulls[shoo].x, Bulls[shoo].y, 20,20);
  }
}

void mouseReleased() {
  Fire=true;
}




/*LonelyTank
  by Shaocong
  
  INSTRUCTION:
  Press W,S to go forward or backward(going forward will be faster)
  Press A,D to change heading
  Press LEFT, RIGHT arrow to rotate the cannon
  Press DOWN arrow to fire
  
  avoid being crashed by enemies
  radar shows the direction and distances of the enemies
  
  get more scores if kill an enemy tank from far away
  get more scores if kill an faster enemy
*/

PVector pos,posB,PposB;
float angleBody, angleTower,angleFire,Dmove, EangleBoCh,EangleToCh;
boolean Firing;
boolean Suvive=true;
int score;

int Enum=20;  //number of enemies
int DEnum;    //dead enemies

PVector[] Epos= new PVector[Enum];  //enemies' postions

float[] angleME =new float[Enum];   //enemies' direction
float[] distME =new float[Enum];    //enemies' distances 

float[] EangleBody =new float[Enum];  //enemies' body direction
float[] EangleTower =new float[Enum]; //enemies' tower direction
float[]Espeed =new float[Enum];
boolean[] suvive= new boolean[Enum];

String win;
char[] letters;

void setup() {
  size(900,500);
  noCursor();
  smooth();

  PFont font;
  font = loadFont("Arial-BoldMT-12.vlw");
  textFont(font);
  textAlign(LEFT);

// starting status of player
  pos = new PVector(width/2,height/2);
  posB = new PVector(width/2,height/2);
  PposB = new PVector(width/2,height/2);

//starting status of enemies
  for (int i=0; i<Enum; i++) {
    Epos[i] =new PVector(random(width),random(height));
    if (PVector.dist(Epos[i], pos)<100) Epos[i].add(Epos[i]);
    EangleBody[i] = random(PI);
    EangleTower[i]= random(1);
    Espeed[i]=random(0.5,1.2);
    suvive[i] =true;
  }
}


//player's movement of tank body and tower
void Move() {
  if (keyPressed) {
    if (key == 'a' || key == 'A') angleBody -=0.015;
    if (key == 'd' || key == 'D') angleBody +=0.015;
    if (key == 'w' || key == 'W') {
      Dmove=-0.8;
      pos.x+= Dmove*cos(angleBody+PI/2);  
      pos.y+= Dmove*sin(angleBody+PI/2); 
    }
    if (key == 's' || key == 'S'){
      Dmove=0.4;
      pos.x+= Dmove*cos(angleBody+PI/2);  
      pos.y+= Dmove*sin(angleBody+PI/2); 
    }

    if (pos.x>width) pos.x=width;
    if (pos.x<0) pos.x=0;
    if (pos.y>height) pos.y=height;
    if (pos.y<0) pos.y=0;

    switch (keyCode) {
    case LEFT:
      angleTower-=0.03;
      break;
    case RIGHT:
      angleTower+=0.03;
      break;

//player fire
    case DOWN:
      if (Firing==false) {
        angleFire=angleBody+angleTower;
        posB.x = pos.x+30*sin(angleFire);
        posB.y = pos.y-30*cos(angleFire);
        PposB.x=posB.x;
        PposB.y=posB.y;
        Firing =true;
        break;
      }
    }
    angleTower =constrain(angleTower,-1.2,1.2);
  }

}


//draw player's tank
void DrawTank() {
  pushMatrix();
  translate(pos.x,pos.y);
  rotate(angleBody);
  color coBody = color(0,0,0,80);
  noStroke();
  fill(coBody);
  rect(-15,-15,30,40);
  
  //winning text
  if (DEnum==Enum) {
    fill(0,0,0,40);
    win = "         CONGRATULATIONS, YOU WIN, YOUR SCORE IS "+score;
    letters= win.toCharArray();
    for (int i=0; i<letters.length;i++) {
      pushMatrix();
      rotate(2*i*PI/letters.length+1.35*PI);
      translate(100,0);
      rotate(PI/2);
      textAlign(CENTER);
      text(letters[i], 0,0);
      popMatrix();
    }
  }
  pushMatrix();
  rotate(angleTower);
  ellipse(0,0,20,20);
  rect(-1,-10,2,-20);
  popMatrix();
  stroke(0,50);
  noFill();
  
  //draw aimming circle
  if (DEnum != Enum) {
    ellipse(0,0,300,300);
    ellipse(150*cos(angleTower-PI/2),150*sin(angleTower-PI/2),7,7);
  }
  popMatrix();
}

//draw bullet
void DrawB() {
  if (Firing) {
    posB.x += 3*cos(angleFire-PI/2);
    posB.y += 3*sin(angleFire-PI/2);
    fill(0);
    ellipse(posB.x,posB.y,2,2);
    if (PVector.dist(PposB, posB)>300) Firing=false;

  }
} 


//radar
void ShowE() {

  pushMatrix();
  translate(pos.x,pos.y);
  for (int i=0; i<Enum; i++) {
    if (suvive[i]) {
      angleME[i] = atan2((Epos[i].y-pos.y),(Epos[i].x-pos.x));
      distME[i] = dist(pos.x,pos.y,Epos[i].x,Epos[i].y);
      pushMatrix();
      rotate(angleME[i]);
      translate(160,0);
      fill(0,0,0,70);
      text(distME[i],0,0);
      popMatrix();
    }
  }
  popMatrix();

}

//enemies' movements and draw them
void Enemy() {
  for (int i=0; i<Enum;i++) {
    if (suvive[i]) {
      EangleBoCh =random(-0.02,0.02);
      EangleToCh =random(-0.03,0.03);
      pushMatrix();
      translate(Epos[i].x,Epos[i].y);
      rotate(EangleBody[i]);
      noStroke();
      fill(0,0,0,50);
      rect(-15,-15,30,40);
      pushMatrix();
      rotate(EangleTower[i]);
      ellipse(0,0,20,20);
      rect(-1,-10,2,-20);
      popMatrix();
      popMatrix();
      EangleBody[i] +=EangleBoCh;
      EangleTower[i] +=EangleToCh;
      Epos[i].x +=Espeed[i]*cos(EangleBody[i]-PI/2);
      Epos[i].y +=Espeed[i]*sin(EangleBody[i]-PI/2);

// boundry
      if (Epos[i].x>width+50) Epos[i].x=-50;
      if (Epos[i].x<-50) Epos[i].x= width+50;
      if (Epos[i].y>height+50) Epos[i].y =-50;
      if (Epos[i].y<-50) Epos[i].y =height+50;

//avoiding each other
      for (int g=i+1;g<Enum;g++) {
        if (suvive[i] && suvive[g] && dist(Epos[i].x,Epos[i].y,Epos[g].x,Epos[g].y)<60) {
          EangleBody[i] +=0.03; 
          Epos[i].x -=Espeed[i]*cos(EangleBody[i]-PI/2);
          Epos[i].y -=Espeed[i]*sin(EangleBody[i]-PI/2);
        }
      }

//enemy be hit
      if (Firing==true && dist(Epos[i].x,Epos[i].y,posB.x,posB.y)<20) {
        suvive[i]=false;
        Firing =false;
        DEnum++;
        score += 10*Espeed[i]*dist(PposB.x,PposB.y,Epos[i].x,Epos[i].y);
      }  
      if (dist(Epos[i].x,Epos[i].y,pos.x,pos.y)<30) Suvive=false;
    } 
    else {
      //draw a broken tank
      pushMatrix();
      translate(Epos[i].x,Epos[i].y);
      rotate(EangleBody[i]);
      noStroke();
      fill(0,0,0,50);
      rect(-15,-15,30,40);
      pushMatrix();
      rotate(EangleTower[i]);
      ellipse(2,3,18,20);
      rect(-1,-7,2,-10);
      popMatrix();
      popMatrix();
    }
  }
}

//draw a broken tank for the player if be crashed
void death() {
  pushMatrix();
  translate(pos.x,pos.y);
  rotate(angleBody);
  noStroke();
  fill(0,0,0,50);
  rect(-15,-15,30,40);
  textAlign(CENTER);
  text("GAME OVER", 0,-20);
  pushMatrix();
  rotate(angleTower);
  ellipse(2,3,18,20);
  rect(-1,-7,2,-10);
  popMatrix();
  popMatrix();

}



void draw() {
  background(255);
  if (Suvive) {
    Move();
    DrawTank();
    DrawB();
    ShowE();
  }
  else {
    death();
  }
  Enemy();
  textAlign(LEFT);
  text(score, 10,20);
  /* 
   if (keyPressed && (keyCode == ENTER || keyCode == RETURN)) {
   pos = new PVector(width/2,height/2);
   posB = new PVector(width/2,height/2);
   PposB = new PVector(width/2,height/2);
   Suvive=true;
   for (int i=0; i<Enum; i++) {
   Epos[i] =new PVector(random(width),random(height));
   if (PVector.dist(Epos[i], pos)<100) Epos[i].add(Epos[i]);
   EangleBody[i] = random(PI);
   EangleTower[i]= random(1);
   Espeed[i]=random(1,2);
   suvive[i] =true;
   }
   }
   */
}















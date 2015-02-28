

Walker[] wkrs = new Walker[10]; 

void setup() {
  size(600, 600);
 
  for (int i=0; i<wkrs.length;i++) {
    wkrs[i] = new Walker(8,0);
  }
}

void draw() {
  background(0);

  for (int i=0; i<wkrs.length;i++) {
    wkrs[i].run();
  }
}

class Walker {
  
  int mida, Pas;
  float myX, myY;

  
  Walker (int _st, int PI) {
    Pas = _st;
    mida = PI;
    myX = width/2;
    myY = height/2;
  }

  
  void run() {
    updatePosition();
    drawMe();
  }

  void updatePosition() {
   
    float randX = random(100);
    float randY = random(100);
    
    if (randX >= 50) {
      
      myX += Pas;
    } 
    else {
      myX -= Pas;
    }
    
    if (randY >= 50) {
      myY += Pas;
    } 
    else {
      myY -= Pas;
    }

    myX = constrain(myX,0, width);
    myY = constrain(myY,0, height);
  }

  void drawMe() {
  
    noStroke();
    fill(255, 0, 64);
  
  fill(myX,myY,120);
  ellipse(myX,myY-2,155,155);//cap
  
  strokeWeight(2);
  fill(255,17,85);
  ellipse(myX,myY,50,50);//cap
  
  ellipse(myX+30,myY-20,22,22);//orelles
  ellipse(myX-30,myY-20,22,22);
  
  strokeWeight(1);
  fill(255);
  ellipse(myX-6,myY-5,10,20);//ulls
  ellipse(myX+6,myY-5,10,20);//ulls
  strokeWeight(2);
  fill(0);
  ellipse(myX-7,myY-1,2,4);//ulls
  ellipse(myX+5,myY-1,2,4);//ulls
  
  
  fill(0);
  ellipse(myX,myY+10,10,5);//nas
  
  
  fill(255);
  strokeWeight(2);
  arc(myX,myY+30, 30, 30,0,mida);
}
  
  }
  
void mousePressed() {
  
 for(int i = 0; i<wkrs.length; i++){
   random(2,10);
   random(2,10);
  }
}

//void mousePressed(){  
                     
// myX=myX+velX;
// myY=myY+velY;
  
// if((myX<80)||(myX>width-80)){
// velX = -velX;
//  } 
 
// if((myY<70)||(myY>height-60)){
// velY = -velY;
//  } 

//}
 


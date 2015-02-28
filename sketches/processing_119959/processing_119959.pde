
int x,y;
int[] xx=new int[100];
int[] yy=new int[100];

void setup() {
  size(600, 600);
}


void draw(){
  background(255,75,81);
  if (mousePressed){
    background(19,20,70);
    pushMatrix();
    //star
    noStroke();
    fill(255,255,255);
    ellipse(60,180,10,10);
    ellipse(150,90,10,10);
    ellipse(270,150,10,10);
    ellipse(258,228,10,10);
    ellipse(378,318,10,10);
    ellipse(450,402,10,10);
    ellipse(540,432,10,10);
    
    popMatrix();
  }
  
  for(int i=99; i>0; i--){
    xx[i] = xx[i-1];
    yy[i] = yy[i-1];
  }
  
  xx[0] = mouseX ;
  yy[0] = mouseY ;
  
  for(int i=90; i>=0; i=i-5){
    chara(xx[i],yy[i]);
  }
}

 
void chara(int a,int b){
  
 pushMatrix() ; 
  translate(a-50,b-50);

 // face
  noStroke();
  //stroke(255, 112, 3);
  fill(a, 112, b);
  ellipse(49.9, 35, 99, 57);

  // body
  noStroke();
  triangle(40, 58, 62, 58, 50, 100+b);
  

  //nose
  stroke(106, 47, 17);
  fill(106, 47, 17);
  ellipse(70, 35, 15, 7);

  //eyes
  ellipse(57, 25,3, 8);
  ellipse(82, 25,3,8);
popMatrix() ;
}




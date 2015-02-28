
//import processing.opengl.*;

float h,s,b;
int i,j,k;
int MAX = 30;

float [] posActualX = new float [MAX];
float [] posActualY = new float [MAX];
float [] velActualX = new float [MAX];
float [] velActualY = new float [MAX];

float tamanho1,tamanho2,transparencia1,transparencia2;



void setup() { 
 // size(600,600,OPENGL); 
 size(600,600,P3D); 
  background(0,20);
  colorMode(HSB,100);
  //smooth();
  frameRate(5);
  noFill();
  for(int i=0; i<MAX; i++){ 
    posActualX[i]=random(MAX); 
    posActualY[i]=random(MAX); 
    velActualX[i]=random (-1,1)*0.0001; 
    velActualY[i]=random (-1,1)*0.0001; 
  }
  //posActualX=width/2;
  //posActualY=height/2;

}

void draw(){
  //background(0,20);
  translate(random(width),random(height)); 
  //translate(width/2,height/2);
  h = random(255);  
  s = random(255); 
  b = random(255); 

  //delay(10);
  //posActualX[0]=width/2;
  //posActualY[0]=height/2;


  //posActualX=posActualX + random(10);
  //posActualY=posActualY + random(5);
  //for(j=0;j<80;j++){
    pushMatrix();
    //translate(mouseX,mouseY);
    particula();
    popMatrix();
  //}
}





void particula(){
  //posActualX[0]=width/2;
  //posActualY[0]=height/2;
  //background(0,20);

  for(int i=0; i<MAX; i++){ 
    posActualX[i]=posActualX[i]+velActualX[i]; // 
    posActualY[i]=posActualY[i]+velActualY[i]; // 
    //posActualX[] = posActualX[] - random(10);
    //posActualY[] = posActualY[] - random(5);
    tamanho1=random(25);
    tamanho2=random(random(40));
    transparencia1=random(tamanho1);
    transparencia2=random(tamanho2);
    for(i=0;i<MAX;i++){
      strokeWeight(2);
      stroke(h,s,b,transparencia1);
      fill(h,s,b,transparencia2);
      //for (int k = 0;k<30;k++) { 
      //rotate(PI/4);  
      pushMatrix();
      rotate (radians (10));
      ellipse(posActualX[i],posActualY[i],tamanho1,tamanho2);
      popMatrix();  
    //}
    }
  }
  //saveFrame();
}











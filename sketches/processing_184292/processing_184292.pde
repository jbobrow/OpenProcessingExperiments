

// variables generals
float mida = 15;
int numBoles = 100;
color c1;
color c2;
color c3;
color c4= color(127,127,127);

int aigua = 40;


//creacio matrius:
float[] pX = new float[numBoles];
float[] pY = new float[numBoles];
float[] vX = new float[numBoles];
float[] vY = new float[numBoles];


void setup(){
  size(600,400);
  noSmooth();
  noCursor();
  background(0);
  
  
  //inici
  for(int i = 0; i<numBoles; i++){
    pX[i] = width/2;
    pY[i] = height/2;
    
    vX[i] = 5;
    vY[i] = 5;
  }
}

void draw(){
  
  strokeWeight(2);
  
  //rectangle difuminador 
  fill(0,5);
  rect(0,0,width,height);

  fill(255);

//linies mouse "aigua"
  for (int i=0; i<=600; i=i+10){
  stroke(8,50,200,30);
  line(mouseX,mouseY,width,i);
  line(mouseX,mouseY,i,0);
  line(mouseX,mouseY,0,i);
  line(mouseX,mouseY,i,height);
  //aigua centre
  fill(8,50,200,90);
  ellipse(mouseX,mouseY,aigua,aigua);
  
}


  //inici bucle
  for(int i = 0; i<numBoles; i++){
    
    //actualitzacio posicions
    
    pX[i] = pX[i]+random(-vX[i],vX[i]);
    pY[i] = pY[i]+random(-vY[i],vY[i]);
    
    //pX[i] += vX[i];
   // pY[i] += vY[i];

   
  
   //elipses
   
    noFill();
    
     // fum
    stroke(c4,30);
    ellipse(pX[i]+mida/2,pY[i]+mida/2,mida*2,mida*2); 
      
      //foc 
    stroke(c1,20);
    ellipse(pX[i],pY[i],mida,mida);
    
    stroke(c2,20);
    ellipse(pX[i]+mida,pY[i],mida,mida);
    
    stroke(c3,20);
    ellipse(pX[i]+mida/2,pY[i]+mida,mida,mida);
    
   

    //Rebot ????????????
     //limitsx
    if((pX[i]<0)||(pX[i]>width-mida/2)){
      vX[i] = -vX[i];
    } 
    //limitsy
    if(pY[i]<0){
      vY[i] = -vY[i];
    }
    if(pY[i]>height-mida/2){
      vY[i] = -vY[i];
    } 
  
  }
  
  
 }
    // canvi tamany i tons del foc
    
    void mousePressed(){
      mida=random(2,50);
      
     for(int i = 0; i<numBoles; i++){
       
        c1 = color(random(170,232), random(140,195), random(0,15));
        c2 = color(random(170,232), random(0,15), random(0,15));
        c3 = color(random(130,211), random(50,88), random(0,26));
        
    
    //actualitzacio posicions
    
    pX[i] = mouseX;
    pY[i] = mouseY;
    
  }
    } 

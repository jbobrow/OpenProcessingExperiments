
int figures= 30;
//posicions
float[]posX= new float [figures];
float[]posY= new float [figures];
float[]pX= new float [figures];
float[]pY= new float [figures]; 

//velocitats
float[] velX= new float [figures];
float[] velY= new float [figures];
float[] vX= new float [figures];
float[] vY=new float [figures];

float mides= 20;
float dosmides= 20;
float e1=25; 
boolean cosa=true;
int[] posicions= { 10,20,30,40,50,60};

//dibuix de fons
float[]coses= new float [200];

void setup() {
  size(600, 600);
  for(int i=0; i<figures; i++) {
  
  posX[i]= random(width);
  posY[i]= random(height);
  pX[i]= random(width);
  pY[i]= random(height);
  velX[i]=random(-29,29);
  velY[i]=random(-29,29);
  vX[i]= random(-25,25);
  vY[i]=random(-25,25);
  mides=20;
  dosmides=20;
  e1=25;
  cosa=true;
    }
}
void draw() {
   background((width/2)+230, (height/2)+100, 150);
   background(0);
  // Dibuix de fons
  colorMode (RGB,400);
  strokeWeight(2);
  
  for (int i=0; i<700; i= i+9) {
    
    stroke(185,179,203);
    //stroke((width/2)+230, (height/2)+100, 150);
    line(500,500, 0,i);
    
    stroke(88,58,173);
    line(500,500,i,700);
    
    stroke(85, 61, 152);
    line(500,500, i,0);
    
    stroke(82, 75, 98);
    line(500,500,694,i);
    
  }
    
  //diametres  
  e1=25;
  mides= 20;
  dosmides=20;
  rectMode(CENTER);
  
  
 for (int i=0; i<15; i++) {
   // posicions
    posX[i]= posX[i]+velX[i];
    posY[i]=posY[i]+velY[i];
    
    //comprovacio posicio

//LIMITS HORITZONTALS
  if((posX[i]+35)+ (e1/2)>=width){
      velX[i]=-velX[i];
      posX[i]=width-(35+(e1/2));      
}

  if((posX[i]-35)-e1/2<=0){
      velX[i]=-velX[i];
      posX[i]=+35+e1/2;      
}


//LIMITS VERTICALS

  if(((posY[i]-50)-(mides/2))<=0){
      velY[i]=-velY[i];
      posY[i]=50+(mides/2);      
}

  if(((posY[i]+50)+(dosmides/2))>=height){
      velY[i]=-velY[i];
      posY[i]=height-(50+(dosmides/2));      
}
        
   //Verticals
    
  fill(posX[i]+100, posY[i]-50, -35);
  stroke(posX[i]-100, posY[i]+50, 35);
  
  line(posX[i], posY[i], posX[i], posY[i]+50);
  ellipse(posX[i], posY[i]+50, mides, mides);

  line(posX[i], posY[i], posX[i], posY[i]-50);
  ellipse(posX[i], posY[i]-50, dosmides, dosmides);
 
 
   //Colors variant
  fill(posX[i]+50, posY[i]-100, 35);
  stroke(posX[i]-100, posY[i]+50, 35);

////////////////////////////////////////////////////////////////////////
  //Dibuix   

  strokeWeight(3);
  line(posX[i], posY[i], posX[i]+35, posY[i]-30);
  line(posX[i], posY[i], posX[i]-35, posY[i]-30);
  line(posX[i], posY[i], posX[i]-35, posY[i]+30);
  line(posX[i], posY[i], posX[i]+35, posY[i]+30);

  //Colors variant
//elipses diagonals
  fill(posX[i]+50, posY[i]-100, 35);
  stroke(posX[i]-100, posY[i]+50, 35);
  strokeWeight(8);

  ellipse(posX[i]+35, posY[i]-30, e1, e1);
  ellipse(posX[i]-35, posY[i]-30, e1, e1);
  ellipse(posX[i]-35, posY[i]+30, e1, e1);
  ellipse(posX[i]+35, posY[i]+30, e1, e1);
  
  //Colors variant
  fill(random(50), posY[i]-100, 35);
  stroke(posX[i]-100, posY[i]+50, 35);
  strokeWeight(8);
  //frameRate(50);

 
 
 ////////////////////////////////////////////////////////////////////////
 if(cosa==true) {
  rect(posX[i], posY[i], random(-30,+40), (40)); 
  }
  else {
   
  fill(posX[i]+50, posY[i]-100, 35);
  ellipse(posX[i], posY[i], random(30,60), (60)); 
  }
  }
}
  

void mousePressed(){
 cosa = !cosa;
  for(int i=0; i<figures; i++) {
    posX[i]= mouseX+10;
    posY[i]=mouseY+10;
 velX= vX;
 velY=vY;


}
}
  
      





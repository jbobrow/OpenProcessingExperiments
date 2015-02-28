
float posX, posY, velX, velY;
float mides= 20;
float dosmides= 20;
float e1=25; 
boolean cosa=true;


void setup() {
  size(600, 400);
  posX= random(width);
  posY= random(height);
  velX=random(3,4);
  velY=random(3,4);
  mides=20;
  dosmides=20;
  e1=25;
  
}

void draw() {

  background(posX+230, posY+100, 150);
  
  // posicions
    posX= posX+velX;
  posY=posY+velY;
  
  //diametres  
  e1=25;
  mides= 20;
  dosmides=20;
  rectMode(CENTER);
 
 
   //Verticals
  
  fill(posX+100, posY-50, -35);;
  stroke(posX-100, posY+50, 35);
  
  line(posX, posY, posX, posY+50);
  ellipse(posX, posY+50, mides, mides);

  line(posX, posY, posX, posY-50);
  ellipse(posX, posY-50, dosmides, dosmides);
 
 
 
 
  //Colors variant
  fill(posX+50, posY-100, 35);
  stroke(posX-100, posY+50, 35);

////////////////////////////////////////////////////////////////////////
  //Dibuix   

  strokeWeight(3);
  line(posX, posY, posX+35, posY-30);
  line(posX, posY, posX-35, posY-30);
  line(posX, posY, posX-35, posY+30);
  line(posX, posY, posX+35, posY+30);




  //Colors variant
//elipses diagonals
  fill(posX+50, posY-100, 35);
  stroke(posX-100, posY+50, 35);
  strokeWeight(8);

  ellipse(posX+35, posY-30, e1, e1);
  ellipse(posX-35, posY-30, e1, e1);
  ellipse(posX-35, posY+30, e1, e1);
  ellipse(posX+35, posY+30, e1, e1);
  

  //Colors variant
  fill(random(50), posY-100, 35);
  stroke(posX-100, posY+50, 35);
  strokeWeight(8);
  frameRate(50);


////////////////////////////////////////////////////////////////////////


//comprovacio posicio

//LIMITS HORITZONTALS
  if((posX+35)+e1/2>=width){
      velX=-velX;
      posX=width-(35+(e1/2));      
}

  if((posX-35)-e1/2<=0){
      velX=-velX;
      posX=+35+e1/2;      
}



//LIMITS VERTICALS

  if(((posY-50)-(mides/2))<=0){
      velY=-velY;
      posY=50+(mides/2);      
}

  if(((posY+50)+(dosmides/2))>=height){
      velY=-velY;
      posY=height-(50+(dosmides/2));      
}

  if(cosa==true) {
  rect(posX, posY, 40, 40); 
  }
  else {
  frameRate(50);  
  fill(posX+50, posY-100, 35);
  ellipse(posX, posY, 40, 40); 
  }
    
  
}


void mousePressed(){
 
 velX= random(-8,8);
 velY=random(-8,8);
 posX=mouseX;
 posY=mouseY;
 cosa = !cosa; 
      
    
 }  





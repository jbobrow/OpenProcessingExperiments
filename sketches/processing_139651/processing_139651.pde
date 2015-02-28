
//christina weisensel
//sketch

// declare global variables
int earbigSize;
int inearbigSize;
int earsmallSize;
int inearsmallSize;
int blackeyeSize;
int noseSize;
int whiteeyeColor;
int noseoneColor;
int nosetwoColor;
int nosethreeColor;
boolean clicked=false;

// runs once
void setup(){
 size(300,300);
 background(24,187,199);
 noStroke();
}

void keyPressed(){
  clicked=! clicked;
}
 
// runs forever
void draw(){
   background(24,187,199);

  
  if (clicked==false){
    earbigSize=35;
  }
  if (clicked==true){
    earbigSize=55;
  }
  if (clicked==false){
    inearbigSize=20;
  }
  if (clicked==true){
    inearbigSize=40;
  }
  
  if (clicked==false){
    earsmallSize=35;
  }
  
  if (clicked==true){
    earsmallSize=10;
  }
  
  if (clicked==false){
    inearsmallSize=20;
  }

  if (clicked==true){
    inearsmallSize=5;
  }
  
  if (clicked==false){
    blackeyeSize=20;
  }
  
  if (clicked==true){
    blackeyeSize=5;
  }
  
  if (clicked==false){
    noseSize=-10;
  }
  
  if (clicked==true){
    noseSize=0;
  }
  
  if (clicked==false){
    whiteeyeColor=255;
  }
  
  if (clicked==true){
    whiteeyeColor=0;
  }
  
  if (clicked==false){
    noseoneColor=94;
  }
  
  if (clicked==true){
    noseoneColor=97;
  }
  
  if (clicked==false){
    nosetwoColor=143;
  }
  
  if (clicked==true){
    nosetwoColor=0;
  }
  
  if (clicked==false){
    nosethreeColor=255;
  }
  
  if (clicked==true){
    nosethreeColor=133;
  }

  
  translate(150,150);
  
  // hair back
  noStroke();
  fill(232,67,199);
  ellipse(79,-17,27,150);
  
  // ears outside
  fill(230,182,115);
  ellipse(75,5,earsmallSize,earsmallSize);
  fill(230,182,115);
  ellipse(-75,-5,earbigSize,earbigSize);
  
  // ears inside
  fill(204,164,108);
  ellipse(75,5,inearsmallSize,inearsmallSize);
  fill(204,164,108);
  ellipse(-75,-5,inearbigSize,inearbigSize);
  
  // head
  fill(230,182,115);
  ellipse(0,0,150,200);
  
  // eyes white
  fill(255,whiteeyeColor,whiteeyeColor);
  ellipse(25,-15,35,40);
  
  // nose
  pushMatrix();
  translate(0,10);
  fill(noseoneColor,nosetwoColor,nosethreeColor);
  triangle(0,noseSize,-12,16,12,16);
  popMatrix();
  
  // eyes
  fill(255,whiteeyeColor,whiteeyeColor);
  ellipse(-25,-15,35,40);
  // eyes black
  fill(0,0,0);
  ellipse(20,-15,blackeyeSize,blackeyeSize);
  ellipse(-30,-15,blackeyeSize,blackeyeSize);
  
  // mouth
  arc(0, 45, 70, 50, 0, PI/1.5+QUARTER_PI, OPEN);
  
  // hair top
  fill(232,67,199);
  rotate(3);
  arc(-22, 70, 150, 90, 0, PI/QUARTER_PI, OPEN);
 
  // fangs
  fill(255,255,255);
  triangle(10,-46,35,-45,20,-60);
  triangle(-27,-49,-5,-47,-15,-60);
  
  // eyebrows
  fill(232,67,199);
  triangle(15,59,0,45,55,45);
  triangle(-65,30,-15,45,-30,54);
  
}



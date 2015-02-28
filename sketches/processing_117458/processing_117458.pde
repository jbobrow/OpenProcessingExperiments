
int myState = 0;

void setup() { 
  size(500,500);
  smooth() ;
  
}


void draw() {
  background(#ECFC0A);
  switch(myState) {
    
    case 0:
    fill(255);
    ellipse(150,150,150,150);
    ellipse(350,150,150,150);
    fill(0);
    rect(100, 400, 300, 25);
    ellipse(150,150,50,50);
    ellipse(350,150,50,50);
    break;
    
    case 1: 
    fill(255);
    ellipse(150,150,150,150);
    ellipse(350,150,150,150);
    fill(0);
    rect(100, 400, 300, 25);
    ellipse(180,150,50,50);
    ellipse(320,150,50,50);
    break;
   
    
    case 2:
    fill(255);
    ellipse(150,150,150,150);
    ellipse(350,150,150,150);
    fill(0);
    rect(100, 400, 300, 25);
    ellipse(150,120,50,50);
    ellipse(350,180,50,50);
    break;
    
    case 3:
    fill(255);
    ellipse(150,150,150,150);
    ellipse(350,150,150,150);
    fill(0);
    rect(100, 400, 300, 25);
    ellipse(120,150,50,50);
    ellipse(380,150,50,50);
    break;
    
    case 4: 
    fill(255);
    ellipse(150,150,150,150);
    ellipse(350,150,150,150);
    fill(0);
    rect(100, 400, 300, 25);
    ellipse(150,180,50,50);
    ellipse(350,120,50,50);
    break;
    

  }
}

void mousePressed() {
  //println("clicked mouse");
  myState = myState + 1;
  
  if (myState > 4)
  {myState = 0;}
}





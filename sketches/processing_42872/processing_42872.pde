
          int y = 172;
int speedY = 1;

void setup() {
  size(400,400);
  background(75,196,255);
}


void draw() {
  //sfondo
  noStroke();
  background(75,196,255);
  fill(75,196,255);
  smooth();
  
  if(mousePressed){
    background(4,7,88);
  }

   //nube
  stroke(0);
  strokeWeight(2);
  fill(255);
  ellipse(186,150,120,45);
  ellipse(186,130,120,45);
  stroke(255);
  ellipse(186,140,105,45);
  
  //eyes nube
  stroke(0);
  fill(0);
  ellipse(150,139,10,10);
  ellipse(220,139,10,10);
 
    
    if(mousePressed){
     stroke(0);
     fill(0);
     line(170,155,198,155);
    }else{
      stroke(255,0,0);
    noFill();
    arc(185,150,30,20,0,PI);
    }
    
  
  //pioggia loop
  if(mousePressed){
  stroke(0);
  strokeWeight(2);
  
  int spacing = 30;
  int len = 15;
  
  for (int x= 155; x<=240; x= x+spacing) {
    for (int y = 172; y<=height; y= y+spacing){
  line (x,y,x,y + len);
  
  y = y + speedY;
  
  if(y > height){
  y = 172; 
  }
   //println(y);
    }
  }
  }
  
  
}
                

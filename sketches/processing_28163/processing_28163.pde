

int p1,p2;
float var=0;
float ycoord=0;
 float a =0;
float sthg = 0;


//-------------------------
//SETUP
//-------------------------
void setup() {
  noStroke();
  size(837,664);
  
  noStroke();
  quad(0, height/2-50, 0, height/2+60, 150, height/2+50, 150, height/2-30);
  fill(255, 25);
}


//-------------------------
//DRAW
//-------------------------
void draw() {
  background(50);
  stroke(204, 102, 0, 100);
  strokeWeight(3);
  
  
  
  
  
  
    
  
  float xcoord = width/4+20;
  xcoord=xcoord+1;
  if(xcoord> width/2)
  {xcoord = width/4+20;}
 
  ycoord=ycoord+5;
 
//  a=a+1;

//  ycoord=height*sin(a);
  
  
  if(ycoord>height)
  {
  sthg = sthg+5;
  ycoord=0;}
  
  
  var=ycoord;
    
  if(mousePressed == true)
  { 
    var=mouseY;
  }
  if(mousePressed == false)
  {
    var=ycoord;
  }
  
  for (int i=0; i<xcoord; i=i+10)
  {
    line(i,0,xcoord,var);
  }

  
  line(0,height/2+50,width/3+60,height/2+15);
  line(width,height/2+50,width/3+60,height/2+15);
  line(width/4+20,0,width/4+20,height/2+30);
  line(width/6,0,width/6,height/2-40);
  
//  fill(0,20);
//  rect(0,0,width,height);
//  noFill();
  
  noStroke();
  quad(0, height/2-50, 0, height/2+60, 150, height/2+50, 150, height/2-30);
  fill(255, 25);
  
  
}



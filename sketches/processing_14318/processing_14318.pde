
int x=600;
int y=340;
int radius = 420;
  

void setup(){
size(600,600);
background(255);
smooth();}

 

  

void draw(){
  background(255);
//ellipse-bottom 
noFill();
stroke(0);
strokeWeight(30);
ellipse(0,600,220,220); 
  

  

  

//quad-top 

fill(0); 
noStroke();
  

quad(100,20,420,200,380,280,20,200); 

//quad-top 

quad(120,400,360,300,380,320,220,460); 

//quad-top 

quad(360,0,600,420,600,440,340,0); 

//quad-top 

quad(520,80,600,120,580,200,540,200); 

quad(120,460,140,460,0,600,0,580); 

quad(160,500,180,500,0,600,0,585); 

  

  

triangle(560,220,600,220,600,260); 

triangle(560,280,580,300,560,300);


  strokeWeight(50);
  stroke(255,0,0);
  noFill();
  float d=dist(x,y,mouseX,mouseY);
  if(d<radius) {
    radius++;
  }
  else {
    noFill();
  }
  ellipse(x,y,radius,radius);}
  void mousePressed() {
  radius=161;
}


 



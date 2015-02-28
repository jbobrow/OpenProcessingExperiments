
//integers
int x=200;
int y=200;
int radius = 100;


//Setup

void setup() {
  size(400,400);
  background(204,102,51);
  stroke(0,70);
  strokeWeight(5);
  
  
  for(int i=0;i<400;i++) {
     line(10*i,0,10*i,400);
  }
}


  //Draw
  
void draw(){
    //smiley head
  fill(255,204,0);
  stroke(0);
  strokeWeight(0);
  smooth();
  ellipse(200,200,100,100);

  //smiley eye 1
  fill(255);
  stroke(0);
  smooth();
  ellipse(170,205,15,15);
  
  //smiley eye 2
  fill(255);
  stroke(5);
  smooth();
  ellipse(230,205,15,15);
     //Neutral
 if(dist(x,y,mouseX,mouseY)>radius){
   stroke(0);
   line(170,230,230,230);}
     //SMILE
 else{
  stroke(0);
  fill(255,204,0);
  strokeWeight(0);
  smooth();
 arc(200,200,70,70,radians(40),radians(140));}
}
 



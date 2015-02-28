
int h;
int m;
int s;
int i;

void setup () {
    size (800,800);
    smooth();
   background(0); 
     
}


void draw(){
  background(0);
  noStroke();
  s = second ();
    m = minute ();
    h = hour ();
  
  translate(400,400);
  clockH();
  clockM();
  clockS();
  
  pushMatrix();
  scale(0.2);
  sun();
  popMatrix();
  
  if (mousePressed){
  background(0);
  clockCH();
  clockCM();
  clockCS();
  
 pushMatrix();
  scale(0.4);
  
  sun();
  popMatrix();
    
     
}
 
}
/////////NON-CLICK  
//clock for sec
void clockS(){
  
  pushMatrix();
  stroke(255);
  fill(0);
  float Sec=map(millis(),0,1000,0,10);
  float smoothSec = (360 / 60000 *second())+0.6*Sec; 
  
  rotate(radians(smoothSec));

  ellipse(0,-30,200,200);
  Mercury();
  popMatrix();
  
}  
//clock for Min
void clockM(){
  
  pushMatrix();
 
  stroke(255);
  fill(0);
  ellipse(0,0,350,350);
  rotate(radians(6*m));
  Venus();
  
  
 
  
  popMatrix();
  
}  
//clock for Hour
void clockH(){
 
  
  stroke(255);
  fill(0);
  
 
  ellipse(0,0,600,600);
  
  
  rotate(radians(30*h));
   Earth();
 
  

  
  
  
}  

/////////FOR-CLICK  
//clock for sec
void clockCS(){
  
  pushMatrix();
  stroke(255);
  fill(0);
  float Sec=map(millis(),0,1000,0,10);
  float smoothSec = (360 / 60000 *second())+0.6*Sec; 
  
  rotate(radians(smoothSec));

  ellipse(0,-30,200,200);
  Mercury();
  popMatrix();
  
}  
//clock for Min
void clockCM(){
  
  pushMatrix();
 
  stroke(255);
  fill(0);
  ellipse(0,0,350,350);
  rotate(radians(6*mouseX)/30);
  Venus();
  
  
 
  
  popMatrix();
  
}  
//clock for Hour
void clockCH(){
 
  pushMatrix();
  stroke(255);
  fill(0);
  
 
  ellipse(0,0,600,600);
  
  
  rotate(radians(30*mouseY)/40);
   Earth();
 
  popMatrix();

  
  
  
}  
    
  
  
/////////////////////////Planet 
  

void Mercury(){
 
  
  noStroke();
  fill(210,40,40);
  ellipse(0,-130,25,25);

 
}


void Venus(){
  
 
  noStroke();
  fill(200,200,40);
  ellipse(0,-175,30,30);
  
}


void Earth(){
  pushMatrix();
  
    
  
  noStroke();
  fill(2,0,240);
  ellipse(0,-300,35,35);
 
  popMatrix();
  
}




//////////SUN

void sun(){
 pushMatrix(); 
 int rbound = 200; //default
     
    fill( 255, 246, 64 ); //yellow
    stroke( 255, 246, 64 ); //yellow
    strokeWeight(10);
    int twinkle = 80; //distance change in ray length
    //float radius=200; //radius of rays
    float radius;
    int numPoints=130; //number of rays
    float angle=TWO_PI/(float)numPoints;
     
    //create rays
    for(int i=0;i<numPoints;i++)
    {
        radius = rbound - (int)random( 0, twinkle );
        line(0,0,radius*sin(angle*i),radius*cos(angle*i));
    }
     
   
    //face
    stroke( 51 ); //dark gray
    strokeWeight( 4 );
     
   
        arc( -50, 0, 40, 30, PI, TWO_PI ); //left eye
    
     
    
        arc( 50, 0, 40, 30, PI, TWO_PI ); //right eye
  strokeWeight(1);
    
 popMatrix();  
}

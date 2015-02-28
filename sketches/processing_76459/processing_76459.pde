
int iEen = 0;
int eenAdd = 12;
int eenStroke = 1;

float  x = random(0,0.3);

int iTwee = 0;
int tweeAdd = 6;
int tweeStroke = 2;

int iDrie = 0;
int drieAdd = 15;
int drieStroke = 5;

int iVier = 0;
int vierAdd = 28;
int vierStroke = 2;

float rndm;

void setup() {
  size(1000, 1000);
  
  background(255);
  smooth();
  strokeWeight(2);

}

  
float xPos = 500;
float yPos = 500;

void draw(){
  //  stroke(0,random(100));
  if(mousePressed == true){
    een();
  }
  }
  
  void een(){
    iEen+=eenAdd;
   // println(iEen);
    if(iEen>350){
      xPos = xPos +=random(-100,100);
      yPos = yPos +=random(-100,100);
      iEen = 0;
      x= random(0,0.2);
      //color c = (random(100,0,200);
    }
 
    pushMatrix();
    translate(xPos,yPos);
    rndm = random(50,80);
    rotate(radians(iEen));
    strokeWeight(2*x);
    stroke(50,0,250);
    line(0, 0, 0, rndm);
    stroke(100,0,200);
    strokeWeight(1.5*x);
    line(0,rndm,-7*x,120*x);
    line(0,rndm,7*x,120*x);
    
    strokeWeight(1*x);
    stroke(20,20,230);
    line(-7*x,120*x,random(18*x,23*x),random(190*x,210*x));
    line(-7*x,120*x,0,random(190*x,210*x)); 
    line(-7*x,120*x,random(-18*x,-23*x),random(190*x,210*x));
    
    line(7*x,120*x,random(18,23*x),random(190*x,230*x));
    line(7*x,120*x,0,random(190*x,210*x)); 
    line(7*x,120*x,random(-18*x,-23*x),random(190*x,230*x));
    
    line(7*x,120*x,random(18*x,23*x),random(230*x,280*x));
    line(7*x,120*x,0,random(190*x,210*x)); 
    line(7*x,120*x,random(-18*x,-23*x),random(230*x,280*x));
    popMatrix();
   
  }
  
 



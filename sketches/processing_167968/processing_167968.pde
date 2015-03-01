
float r;
float g;
float b;

float diam;
float diami;
float x;
float y;

float c;
float v;

float alt;
float med;

float back;
float down;

void setup () 
{

    
  size(200,200);
  background (#C10A38);
  rect(0,0,100,100);
  rect(101,100,100,100);
  smooth();
  }
  void draw (){
    
    
    r=random (255);
    g=random (255);
    b=random(255);
    diam=random(width/5);
    diami=random(height/5);
    
    
    y=random(0,80);
    x=random(1,80);
    
    c=random(100,150);
    v=random(0,55);
    
    alt=random(1,80);
    med=random(111,160);
    
    back=random(122,180);
    down=random(121,180);
  

    
    
 
    
    noStroke();
    fill(r,g,b);
    ellipse(x,y,diam,diami);
    
    stroke(255);
    
    rect(c,v,diam,diami);
    
    stroke(#07F530);
    strokeWeight(4);
    rect(alt,med,diam,diami);
    
    
    stroke(#07EBF5);
    strokeWeight(4);
    ellipse(back,down,diam,diami);
    }
    void mousePressed()
    {
    fill(0);
    rect(0,0,100,100);
    rect(101,101,100,100);
    }
    
    
   
    
    
    
    
    
    
    
  
    
    
    
    
    
  
    
    

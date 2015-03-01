
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
int count;
int state;

void setup() {
  size(450,450);
  background(255);
  smooth();   
  count = 0; 
}

void draw() {
  // Each time through draw(), new random numbers are picked for a new ellipse.
  r = random(230,255); //red
  g = random(100,200); // green
  b = random(10,15); // blue
  a = random(200,255); // alpha 
  diam = count *2 ;
  x = 225; 
  y = 225; 
  noStroke(); //
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
    x = random(0,450);
    y = random(0,450);
    fill(0,0,255,60);
        ellipse(x,y,100,100);
    count++;
  if(count > 70){
    
   // background (20,30,150);

    fill(r,g,b,a);
    ellipse(85,225,10,10);
    fill(r,g,b,a);
    ellipse(365,225,10,10);
    fill(r,g,b,a);
    ellipse(225,85,10,10);
    fill(r,g,b,a);
    ellipse(225,365,10,10);
    fill(r,g,b,a);
    ellipse(125,325,10,10);
    fill(r,g,b,a);
    ellipse(315,325,10,10);
    fill(r,g,b,a);
    ellipse(115,130,10,10);
    fill(r,g,b,a);
    ellipse(325,130,10,10);
    x = random(0,450);
    y = random(0,450);
    fill(255,255,255,80);
        ellipse(x,y,5,5); 
    
    count = 0;
    
    state++;
    if(state > 1){
       state = 0;
       fill(r,g,b,250);
        ellipse(285,95,10,10);
      fill(r,g,b,250);
        ellipse(160,95,10,10);  
      fill(r,g,b,250);
        ellipse(275,355,10,10);
      fill(r,g,b,250);
        ellipse(175,355,10,10);
       fill(r,g,b,250);
        ellipse(90,285,10,10);
       fill(r,g,b,250);
        ellipse(350,285,10,10);
       fill(r,g,b,250);
        ellipse(350,175,10,10);
       fill(r,g,b,250);
        ellipse(90,175,10,10); 
       
        
    } 
 
  }
 
} 

void mouseOver(){
  background (20,50,100);
}



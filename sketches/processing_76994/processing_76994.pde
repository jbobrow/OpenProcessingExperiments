
PImage a;


float obamaFL[]   = {51,43,45,42,44,49,47,46,49,50,45,45,45,43,46,41,48,50,45,46,45,45,46,45,48,51,48,47,43,49,50,48,48,49,48,47,49,48,53,51,50,50,46,47,47,49,48,44,46,47,48,47};
float romneyFL[]  = {48,46,45,47,48,41,44,43,42,45,43,47,46,44,45,47,44,46,49,42,41,46,45,48,43,45,47,48,45,46,46,47,44,44,46,48,44,47,44,47,45,46,43,46,49,45,47,51,49,51,49,44};


float time = 0.;                  
float speed = 0.2;

PFont f;


void setup() {
 
    size(700, 338);
    noStroke();
    fill (0, 0, 255);
    rect (300,100,600,20);
    f = createFont("Impact",50, true);
       
}

void draw() {
  
  

  a=loadImage("flag5.jpg");
  image(a,0,0,700,338);

    
    
    time += speed;                   
    
    int index1 = (int)time % obamaFL.length;    // get integer part of "time", keep it in range
    int index2 = (index1 + 1) % obamaFL.length; // next index
    float interp = time - (int)time;       // get fractional part of "time"
    
    ////////////////   OBAMA
    float obama = obamaFL[index1] + interp * (obamaFL[index2] - obamaFL[index1]);
    
    float xpos = width - obama * 4.; // 100 points in poll, 400 pixels = height
   
    
    fill (0,0,255);
    rect (520,165,50,15);
    
    fill(0, 0,255);
    rect(xpos-175, 165, 210, 15);
   
   ////////////////   ROMNEY
    float romney = romneyFL[index1] + interp * (romneyFL[index2] - romneyFL[index1]);
    
    xpos = romney * 4.; // 100 points in poll, 400 pixels = height
 
    fill(255, 0, 0);
    rect (150,160,50,15);
 
    fill(255, 0, 0);
    rect(xpos-10, 160, 200, 15); 
   
    fill(0);
    rect(0,0,700,50);
   
    textFont(f, 50);
    textAlign(CENTER);
    fill(255, 138, 0);
    text("OBAMA", 560, 330);
    fill(255, 138, 0);
    text("ROMNEY", 150, 330);
    
    fill (255);
    text("2012 USA PRESIDENTIAL ELECTION", 350,45);
    
  
}





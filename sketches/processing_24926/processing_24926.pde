
float x=0;
float y=0;
int a=0;
int up=0;
int dwn=0;
PFont font;

void setup(){
  
  font=createFont("Courier",12);
  

  size (700, 700);
  background(0);
 // stroke(255,90);
}
  
  void draw(){
    translate(width/2,height/2);
    rotate(frameCount*PI/3);
    fill(0,1);
    noStroke();
    rect(0,0,height,width);
    stroke(255,90);
    strokeWeight(a);
    ellipse(40+up/30,20+dwn/30,up,dwn);
    ellipse(0,0,-up,-dwn/3);
   
    
   rotate(-frameCount*PI/3);
noStroke();
fill(50);
rect(255,320,280,20);
textFont(font);
fill(246,255,0);
text("use w,a,s,d",260,335);

    
    a+=1;
    
    if(a==2){
      a=0;
    }
    
    
    if(mousePressed){
      up=0;
      dwn=0;
    }
    
  }
  
  void keyPressed(){
  
 
if(key == 'w'){
  
  
      up+=10;
    }
   if(key == 's'){
      up-=10;
    }
    
if(key == 'd'){
   dwn+=10;
    }
if(key == 'a'){
dwn-=10;

  }
  }
                                

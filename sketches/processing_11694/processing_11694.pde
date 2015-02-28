

float grow1;
float grow2;
float greens;
float blues;

void setup(){
  size(800, 600);
  smooth();
  background(33, 206, 205);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  colorMode(RGB);
  grow1=40;
  grow2=60;

  
}


void draw(){
  //alpha value low # is transparent 255 is fully opaque
  
 symmetricRipple();
  println(grow2);
}

void symmetricRipple(){

  if(grow2==150){
    rippleRect();
    //SwitchColors();
  }
 
  rippleRect();
  
   if(grow1<width/2){
      grow1+=8; }
  //if(grow1>400)
  if(grow2<=height){
    grow2+=10;
  }
  
  if(grow2==height){
     grow2=60;
     grow1=40;
    SwitchColors();
    //ellipse(50, 50, 60, 100);
  } 
}

void SwitchColors(){
  blues= random(67, 255);
  greens= random(69, 140);
}

void rippleRect(){
  fill(15, greens, blues, 1);
  
  rect(200, 300, grow1, grow2);
 
  fill(20, greens, blues, 1);
  rect(600, 300, grow1, grow2);
    }
    
   
  


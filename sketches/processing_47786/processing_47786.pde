
//hexShape
//Duncan Harrist

void setup(){
  colorMode(RGB, 250); 
  background(0);
  size(800,600);  
  smooth(); 
  //PFont font; 
 // font = loadFont("Aharoni-Bold-20.vlw"); 
  //textFont(font); 
  // text("hexShape",width*3/5,height/3);
  // text("by Duncan Harrist",width/6,height*3/4);
   noStroke(); 
}
  float rotatevar = 3.141; 
  float fillvar = 0;
  float stepvar = 40; 
  int divar1 = 1;
  int divar2 = 1; 
  int divar3 = 1;  
  float rotatetemp = 0; 
  float filltemp = .01;
  float steptemp = 0;  
  boolean backon = false; 
  boolean saved = false; 
  
void keyPressed(){

  if(key == 'w'){
    filltemp += .01; 
  }
  if(key == 'a'){
    filltemp -= .01; 
  }
  if(key =='e'){
    rotatetemp += .01; 
  }
  if(key =='f'){
    rotatetemp -= .01; 
  }
  if(key =='i'){
    if(steptemp<2){
      steptemp += .02; 
    }
  }
  if(key =='j'){
    if(steptemp>-2){
      steptemp -= .02;
    }
  } 
  if(key =='d'){
    divar1 += 1;
  }
   if(key =='k'){
    divar2 += 1;
  }
   if(key =='l'){
    divar3 += 1;
  }
   if(key =='s'){
   saveFrame(); 
   //saved = true; 
  }
  if(key ==' '){
       backon = true;
  }
}

void draw(){
  if(backon==true){
    background(abs(cos(fillvar/divar1))*250-50,abs(cos(fillvar/divar2))*250-50,abs(cos(fillvar/divar3))*250-50);
    backon=false;  
  } 
  translate(width/2,height/2);
  rotatevar +=  rotatetemp;
  fillvar += filltemp; 
  stepvar += steptemp; 
  if(stepvar < 2){
    stepvar = 2;
  }
  if(stepvar > 200){
    stepvar = 100;
  }
  rotate(rotatevar);  
  fill(abs(sin(fillvar/divar1))*250,abs(sin(fillvar/divar2))*250,abs(sin(fillvar/divar3))*250);   
  
  int x=width/4; 
  int y=height/4;  
  
 for(int b=2; b<20; b+=3){
   int a=b*2; 
    beginShape();
      vertex(x*steptemp,(y+a)*steptemp);
      vertex((x+a)*steptemp,(y+b));
      vertex((x+a)*steptemp,y-b);
      vertex(x*steptemp,y-a);
      vertex((x-a)*steptemp,y-b);
      vertex((x-a)*steptemp,y+b);  
    endShape(CLOSE);
  }
 // if(saved==true){
  //  textSize(32); 
 //   text("saved",50,50); 
  // }
}

 
  



boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int earSize;
int eyeColor;

void setup(){
  size(300,300);
  background(#25E3DE);
  textSize(12);
}

void draw(){
  if (flipFlop == false){
    earSize = 70 ;
    eyeBallDiam = 30;
    eyeColor = (#23F2F7);
    //bgcolor = 16;
    background(#25E3DE);

  }
  if (flipFlop == true){
    earSize = 90 ;
    eyeBallDiam = 20;eyeColor = (#FA1C2E) ;
         background(#FA1C2E);
         
  }
  makeFace();
  smooth();
  text(keyPrompt,42,135);
}
  
void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
void makeFace(){
  size(300,300);
  
   noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150,150);
  
//ears
fill(#6C4505);
ellipse(-100,-70,earSize,earSize);
ellipse(100,-70,earSize,earSize);
fill(178,118,68);
ellipse(-100,-70,40,40);
ellipse(100,-70,40,40);

//body
fill(#6C4505);
ellipse(0,130,80,140);
fill(178,118,68);
ellipse(0,140,50,85);

//head
fill(#6C4505);
ellipse(0,0,250,160);

//eyes
fill(255);
ellipse(-60,-15,50,50);
ellipse(60,-15,50,50);
fill(255,255,255);
fill(#23F2F7);
ellipse(60,-15,eyeBallDiam,eyeBallDiam);
fill(#23F2F7);
ellipse(-60,-15,eyeBallDiam,eyeBallDiam);
fill(0);
ellipse(-60,-15,20,20);
fill(0);
ellipse(60,-15,20,20);
fill(255);

//muzzle
fill(178,118,68);
ellipse (0,40,90,80);

//nose
fill(#010A0A);
triangle(-30,10,0,30,30,10);
fill(255);

//mouth
arc(0,45,50,20, 0, PI);
}
   


  



     
    
    








boolean flipFlop = false;
int diam;
int eyeballs;
int eyeball;
int word;
int open;

void setup (){
size(300,300);

}
void draw(){
  background(0,0,0);
  
  if(flipFlop == false){
    diam = 40;
    eyeballs = 20;
    eyeball= 20;
    word = 120;
    open = 20;
  }else{
    diam = 90;
    eyeballs = 80;
    eyeball = 50;
    word = 80;
    open = 90;
  }
  
translate(150,150);
noStroke();
ellipse(-100,5,diam,diam);
ellipse(100,5,diam,diam);
fill(250,0,0);
ellipse(0,0,200,200);
fill(255,255,255);
fill(0,0,0);
fill(255,255,255);
fill(0);
fill(255);
rect(-25, 50, 55,open);



 

 
 
 
 
ellipse(-45,5,eyeball,eyeball);
ellipse(45,5,eyeballs,eyeballs);
int value = 0;

}

void keyPressed() {
  flipFlop =! flipFlop;
  
}




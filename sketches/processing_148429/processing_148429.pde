
boolean flipFlop = false;
int diam;
 
int word;
int open;
float randNum;
float randNum2;
float randNum3;
float randNum4;
float randNum5;


void setup (){
size(300,300); 


}
void draw(){
  

  {




  }
  randNum = random(0,250);
  randNum2 = random(60,-30);
  randNum2 = random(20, -100);
  randNum3 = random(0,250); 
   randNum4 = random(0,250);
   randNum5 = random(0,250);
  

  background(0,0,0);
  
  if(flipFlop == false){
    diam = 40;
 

    word = 120;
    open = 5;
  }else{
    diam = 90;
 
    word = 80;
    open = 30;
  }
  
translate(150,150);
noStroke();
ellipse(-100,5,diam,diam);
ellipse(-100,5,diam,diam);
ellipse(randNum2,randNum2,diam,diam);
ellipse(100,5,diam,diam);
 
fill(randNum,randNum3, randNum4);
ellipse(0,0,200,200);
fill(255,255,255);
fill(0,0,0);
fill(255,255,255);
fill(0);
fill(randNum5);
rect(-25,50, 55,open);
  rect(-25, 50, 5, 20);
  rect(25, 50, 5, 20);
  rect(12.5, 50, 5, 20);
  rect(-12.5, 50, 5, 20);
  rect(1, 50, 5, 20);
 

 


 

 
 
 
 
 ellipse(-45,5,20,20);
  ellipse(45,5,20,20);

int value = 0;

}

void keyPressed() {
  flipFlop =! flipFlop; 
  
  
}





boolean flipFlop = false;
int diam;

void setup(){
  size(300,300);
  

}
void draw(){
  background(147,225,255);
  if(flipFlop == false){
    diam = 10;
  }else{
   diam = 15;  
  }
  
  translate(120,120);
  noStroke();
fill(131,255,233);
ellipse(0,0,50,80);
fill(2,0,3);
ellipse(-10,-10,diam,diam);
ellipse(10,-10,diam,diam);
fill(250,205,114);
ellipse(0,10,30,10);
fill(131,255,233);
ellipse(0,60,70,70);
ellipse(0,120,90,90);
ellipse(-10,200,10,10);
fill(5,2,0);
ellipse(2,60,diam,diam);
ellipse(2,100,diam,diam);
ellipse(2,120,diam,diam);


}

void keyPressed(){
  flipFlop =! flipFlop;
}
    



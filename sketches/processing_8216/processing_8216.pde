

int curvesspacing = 15; // space between curves
int numcurves = 30; // how many curves
int curvesrandomness = 10;// how much randomness
float turn = 0.1; 
boolean pause = false; // boolean is either true or false

void setup(){ // this runs once, at the beginning 
size(600,600); // size - must go first in setup
 background(0);
 //frameRate(2);
 smooth(); // smooths lines and edges, but draws more slowly

}
void draw(){
  
  translate(mouseX,mouseY);
  turn = mouseY*0.01;

noFill();
//translate(0,mouseY); // translate(x, y);
for(int i = 0; i < numcurves; i = i+1 ){ // a for loop 
    //fill(i*20,random(100),100 - i*5);  
    stroke(i*20,random(100),100 - i*5);
    strokeWeight(3);
    rotate(turn); 
   
    if (pause == false){ // only draw if not paused
      bezier(i*curvesspacing,500,100,10,900,90,150,80);
    }
  }
}

void keyPressed(){
  if (key == 'p'){
    pause = ! pause; // "not" pause - flip between true and false
  }
  
  if (key == 's'){
    save("chaos" + millis()+ ".jpg");
  }
}



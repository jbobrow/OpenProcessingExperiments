
float i=0;
int x=800;
int y=700;
int t =0;
int hit =0;
float[]coordX=new float[20];
float[]coordY=new float[20];
void setup() {
  size(900, 900);

  for (int i=0;i<20;i++) {
    coordX[i] = random(900);
    coordY[i] = random(900);
  }
}

void draw() {


  background(0); 
  

  fill(random(900), random(900), random(0));
if(x>coordX[t]-0 && x<coordX[t]+20  ){
  hit =1;      
  newFN(t+1);
        println("in");
        }else{
        newFN(t);
        }
  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==37) {
        
        if (x<0) {
          x=900;
        }
        strokeWeight(3);
        rect(x=x-10, y, 50, 10);
      }
    }
  }

  if (keyPressed) {
    if (key==CODED) {
      if (keyCode==39) {
        if (x>900) {
          x=0;
        }
        strokeWeight(3);
        rect(x=x+10, y, 50, 10);
      }
    }
  }

  
  
  println(keyCode);
  strokeWeight(3);
  rect(x, y, 50, 10);
  noFill();



}
void newF(int j){
ellipse(coordX[j], coordY[j], 10, 10);
}
void newFN(int k){
  
ellipse(coordX[k], coordY[k], 10, 10);
t = t+hit;
hit = 0;
//t++;
}










int rand=int(random(0,100));
PVector[] p = new PVector[3];
float shift = 1.0;
float fade = 0;
float fillCol = 0;
float rot = 0;
float spin = 0;
boolean cambia=false;
void setup() {
  size(500, 500,P3D);
  background(0);
  smooth();
  frameRate(50);
}

void triBlur() {
  fill(fillCol,120,fillCol,50);
  if(fillCol>=255){
  cambia=true;
 
  }
  if(fillCol<=0){
  cambia=false;
  }
  if(cambia){
  fillCol -=fade;
  }
  else{
   fillCol +=fade; 
  }
 // println(fillCol);
  //stroke(255);
  //rotate(spin);
  // another interesting variation: uncomment the line below 
  rotate(rot+=radians(spin));
  beginShape();
  for(int cont=0;cont<10;cont++){
    int alfa=int(random(0,200));
    int beta=int(random(0,50));
  vertex(alfa,beta*20);
  if(cont==10){
  cont=0;
  }
  }

    endShape();       
     
}
int centro=0;
void draw(){
  //fill(0,19);
//rect(0,0,width,height);
  fade = 255.0 / (width/2.0/shift);
  spin = 360.0 / (width/2.0/shift);
  noStroke();
  translate(width/2, height/2);
  triBlur();
  translate(0,0,2);
fill(60,0,10,20);
if(centro<60){
centro++;
}
if(centro>=60){
  fill(0,255);
  ellipse(0,0,60,60);
centro=0;
}
println(centro);
ellipse(0,0,centro,centro);

}

void mousePressed(){

saveFrame("Quetzalcoatl_####.png");
}


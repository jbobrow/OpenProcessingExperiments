

//3d floating ring things by Jack Perkins


int numrings=15; // number of total rings
ring[] ringz = new ring[numrings];
ring[] ringz2 = new ring[numrings];
ring[] ringz3 = new ring[numrings];
int zoom=-2900;


void setup() {
  
  colorMode(HSB,255);
  size(800,600,P3D);
  
  for(int i=0;i<numrings;i++){
    ringz[i]=new ring();
  }
    for(int i=0;i<numrings;i++){
    ringz2[i]=new ring();
  }
      for(int i=0;i<numrings;i++){
    ringz3[i]=new ring();
  }
  noStroke();
 // smooth();
  //strokeWeight(2);
}

void draw(){
  lights();
  translate(width/2,height/2,zoom);
  rotateX(-TWO_PI*((mouseY-height/2)*1.0 / height));
  rotateY(-TWO_PI*((-mouseX-width/2)*1.0 / width));
  translate(0,600,0);
  
    background(255);
  
  for(int i=0;i<numrings;i++){
    ringz[i].move();
  }
    stroke(0);

  for(int i=0;i<1;i++){
  float b=random(500)*-1;
  line(0,b-300,0,1000,b-300,1500);
  }

 
  pushMatrix();
  translate(1000,0,1500);
    for(int i=0;i<numrings;i++){
    ringz2[i].move();
  }
  popMatrix();
    stroke(0);
  for(int i=0;i<3;i++){
  float b=random(500)*-1;
  line(0,b-300,0,-2000,b-300,-400);
  }
  translate(-2000,0,-400);
    for(int i=0;i<numrings;i++){
    ringz3[i].move();
  }

}

class ring {
  float shapetype;
  float corol;
  float posy;
  float rotation;
  float rotspeed;
  int num;
  float radius;
  float fatness;
  float yspeed;
  float posygoal;


  ring() {
    shapetype=random(1);
    corol=random(255);
    posy=-1*random(2000);
    posygoal=posy;
    num=round(random(20)+10); // number of cubes per ring, random between 7 and 14 right now
    radius=num*20;
    fatness=random(50)+30;
    rotspeed=(random(20)+2.0)/400.0-(11/400.0);
    yspeed=40+random(70);
  }

  void move() {

    pushMatrix();
    if(rotation+rotspeed>TWO_PI) {
      rotation=rotation+rotspeed-TWO_PI;
    } 
    else {
      rotation+=rotspeed;
    }
    if(posy!=posygoal) {
      if(posy<posygoal){
        if(posy+yspeed>posygoal){
          posy=posygoal;
        } 
        else {
          posy+=yspeed;    
        }
      } 
      else {
        if(posy-yspeed<posygoal){
          posy=posygoal;
        } 
        else {
          posy-=yspeed;    
        }
      }        

    }
    if (random(400)>399){
      posygoal=-1*random(2000);
    }






    translate(0,posy,0);
    rotateY(rotation);

    for(int i=0;i<num;i++){
      pushMatrix();
      translate(radius,0,0);
      if(shapetype>0.5){
        rotateY(PI/2);

        if(i==0){
          fill(40,100,corol,random(100)+100);  
        } 
        else {
          fill(40,100,0,random(100)+100);
        }
        rect(-fatness,-fatness*2,fatness,fatness*2);
      } 
      else {
        if(i==0){
          fill(0,0,100,100);  
          box(fatness+40);
          noFill();
          stroke(0);
          box(fatness+50);
          noStroke();
        } 
        else {
            fill(corol,100,200);

          box(fatness);
        }

      }
      popMatrix();
      rotateY(TWO_PI/num);
    }
    popMatrix();
  }

}






void keyPressed(){ 



  if (keyCode==DOWN){

  } 

  if (keyCode==LEFT){

  }

  if (keyCode==RIGHT){

  }  

  if (key=='w'){
    zoom=zoom+200;
  }

  if (key=='s'){
    zoom=zoom-200;
  }
}







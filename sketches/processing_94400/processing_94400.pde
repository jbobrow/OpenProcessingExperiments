
float theta ;
boolean apple = true;
int s =0;


void setup() {
  size(800,800);
  
 

    drawTree();
}
void draw(){


 if(mousePressed == true){


    drawTree();
 }

}
void drawTree(){
 background(0);
 translate(width/2,height);

    branch(100);
 
}

void branch(float len) {
  if(apple == true){
  s ++;}
   else
   {
     s--;
   }
 if (s == 20){
   apple = false;
 }
 if (s==0){
   apple = true;
 }

  
  strokeCap(ROUND);
strokeJoin(ROUND);

  strokeWeight(len/5.5);
  stroke(139,69,19);
  //line(0,0,0,-len);
  bezier(0, 0,random(-5,5), 0, random(-5,5), 0, random(-2,0), -len);

 
  translate(0,-len);

  if (len > 3) { // no inf. loop

    pushMatrix();
    rotate(random(-PI/4,PI/4));
    branch(len*random(0.70,0.85));
    popMatrix();

    pushMatrix();
    rotate(random(-PI/4,PI/4));
    branch(len*random(0.70,0.85));
   pushMatrix();
   noStroke();


    fill(10,random(255),20);
    float r = (random(3,10));
    //ellipse(0,0,r,r);
    
     bezier(0, 0,  s, r,  s, 0,  10, r);
    popMatrix();
    popMatrix();

  }
}





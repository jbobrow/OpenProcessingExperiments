

float x= 200; 
float y= 120;
float r= 10.5;
 float w=1;
color c=color(0,0,0);
int count=1;
int quadi=0;
int kreis=0;

void setup(){
  size(500,500);
  background(255);
  smooth();
  frameRate(60);
}

void draw(){
  if(mousePressed){
    fill(255);
    x= mouseX;
    y= mouseY;
    r= random(10,40);
 
    w=dist (mouseX,mouseY,pmouseX,pmouseY)/10; 
    strokeWeight(w);//stärke
    stroke(c);//farbe
    fill(c);//farbe
    line(mouseX,mouseY,pmouseX,pmouseY);
    noStroke();
    if(kreis==1){
    ellipse(mouseX+random(-20,20),mouseY+random(-20,20),random(15),random(15));
    }
    
    if(quadi==1){
    rect(mouseX+random(-20,20),mouseY+random(-30,30), random(20), random(20));
    }
  }
}

void keyPressed(){
 if (key=='1'){
  c=color(255,0,0);
 }
 
 if (key=='2'){
 // background(0);
   c=color(255,255,0);
 }
 if (key=='3'){
   c=color(0,255,0);
 }
 if (key=='4'){
   c=color(random(255),random(255),random(255));
 }
  if (key=='b'){
   background (random(255),random(255),random(255));
 }
 if (key=='c'){
   background(255);
 }
 if (key=='s'){
   saveFrame(count+".jpg");
   count++;
 }
 if (key=='q'){
   if(quadi==0){
   quadi=1;
   }else{
   quadi=0;
   }
 }
   if (key=='w'){
   if(kreis==0){
   kreis=1;
   }else{
   kreis=0;
   }
   }
}




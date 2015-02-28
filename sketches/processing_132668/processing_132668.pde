
int c =0;
 
void setup() {
  size(450,600);
  frameRate(30);
  smooth();
  background(255,255,245);
  stroke(50,60);


}

void draw() {
  

  if (mousePressed){
  if (mouseButton == LEFT) {
  noStroke();
  int ran=200;
  
  fill(random(100-c,220-c),30+c*2,40+c*2,10);
  triangle(pmouseX,pmouseY,mouseX,mouseY,mouseX+random(-ran,+ran),mouseY+random(-ran,+ran));
  
  fill(40+c*2,30+c*2,random(100-c,200-c),10);
  triangle(pmouseX,pmouseY,mouseX,mouseY,mouseX+random(-ran,+ran),mouseY+random(-ran,+ran));
 
  } 
  if (mouseButton == RIGHT){
    noStroke();
  int ran=200;
  
  fill(30+c*2,random(100-c,220-c),150+c*2,10);
  triangle(pmouseX,pmouseY,mouseX,mouseY,mouseX+random(-ran,+ran),mouseY+random(-ran,+ran));
  
  fill(random(100-c,200-c),40+c*2,130+c*2,10);
  triangle(pmouseX,pmouseY,mouseX,mouseY,mouseX+random(-ran,+ran),mouseY+random(-ran,+ran));
}
}
}

void keyPressed() {

  if (key == 's') {saveFrame("output/Screenshot-####.tif");}
  
  if (key == 'z') {c=100;
                   background(0,0,10);}
                   
  if (key == 'a') {c=0;
                   background(255,255,245);}                   
  
}


 


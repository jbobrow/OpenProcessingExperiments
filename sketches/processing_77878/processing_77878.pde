
int posicion=0;
void setup(){
  size(1000,750);
  background(255);
  smooth();
}
void draw(){
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(posicion);
  posicion=(posicion+1)%20;
  noStroke();
  if (keyPressed){
    if(key=='c'){
      background(255);
    }
    if(key=='x'){
      noStroke();
      fill(300,0,0);
      ellipse(450,300,200,200);
      ellipse(600,300,200,200);
      triangle(373,365,677,365,525,500);
      strokeWeight(20);
      stroke(255);
      line(400,300,480,300);
      line(570,300,650,300);
      arc(525,360,170,100,radians(0),radians(180));
    }
   if(key=='z'){
     noStroke();
     fill(300,0,0);
     ellipse(450,300,200,200);
     ellipse(600,300,200,200);
     triangle(373,365,677,365,525,500);
     strokeWeight(25);
     stroke(255);
     line(400,300,480,300);
     line(570,300,650,300);
     strokeWeight(40);
     line(430,310,430,450);
     line(620,310,620,450);
   }
  }
  if(mousePressed){
      stroke(0);
  }
}



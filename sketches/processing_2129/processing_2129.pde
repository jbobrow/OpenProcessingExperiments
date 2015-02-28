

int posX=0;
int posY=0;



void setup(){
  background(0);
  size(400,400);


}

void draw(){
  translate(width/2,height/2);
 campo();
}

void campo(){
 fill(150,255,150);
  strokeWeight(5);
 
  rectMode(CENTER);
  rect(posX,posY,200,300);
  ellipseMode(CENTER);
  stroke(255,255,255);
  fill(150,255,150);
  ellipse(posX,posY,50,50);

  line(posX-100,posY,posX+100,posY);
  rect(posY-2,posY-135,70,30);
  rect(posY-2,posY+135,70,30);
  

}


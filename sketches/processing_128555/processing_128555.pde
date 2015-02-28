
//Nicolette Hashey
//Inital Smiley Face
/*tweaked by Eric Morrison,
use arrow keys 
UP is smile
DOWN is frown.*/
void setup(){
  int value=0;
 size(500,500);
 background(0);
 noStroke();
    fill(#FFcccc);
  ellipse(250,200,185,150);
  ellipse(250,250,175,175);
  ellipse(160,225,25,50);
  ellipse(340,225,25,50);
    fill(255);
  ellipse(210,210,30,30);
  ellipse(290,210,30,30);
    fill(#996633);
  ellipse(210,210,25,25);
  ellipse(290,210,25,25);
    fill(0);
  ellipse(210,210,15,15);
  ellipse(290,210,15,15);
    fill(255);
  ellipse(215,205,5,5);
  ellipse(295,205,5,5);
  line(250,225,235,260);
  line(235,260,250,260);
}

void draw(){

    line(250,225,235,260);
  line(235,260,250,260);
  
    if(true){
  fill(#FFcccc);
  stroke(#FFcccc);
    arc(250,275,100,75,0,PI);
  
  arc(250,310,100,75,PI,TWO_PI);
  arc(250,275,100,75,0,PI);
  stroke(0);
  
  arc(250,275,100,75,0,PI)

  }

  //smile
  if(keyPressed){

  if(keyCode== UP ){
  fill(0);
  stroke(0);
  arc(250,275,100,75,0,PI);
  }
  
  if(keyCode== DOWN ){
  fill(#FFcccc);
  stroke(#FFcccc);
  arc(250,275,100,75,0,PI);
  fill(0);
  stroke(0);
  arc(250,310,100,75,PI,TWO_PI);
  }
 }

}


//This piece of code uses transformations
//to draw spirals inspired by the sunflower

size(600,600);
background (196,165,115);


int circle = 10;  
int radius = 300;

translate(width/2, height/2);  //move the origin to the center

for(int i = 0; i < 360; i+=circle){
  pushMatrix();   
    rotate(radians(i));    //rotate the origin
    translate(radius,0);   //move the origin out to the radius
    noFill();
    stroke(144,109,51);
    ellipse(0,0,width,height);  //draw circle
    ellipse(width/2,height/2,width/2,height/2);
  popMatrix();    //reset (back to width/2, height/2)
  ellipse(0,0,600,600);
}



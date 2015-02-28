
float angle = 0;



void setup (){
  size(400,200);

}

void draw(){
   background(255);
  noStroke();
  rectMode(CENTER);
  

    
  pushMatrix(); //make the first square follow the mouse
    translate(mouseX,mouseY);
    fill(0);
  rect(0,0,80,80); //1

  rotate(angle +=0.1);
  fill(100);
  rect(0,0,50,50); //2
  popMatrix();
      translate(200,50);//move all 3 squares into position
  fill(175);
  rect(0,0,30,30); //3
  
}

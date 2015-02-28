
//Rossa's Processing Homework #2

void setup(){
 
size(324,384);
background(255,253,254);
smooth();
}


void draw(){
  background (255);
 
  //left rectangle
 
  if(dist(mouseX,mouseY,162,192)<60){
  fill(34,64,227);
  }
  rect(94,6,223,260);
  fill(255,254,0);
  stroke(2,0,0);
  strokeWeight(1);
 
  //bottom right rectangle
 
  if(dist(mouseX,mouseY, 310,370)<70){
  fill(255,0,0);
  }
  rect(268,323,49,54);
  fill(0,255,153);
  stroke(2,0,0);
  strokeWeight(2);


  if(dist(mouseX,mouseY,100,384)<200){
  fill(34,63,227);
  }
 
  rect(7,275,79,102);
  fill(209,24,121);
  stroke(2,0,0);
  strokeWeight(1);
 


//Background Grid: Vertical

strokeWeight(8);

stroke(2,0,0);

line(324,3,0,3);

 

strokeWeight(8);

stroke(2,0,0);

line(324,381,0,381);

 

strokeWeight(15);

stroke(2,0,0);

line(84,90,0,90);

 

strokeWeight(8);

stroke(2,0,0);

line(324,384,0,384);

 

strokeWeight(8);

stroke(2,0,0);

line(324,3,0,3);

 

strokeWeight(10);

stroke(2,0,0);

line(324,270,0,270);

 

 

strokeWeight(8);

stroke(2,0,0);

line(266,320,324,320);

 

 

 

//Background Grid: Horizontal

strokeWeight(8);

stroke(2,0,0);

line(3,0,3,384);

 

strokeWeight(8);

stroke(2,0,0);

line(90,0,90,384);

 

strokeWeight(8);

stroke(2,0,0);

line(324,3,0,3);

 

strokeWeight(8);

stroke(2,0,0);

line(321,0,321,384);

 

strokeWeight(8);

stroke(2,0,0);

line(324,3,0,3);

 

strokeWeight(8);

stroke(2,0,0);

line(265,270,265,384);

}


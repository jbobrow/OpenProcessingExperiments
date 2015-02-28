
int moon;
int man;

void setup(){
size(600, 600);
 
}

void draw (){
  smooth();
  noStroke();
  background(0,0,0);

  if (mousePressed == true) {
     fill(62,227,234);
  }  else {
    fill(255);
  }
  //moon
  ellipse(298,200,300,300);
  //face
  fill(0,0,0);
  ellipse(300,200,22,22);
  
  //body
  fill(0,0,0);
  rect(296,210,10,50);
  //right leg
  rect(305,250,20,10);
  //left leg
  rect(282,250,20,10);
  //arms
  rect(290,215,25,10);
  
}


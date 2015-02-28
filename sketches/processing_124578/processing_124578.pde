
void setup() {

  size(400, 400);

  frameRate(15);

}






void draw() {

  background(275,75,65);

  translate(200, 200);




  for (int j=0;j<1000;j++) {

    stroke(255, random(55, 255));

    strokeWeight(4);

    point(random(-200, 200), random(-200, 200));

  }

  

 flake();

 

 translate(100,100);

 scale(.5,.5);

 flake();

 

 translate(50,-400);

 scale(.8,.8);

 flake();
  
  translate(50,-400);

 scale(.100,.1);

 flake();


  

}

/////////////////////////////




void flake(){

  //rotate(PI/4);

  int sections=11;

  stroke(0);




  for (int i=0;i<sections;i++) {

    line(0, 0, 100, 0);

    triangle(70, 20, 10, 70,10,10);

    rect(70, -10, 10, 10);
    
    ellipse(10,10,10,10);


    rotate(2*PI/sections);

  }

  

}



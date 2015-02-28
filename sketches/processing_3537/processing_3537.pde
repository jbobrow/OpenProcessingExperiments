
void setup(){
  size(500,500,P3D);
}

void draw(){
  
  
  background(0);


  translate(250,250,30);
rotateX(minute());
rotateY(minute());
fill(random(60),random(20),random(300),200);
box(500);


  translate(100,25,80);
rotateX(second());
rotateY(second());
fill(random(70),random(10),random(200),200);
box(200);



  translate(70,70,50);
rotateX(millis());
rotateY(millis());
fill(random(300),random(170),random(500),200);
box(30);

}





void setup(){
  size(400,400,P3D);
  noStroke();
}

int a = 0;  //planet rate
int b = 10;  //moon rate

void draw(){
  background(1,8,52);
  
  lights();
  
  camera(300, 50, 300, width/2, height/2 ,0, 0, 1, 0);
  
 //sun
  translate(width/2, height/2, 0);
  fill(255,210,0);
  sphere(40);

//planet  
 pushMatrix();
 noStroke();
 rotateY(a * -PI/6 * 0.05);
 translate(100,0,0);
 fill(160,220,95);
 sphere(20);

//moon
 rotateY(radians(b * -PI/6 *0.05));
 translate(30,0,0);
 fill(255);
 sphere(5);
 popMatrix();
 
 a++;
 b+=100;
 

}


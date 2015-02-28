
float R=0;
float G=0;
float H=5;


void setup()
{
  size(800,800,P3D);
}
void draw()
{
  //basicos
  stroke(#ff00ff);
  background(0);
  fill(#34E6EA);
  translate(400,500);
  rotateY(radians(R));
  box(35,100,35);
  stroke(#34E6EA);
  fill(#ff00ff);
  translate(0,-75);
  sphere(35);
  translate(0,25);
  
  //brasos1
  stroke(#ff00ff);
  line(17,10,0,70,-25,+G);
  line(17,10,0,80,-5,+G);
  line(17,10,0,90,15,+G);
  line(17,10,0,90,35,+G);
  line(17,10,0,80,55,+G);
  line(17,10,0,70,75,+G);
  
  //brasos2
  line(-17,10,0,-70,-25,+G);
  line(-17,10,0,-80,-5,+G);
  line(-17,10,0,-90,15,+G);
  line(-17,10,0,-90,35,+G);
  line(-17,10,0,-80,55,+G);
  line(-17,10,0,-70,75,+G);
  
  //manos1
  stroke(#34E6EA);
  fill(#ff00ff);
  translate(70,-25,+G);
  sphere(5);
  translate(10,20);
  sphere(5);
  translate(10,20);
  sphere(5);
  translate(0,20);
  sphere(5);
  translate(-10,20);
  sphere(5);
  translate(-10,20);
  sphere(5);
   
  //manos2 
  translate(-140,0);
  sphere(5);
  translate(-10,-20);
  sphere(5);
  translate(-10,-20);
  sphere(5);
  translate(0,-20);
  sphere(5);
  translate(10,-20);
  sphere(5);
  translate(10,-20);
  sphere(5);
  
  //piernas
  stroke(#ff00ff);
  translate(75,0,-G);
  line(-15,100,-15,175);
  line(5,100,5,175);
  
  //bolitaspiesosas
  stroke(#34E6EA);
  fill(#ff00ff);
  translate(-15,175);
  sphere(5);
  translate(20,0);
  sphere(5);
  
  //ojos
  translate(0,-200,20);
  fill(255);
  stroke(255);
  sphere(10);
  translate(-20,0);
  sphere(10);
  
  //pupilas
  fill(0);
  stroke(0);
  translate(0,-5,10);
  sphere(3);
  translate(20,0);
  sphere(3);
  
  //antena
  stroke(#ff00ff);
  translate(-10,0,-30);
  line(-10,0,-10,-10);
  line(-10,-10,0,-13,-13,3);
  line(-13,-13,3,-16,-13,6);
  line(-16,-13,6,-19,-10,9);
  
  //anntena
  line(10,0,10,-10);
  line(10,-10,0,13,-13,3);
  line(13,-13,3,16,-13,6);
  line(16,-13,6,19,-10,9);
  
  //bolitasantenosas
  fill(#ff00ff);
  stroke(#34E6EA);
  translate(19,-10,9);
  sphere(3);
  translate(-38,0);
  sphere(3);
  
  //boca
  translate(19,40,15);
  fill(0);
  stroke(0);
  sphere(15);
  
  //nave
  translate(0,40,-24);
  fill(#34E6EA,30);
  stroke(#ff00ff,30);
  box(230);
  sphere(150);
  
  //nube
  rotateX(radians(R));
  rotateY(radians(R));
  translate(-170,-170,-50);
  fill(#4911AA,100);
  stroke(#502DE0,100);
  sphere(10);
  translate(-12,10,15);
  sphere(20);
  translate(0,-15,-20);
  sphere(15);
  translate(-24,7,17);
  sphere(30);
  translate(-15,20,12);
  sphere(15);
  translate(-13,-15,-25);
  sphere(13);
  
  //centrado
  translate(234,173,51); //centro
  //fill(0);
  //stroke(0);
  //sphere(88);
  
  //planeta
  rotateX(radians(R));
  rotateY(radians(-R));
  fill(#34E6EA);
  stroke(#0B0B61);
  translate(200,-200,80);
  sphere(80);
  fill(0);
  ellipseMode(CENTER);
  ellipse(0,0,250,250);
  
  
  R=R+1;
  G=G+H;
  if(G==100)
  {
    H=-5;
  }
  if(G==-100)
  {
    H=5;
  }
}


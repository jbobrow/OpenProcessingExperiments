
int eSize = 3;

size(565, 400);
background(80);

//quad black//
fill(0,0,0);
quad(565,200,150,0,0,200,150,400);

//triangle red//
fill(255,0,0);
triangle(310,0,150,0,360,100);

//quad yellow// 
fill(255,215,0);
quad(565,200,500,90,310,0,360,100);

//triangle red//
fill(255,0,0);
triangle(360,130,485,200,360,280);

//triangle black//
fill(0,0,0);
triangle(565,0,500,90,310,0);

//sircle white//
fill(255);
strokeWeight(1);
ellipse(200, 200, 300, 300);

//sircle white//
strokeWeight(1);
ellipse(200, 200, 200, 300);

//sircle white daen//
strokeWeight(1);
ellipse(200,200,200,100);

//sircle black//
fill(0,0,0);
strokeWeight(1);
ellipse(200, 200, 100, 100);

//center//
for(int x = 0; x <= width; x += 20){
 
  if(x == width/2){
    fill(255);
  }
  else{
    fill(0);
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x);
}







background(200,40,60,100);
size(400, 565);
smooth();

stroke(255);  
strokeWeight(3); 
line(20, 600, 270, 80);

stroke(0);
strokeWeight(3); 
line(20, 40, 270, 80);

stroke(0);
line(50, 300, 80, 40);

stroke(0);
line(150, 300, 100, 10);

stroke(0);
strokeWeight(40);
ellipse(100, 300, 50, 50);

stroke(0);
ellipse(200, 400, 150, 150);

stroke(0);
ellipse(300, 130, 150, 150);

stroke(0);
ellipse(200, 400, 50, 50);

stroke(0);
quad(38, 31, 86, 20, 69, 63, 30, 76);

stroke(0);
triangle(100, 50, 100, 50, 20, 70);

int eSize = 5;  
 
 
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










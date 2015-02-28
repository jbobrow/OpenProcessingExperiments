
size(400,565);

background(255);

int eSize = 10; 

//samll red cercle 
for(int x = 10; x <= width; x += 30){
 
  if(x == width/2){
    fill(0);
  }
  else{
    fill(255,0,0);
  }
  ellipse(x, height/1.1,10, 4);
  println("x=" + x);

}






// big red cercle
fill(255,0,0);
noStroke(); 
ellipse(200,400,150,150);
//samll blue cercle
noFill();
stroke(0,0,255); 
ellipse(145,50,55,55);
//samll yellow cercle
noFill();
stroke(255,255,0); 
ellipse(172,75,55,55);
//samll black cercle
noFill();
stroke(0); 
ellipse(205,50,55,55);
//samll green cercle
noFill();
stroke(0,255,0); 
ellipse(234,75,55,55);
//samll red cercle
noFill();
stroke(255,0,0); 
ellipse(265,50,55,55);



//blue quad
fill(55,161,216);
quad(150, 120,250, 120, 390, 280, 10, 280); 
//white quad
fill(255);
quad(150,123,250,123, 300, 180, 100, 180);




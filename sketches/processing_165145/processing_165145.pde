
//the space that only runs once
void setup(){
  //dimensions of the composition
  size(500,500);
  //color of the background in RGB
  background(255);
  
  //end setup space
}



//the space that runs on a loop
void draw() {
  //gets rid of the stoke
if(key == 'q' || key == 'Q'){
myfirstSketch();
}
if(key == 'w' || key == 'W'){
mysecondSketch();
}
if(key == 'e' || key == 'E'){
mythirdSketch();
//the end cap of void draw
}
}

void myfirstSketch(){
background();
  noStroke();
  
  
  fill(255,23,66);
  rect(10,25,100,100);
  fill(255,23,23);
  rect(220,25,100,100);
  
  
  fill(255,23,66);
  rect(80,150,100,100);
  fill(255,23,23);
  rect(260,150,100,100);
  
  
  fill(255,23,66);
  rect(160,275,100,100);
  fill(255,23,23);
  rect(320,275,100,100);
  
  
  fill(255,23,66);
  rect(240,400,100,100);
  fill(255,23,23);
  rect(360,400,100,100);
  
  
  
  
  
  
  
  
  //shows feedback  in the que
print();


}

void mysecondSketch(){
background();
noStroke();


  fill(255,242,251);
  rect(100,50,50,50);
  
  fill(255,247,249);
  rect(150,50,50,50);
  
  fill(255,242,251);
  rect(200,50,50,50);
  
  fill(255,247,249);
  rect(250,50,50,50);
  
  
  
  
  
   fill(255,247,249);
  rect(100,100,50,50);
  
  fill(255,242,251);
  rect(150,100,50,50);
  
 fill(255,232,247);
  rect(200,100,50,50);
  
 fill(255,242,251);
  rect(250,100,50,50);






  
  
  
 fill(255,242,251);
  rect(100,150,50,50);
  
  fill(255,247,249);
  rect(150,150,50,50);
  
 fill(255,242,251);
  rect(200,150,50,50);
  
  fill(255,247,249);
  rect(250,150,50,50);






 
 fill(255,247,249);
  rect(100,200,50,50);
  
  fill(255,232,247);
  rect(150,200,50,50);
  
 fill(255,247,249);
  rect(200,200,50,50);
  
   fill(255,242,251);
  rect(250,200,50,50);
  

}





void mythirdSketch(){
background();
noStroke();


fill(255,232,247);
rect(50,250,50,50);


fill(255,23,23);
rect(150,150,200,200);


fill(255,232,247);
rect(400,250,50,50);

}
  

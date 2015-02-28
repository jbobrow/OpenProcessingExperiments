

void setup(){
  size(600, 600);
  sky();
  //ground();
  Houses();
  

}

void sky(){
  
colorMode (HSB,255);
noStroke();
for(int x=0; x<width; x+=20){
  fill(random(160, 170), 190, 190);
  rect(x,0,100,100);
}
for(int x=0; x<width; x+=20){
  fill(random(150, 170), 190, 190);
  rect(x,100,100,100);
}
for(int x=0; x<width; x+=20){
  fill(random(140, 170), 190, 190);
  rect(x,200,100,100);
}
for(int x=0; x<width; x+=20){
  fill(random(130, 170), 190, 190);
  rect(x,300,100,100);
}
}
void ground(){ 
  for(int x=0; x<width; x+=20){
  fill(random(60, 100), 190, 190);
  rect(x,400,100,100);
}
 for(int x=0; x<width; x+=20){
  fill(random(60, 100), 190, 190);
  rect(x,500,100,100);
}

  
}

void Houses(){

fill(#7C7878);
rect(80,150,150,500);

fill(#7C7878);
rect(500,350,150,300);

fill(#504D4D);
rect(380,150,150,500);
  
fill(#A5A3A3);
rect(5,200,100,400);

fill(#908D8D);
rect(150,180,100,500);

fill(#AAA5A5);
rect(250,380,200,300);

fill(#F7FF89);
rect(20,250,25,25);

fill(#F7FF89);
rect(20,300,25,25);

fill(#F7FF89);
rect(20,350,25,25);

fill(#F7FF89);
rect(20,400,25,25);

fill(#F7FF89);
rect(20,450,25,25);

fill(#F7FF89);
rect(70,250,25,25);
  
fill(#F7FF89);
rect(70,300,25,25);
  
fill(#F7FF89);
rect(70,350,25,25);
  
fill(#F7FF89);
rect(70,400,25,25);

 fill(#F7FF89);
rect(70,450,25,25);

fill(#F7FF89);
rect(280,420,25,25);

fill(#F7FF89);
rect(280,470,25,25);
  
  fill(#F7FF89);
rect(280,520,25,25);

fill(#F7FF89);
rect(330,420,25,25);
  
  fill(#F7FF89);
rect(330,470,25,25);

fill(#F7FF89);
rect(330,520,25,25);

fill(#F7FF89);
rect(380,420,25,25);
  
  fill(#F7FF89);
rect(380,470,25,25);

fill(#F7FF89);
rect(380,520,25,25);

fill(#F7FF89);
rect(410,180,90,25);
  
  fill(#F7FF89);
rect(410,230,90,25);

fill(#F7FF89);
rect(410,280,90,25);
}






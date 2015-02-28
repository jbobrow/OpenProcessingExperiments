
// Assignment 2
// By Wong Hiu Tung, Christine
// Student ID: 534015140

int pos = 500; // Set the position of moon 

void setup(){
  size(500, 500);
  frameRate(4); // Set the motion slowly
}
 

void draw(){
  
background(50);
  
//moon's movement  
  fill(#FFD700);
  smooth();
  noStroke();  
if(pos > 250){
  pos-=10;
  ellipse(250, pos, 350, 350); 
}
else{
  smooth();
  fill(#FFD700);
  ellipse(250, 250, 350, 350); 

//moon's eyes  
  fill(20);
  ellipse(170, 200, 20, 20);
  ellipse(330, 200, 20, 20);

//moon's nose
  fill(#FFA500);
  ellipse(250, 200, 20, 10);
  
//moon's mouth
  fill(#FFC0CB);
  arc(250, 220, 140, 50, 0, PI);

}


//cloud
for (int x = 0; x < 600; x+=100){
  for (int y = 400; y < 600; y+=50){
    if (pos <= 250){
   smooth();
   fill(random(250)); 
   ellipse(x, y, 120, 120);
    }
    else{
   smooth();
   fill(#FFFFF0); 
   ellipse(x, y, 120, 120);
   
//message  
  fill(50);
  smooth();
  textAlign(CENTER);
  textSize(10);
  text("H A P P Y  M I D - A U T U M N  F E S T I V A L", 250, 300);
    }
  }
}
}

//Idea reference: http://www.openprocessing.org/sketch/95427

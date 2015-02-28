
size(600,600); 
background(255,172,5); 
smooth();
fill(255,255,255); 
rect(300,0,300,300);

//quadreants//
strokeWeight(3);
stroke(255,255,255); 
line(width/2,0,width/2,height); 
line(0,height/2,width,height/2); 

//randome ellipse
noStroke();
fill(10,93,147);

float centerX, centerY; 
centerX = random(50,width-50); 
centerY = random(50,height-50); 

ellipse(centerX,centerY,100,100);
int rad =50; 


//if cirlce is in bottom right corner it will be or//
//will become wht. the back ground will become blue
if(centerX > 300 && centerY >300){
  background(8,88,255); 
  strokeWeight(5);
  stroke(255,255,255);
  line(width/2,0,width/2,height); 
  line(0,height/2,width,height/2);
  fill(255,255,255);
  rect(300,300,300,300);
  noStroke(); 
  fill(255,185,8);
  ellipse(centerX,centerY,100,100);
  
}

//if circle is in bottom left corner it will become purp//
//will become wht. the back ground will become yel

if(centerX <300 && centerY >300){ 
  background(255, 247, 5);
 strokeWeight(3);
 stroke(255,255,255); 
 line(width/2,0,width/2,height); 
 line(0,height/2,width,height/2); 
  fill(255,255,255);
  rect(0,300,300,300);
  noStroke(); 
  fill(201,8,255); 
  ellipse(centerX,centerY,100,100); 

}

//if the circle is in the upper left corner it will become grn and the corner 
//will become wht. the back ground will become red 
if(centerX <300 && centerY <300){
  background(255,8,57);
  strokeWeight(3);
  stroke(255,255,255);
  line(width/2,0,width/2,height); 
  line(0,height/2,width,height/2);
  fill(255,255,255);
  rect(0,0,300,300); 
  noStroke(); 
  fill(68,255,8); 
  ellipse(centerX,centerY,100,100);
  
}



                
                

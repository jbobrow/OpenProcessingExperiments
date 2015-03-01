
int i,t; 
size(400, 400); 
background(0); 
colorMode(RGB, 180); 
strokeWeight(4); 
translate(width/2, height /2); 
t=50;

for (i=0; i<180; i++) { 
  rotate(PI/90);  
  if(i%3 == 0){
  stroke(0, 0, 0);  
  } 
  else{
stroke(i, 0, 180-i);    
  }
    
  line(0, -300, 0, 0); 
} 

for (i=0; i<120; i++) { 
  rotate(PI/60); 
 if(i>=0 && i<30){ 
  stroke(0,0,0,t);  
 }
 else if(i>=60 && i<90){
 stroke(0, 0, 0,t);
 }  
 else{
   stroke(180,180,180,t);
 }
  line(0, -300, 0, 0); 
} 

rectMode(CENTER); 
noStroke(); 
fill(0); 
ellipse(0, 0, 65, 65); 

  rotate(PI/20); 
strokeWeight(58); 
stroke(0,0,0); 
noFill(); 
rect(0, 0, 400, 400); 

strokeWeight(5); 
 for (i=50; i<=500; i+=50) { 
     stroke(0,0,0); 
     ellipse(0, 0, i, i); 
}



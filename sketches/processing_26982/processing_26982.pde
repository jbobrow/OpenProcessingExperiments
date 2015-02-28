
void setup(){
size(500,500);
smooth();
}

void draw(){
  background(random(10));
  
for(int i=0; i<510; i=i+20){ 
 for(int j=0; j<510; j=j+20){   
   
  fill(i,random(50), random(100));
  textSize(100);
  text("QXO",i,j+50);
  
  fill(i+j,j, random(10),40);
  noStroke ();
  ellipse(i,j+25,20,20);
  
  
  
  fill(57,random(50),random(50));
  noStroke ();
  rect(i,j+80,10,10);
}

}
}
                

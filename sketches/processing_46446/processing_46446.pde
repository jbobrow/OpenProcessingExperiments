
PImage face2;


void setup(){

size (500,500);
background(255);
smooth();
face2 = loadImage("moleskine 10.jpg"); 
}
 
void draw(){
 image(face2,0,0,500,500); 

//float weight = dist(mouseX, mouseY, pmouseX, pmouseY);

//strokeWeight(weight);
//line(mouseX, mouseY, pmouseX, pmouseY);

//line(mouseY, mouseY, pmouseY, pmouseY);
//ellipse(mouseX,mouseY,10,10);
 
if(mousePressed == true){
 tint(mouseY,16,mouseX,5);

      ellipse(120,210,random(100),random(100));
      ellipse(120,210,random(100),random(100));
    ellipse(320,210,random(100), random(100));
    ellipse(320,210,random(100),random(100));
    ellipse(220, 310, random(150),random(50));
    ellipse(220, 310, random(150),random(50));
  
    fill(0,0,0,40);
    stroke(random(1));
   
    
     
}else{
    fill(255,255,255,30);

   
  
   
      
}
}


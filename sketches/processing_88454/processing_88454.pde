
void setup(){
  
  size(500,500);
  smooth();
  

}


void draw(){
  
 background(0); 
 
 float ypos = map(mouseX,0,width,height/3,height/2);  // white band
 noStroke();
 fill(255);
 rectMode(CENTER);
 rect(width/2,height/3,500,ypos);          
 
 float size = map(mouseX,0,width,15,140);              // eyes
 fill(0);                                
 ellipse(width/6,height/3,size,size);
 ellipse(width/1.2,height/3,size,size);
 
 float eye = map(mouseX,0,width,0,50);               // secondary eyes
 noFill();
 stroke(255); 
 ellipse(width/6,height/3,eye,eye);
 ellipse(width/1.2,height/3,eye,eye);

 float wnose = map(mouseX,0,width,30,150);           // mint nose
 float hnose = map(mouseX,0,width,300,50);
 noStroke();
 fill(141,241,209);                                    
 rect(width/2,height/2,wnose,hnose);
 
 float brow = map(mouseX,0,width,150,65);            // eyebrows
 float brows = map(mouseX,0,width,100,60);
 fill(0);                                            
 stroke(0);
 strokeWeight(4);
 line(30,brow,90,brows);
 line(470,brow,410,brows);
 
 float mouth = map(mouseX,0,width,50,300);            // mouth
 float hmouth = map(mouseX,0,width,440,320);
 noFill();                                           
 strokeWeight(4);
 stroke(255);
 arc(width/2,hmouth,mouth,mouth,radians(0),radians(180));
 
 fill(141,241,209);                                   //cheeks
 noStroke();
 arc(width/8,300,30,20,radians(15),radians(165));
 arc(width/1.15,300,30,20,radians(15),radians(165));
  
}




//* Coding by Cecilia Chen *// 


 
void setup(){
  size(500,500);

}
 
void draw(){
  fill(#308186, 20); 
  rect(0,0,mouseX, height);
     
  
fill(#f9ff5c);  
noStroke();     
ellipse(mouseX,mouseY,30,30);
 
 
}

void mouseDragged(){  
fill(#b65b66);  
rect(30,30,170,40);
fill(#fff0f2);
rect(30,70, 170, 40);
fill(#b65b66);  
rect(30,110,170,40);
fill(#fff0f2);
rect(30,150, 170, 40);
fill(#b65b66);  
rect(30,190,170,40);

fill(#ff6ebc);  
noStroke();     
ellipse(mouseX,mouseY,60,60);
}


void mouseClicked(){ 
fill(#b65b66);  
rect(300,300,170,40);
fill(#6b5a4a);
rect(300,340, 170, 40);
fill(#b65b66);  
rect(300,380,170,40);
fill(#6b5a4a);
rect(300,420, 170, 40);
fill(#b65b66);  
rect(300,460,170,40);


}


void mouseReleased(){
  
fill(#6eff6e);  
noStroke();     
ellipse(mouseX,mouseY,100,100);
}



  





void setup (){ 
size(600,600); 
} 
void draw(){ 
if (mouseX < width/2 && mouseY < height/2){ 
background (0,255,0); 
fill(0,0,255); 
ellipse(random(0,width/2),random(0,height/2),50,50); 
}else if (mouseX > width/2 && mouseY < height/2){ 
background(0,0,255) ;
fill(0,255,0); 
rectMode(CENTER); 
rect(random(width/2,width),random(0,height/2),50,50); 
}else if(mouseX < width/2 && mouseY > height/2){
background(0,0,255);
fill(0,255,0);
rectMode(CENTER);
rect(random(0,width/2),random(height/2,height),50,50) ;
}else if (mouseX > width/2 && mouseY > height/2){
background (0,255,0); 
fill(0,0,255); 
ellipse(random(width/2,width),random(height/2,height),50,50);
} 
} 


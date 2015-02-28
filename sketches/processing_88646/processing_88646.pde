
void setup(){
size(600,600);
 //translate 100 horizontally, 100 veritcally
background(0);
noStroke();        
smooth();
}
 
void draw(){ 
  translate(width/2,height/2);
  for(int x=720; x>0;x=x-2){ 
  float m = cos(mouseX);
  rect(0,0,x,x);            
  fill(70+x,10+x,10+x,30);          
  rotate(m);              
  }
}




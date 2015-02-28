
color col = color(random(252));

void setup(){
  size(500,500);
  background(255);
}
void draw(){
  fill(col);
  rect(250,250,20,20);  
 text("LIKE A BAWSSSS!!",200,200);
  if(mousePressed==true){
    if(mouseX>250&&mouseX<250+20&&mouseY>250&&mouseY<250+20){
      col=color(random(252));
      
    text("LIKE A BAWSSSS!!",200,200);
  
}
  }
}
               
                

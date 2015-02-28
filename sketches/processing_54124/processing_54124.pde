
void setup(){
    size(400, 400);
    smooth();
    background(255);
    }
    
void draw(){
   float r = random(20);
   float x = random(screen.width);
   float y = random(screen.height);
   
   line(0,y, x,y);
   line(y,0, x,y);
   rect(mouseX,mouseY, mouseX+20,mouseY+20);
   strokeWeight(r/2);
   stroke(x);
   line(x,y, x,y);
       if(r > 18){
           stroke(0);
           }
       else{
           stroke(255);
           strokeWeight(r*2);
           }
} 
                
                

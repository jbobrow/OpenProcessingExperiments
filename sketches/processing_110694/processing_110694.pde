
/* First Sketch by Aistis Taraskevicius 20.09.2013*/

void setup(){
  background(255,255,255);
  size(600,600);
}

void draw(){
   /* fill(25,168,220);
    rect(0,0,600,200); */
    fill(230,250,0);
    ellipse(100,100,100,100);
    
    

   if (mousePressed == true){
      for(int i=0; i<5; i++){
                 
      if (keyPressed==true){
        if (keyCode==UP){
        stroke (33,236,56); 
        }
        if (keyCode==DOWN){
        stroke(102,76,16);
        }
        if (keyCode==LEFT){
        stroke(230,250,0);
        }
        if (keyCode==RIGHT){
        stroke(25,25,25);
        }
        
          
      line(mouseX+random(5),mouseY+random(5),pmouseX+random(5),pmouseY+random(5));
  }}}}




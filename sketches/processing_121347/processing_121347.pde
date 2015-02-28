
void setup() {
  size(500, 500);
  background(180);
  smooth();
  stroke(51,130,204,10); 
}
 
void draw() {
  
  
    
  line(mouseX,mouseY,250,475);
  line(mouseX,mouseY,250,90);
  
  line(mouseX,mouseY,250,25);
  line(mouseX,mouseY,250,25);
   
  }


void keyPressed(){
  if(key =='b'){
       stroke(51,130,204,10); 
  }
  if(key =='w'){
      stroke(255,255,255,10);
  }
  if(key =='g'){
      stroke(51,130,100,10);
  }
 if (key ==' '){
   background(180);
 }

}




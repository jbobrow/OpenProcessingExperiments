
void setup(){
  
size(700,700);
background(165,150,135);

}
 
void draw(){

}

void mouseDragged() {
   
     
 stroke(255,alpha);
 strokeWeight(random(0,4));
 line(350,350,mouseX,mouseY);
 
 colorMode(RGB);
 stroke(103, 29, 15);
 strokeWeight(random(2,3));
 point(mouseX,mouseY);
  
 alpha = int(random(10,90));
   
}




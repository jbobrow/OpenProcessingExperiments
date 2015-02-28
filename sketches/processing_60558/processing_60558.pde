
void setup (){
size (400, 400);

  background(180, 230, 230);

rectMode(CENTER);
} 


void draw (){
  //background (200);
  
  // if = bedingungen: gibt an was passieren soll, wenn die maus gedrückt wird
  if(mousePressed){
   // fill(0);
    fill(190, 0, 70);
    ellipse(width/2, height/2, mouseX, mouseY);
    
  }
}

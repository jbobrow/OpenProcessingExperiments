
PFont font;
 
void setup(){
  size(300,500);
  strokeWeight(5);
  
  font = loadFont("AgencyFB-Reg-48.vlw");
  textFont(font, 32);

}
 
 
void draw(){
  background((256-mouseY), (256-mouseY), (256-mouseY));
  
  
  
  for(int i = 0; i<200; i++){
  line(i, i, 100, i);
  }
  for(int i = 0; i<200; i++){
  line(i, 500, 100, i);
  }
  for(int i = 0; i<200; i++){
  line(350, i, i, 300);
  }
  
  text("sweep", 175, 340);
  text("away", 175, 360);
  text("the", 175, 380);
  text("dark", 175, 400);
  
}



float Color1 = random(115);
float Color2 = random(115);
float Color3 = random(115);
float Color4 = random(115);
float Color5 = random(115);
float Color6 = random(115);
float Color7 = random(115);
float Color8 = random(115);
float Color9 = random(115);

boolean AltColorRect=false;
 
void setup() {
  size(800, 600);
  colorMode(HSB);
   
  setSelectedColor(350, 231, 100);
 
  setupColorSelector(600, 0, 200, 600, 0);
   
}

void keyReleased() {
   if (key == ' '){
     if (AltColorRect==false){
        AltColorRect=true;
     } else if (AltColorRect==true){
       AltColorRect=false;
     }
   }
    if (key == 'r'){
      Color1=random(400);
      Color2=random(400);
      Color3=random(400);
      Color4=random(400);
      Color5=random(400);
      Color6=random(400);
      Color7=random(400);
      Color8=random(400);
      Color9=random(400);
    }
 
 }
 
void draw() {
   
  noStroke();
  fill(Color1,Color2,Color3);
  rect(0,0,300,600);
  
  fill(Color7,Color8,Color9);
  rect(125,210, 75,100);
   
  fill(Color4,Color5,Color6);
  rect(300,0,300,600);
   
  
   
  fill(selectedColor);
  ellipseMode(CENTER);
  rect(400,210,75,100);
   
   
  if (mousePressed) {
    colorSelectorHandleMouse(mouseX, mouseY); 
  }
   
  drawColorSelector();
   

   
  if(AltColorRect==true){
    fill(Color7,Color8,Color9);
    noStroke();
    rect(200,150,100,300);
     
    fill(selectedColor);
    rect(300,150,100,300);
     
  }
}
 
 



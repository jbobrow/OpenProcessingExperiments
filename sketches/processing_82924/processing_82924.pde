
/*int windowW = 1100;
int windowH = 350;*/
int rectW  = 250;
int rectH  = 250;
int rectSmallW = 10;
int rectSmallH = 10;

int g,b;
int r = 0;
void setup(){
  size(1100,350);
  background (255);
  strokeWeight (2);
  rect(0,60,1099,289);
  strokeWeight (1);
  fill(0);
  text("Farbwirkung", 510,20);
  text("different color effect",485,40);
  text("use mouse"
  ,12,20);
  noFill();
  fill(255,0,0);
  rect(20,30,rectSmallW,rectSmallH);
  fill(0,255,0);
  rect(40,30,rectSmallW,rectSmallH);
  fill(0,0,255);
  rect(60,30,rectSmallW,rectSmallH);
  noFill();
  
  //noLoop();
  
  
  
  
}
void draw(){
  
  
  if(mouseX <= 30 && mouseX >=20 && mouseY <= 40 
      && mouseY >=30){
          r =  255;}
          else{
            r=0;}
//------------------------------
   if(mouseX <= 50 && mouseX >=40 && mouseY <= 40 
      && mouseY >=30){
          g =  255;}
          else{
            g=0;}
//------------------------------
    if(mouseX <= 70 && mouseX >=60 && mouseY <= 40 
      && mouseY >=30){
          b =  255;}
          else{
            b=0;}
//------------------------------

        
        
          
              
          
 // Hintergrundboxen 
  fill(0);
  rect (20,80,rectW,rectH);
  fill(85);
  rect (290,80,rectW,rectH);
  fill(170);
  rect (560,80,rectW,rectH);
  fill(255);
  rect (830,80,rectW,rectH);
  
  //-------------------------------------
  for (int i = 30; i<270;i += 20) {
    for (int j = 90;j < 320;j = j + 20){
      fill(r,g,b);
    rect(i,j,rectSmallW,rectSmallH);
    }
  }
  //-------------------------------------
  for (int a = 300; a<530;a += 20) {
    for (int bb = 90;bb < 320;bb = bb + 20){
      fill(r,g,b);
    rect(a,bb,rectSmallW,rectSmallH);
    }
  }
    //-------------------------------------
  for (int c = 570; c<800;c += 20) {
    for (int d = 90;d < 320;d = d + 20){
      fill(r,g,b);
    rect(c,d,rectSmallW,rectSmallH);
    }
  }
    //-------------------------------------
  for (int e = 840; e<1070;e += 20) {
    for (int f = 90;f < 320;f = f + 20){
      fill(r,g,b);
    rect(e,f,rectSmallW,rectSmallH);
    }
  }
    
/* println( "mouse X-Achse" + mouseX +
 "mouse Y-Achse" + mouseY); */
}



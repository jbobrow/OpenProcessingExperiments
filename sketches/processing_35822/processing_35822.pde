
int amo = 700;

int[] xpos = new int[amo];
int[] ypos = new int[amo];
float[] csize = new float[amo];

void setup() { 
  //--------------CIRCLE-------------------
  

  size (700,400);  
  background (255);

  int i = 0;
  int x = 0;
  int y = 0;

  while (i < amo) {
    if(x >= 350) {
      x = 0;
      y = y + 15;
    }
    
    xpos[i] = 0 + x;
    ypos[i] = y;
    csize[i] = 15;
    
    x = x + 15;
    i = i + 1;
  }

}

void draw() {

if(mouseX < 350){
background(255);
  
//  while (csize < 20){
//  fill(0,0,0,100);}
//  
//  while(csize > 19){
//  fill(170,2,193,100);
// }
 
  fill(0,0,0,100);
  
  strokeWeight(2); 
//    stroke(0);
//    line(0,200,700,200);
//    line(350,0,350,400);
  
  //------------CIRCLE----------------
  noStroke();
  //Draws the graphic
  int j = 0;
  while (j < amo){
    ellipse(xpos[j],ypos[j], csize[j], csize[j]);
    j = j + 1;
  }
  
  //Checks size
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      if(csize[i] <= 15) {
        csize[i] = csize[i] + 80;
      }
    } else {
      if(csize[i] > 15) {
        csize[i] = csize[i]*0.98;
      }
    }
    i = i + 1;
  }
 //---------------line--------------------
    


 strokeWeight(1);
 stroke(random(0,255),random(0,53),random(0,255)); 
 line(525, 300, mouseX, mouseY);
}

 if(mouseX > 350){
 line(525, 300, mouseX, mouseY);
 
 }
}

 

void mousePressed() { 
 //-------------CIRCLE---------------------- 
  int i = 0;
  while (i < amo){
    
    float distance = dist(xpos[i], ypos[i], mouseX, mouseY);
    if(distance < csize[i]/2) {
      csize[i] = 0;
    }
    i = i + 1;
  }
}



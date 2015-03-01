
int numFoglie= 15;
float gradi= 360/numFoglie; 
void setup(){
size (600,500);

}
 
void draw(){
background(255,255,255);
  if (mousePressed == true) {
    fill(0,0,0);
    text("rilascia per avere 8 petali", mouseX, mouseY); 
     numFoglie = 15;
   
  } else {
    fill(0,0,0);
    text("clicca per avere 15 petali", mouseX, mouseY); 
 numFoglie = 8;
    
  }
  
///// Gambo
pushMatrix();
translate (width/2,height);
stroke (0,188,53);
strokeWeight (3);
line (0,0,0,-200); 


 
 
//// centro del fiore
pushMatrix();
fill (255,255,0);
stroke (0);
translate (0,-200);
ellipse (0,0,50,50);
 
 
///Petali
fill(255);
strokeWeight(1);
 
for (int i=0; i<numFoglie;i++){
pushMatrix();
float rad = radians(gradi*i);
rotate (rad);
translate (0,-60);
ellipse (0,0,30,70);
popMatrix();
}
 
popMatrix();
popMatrix();

 
}


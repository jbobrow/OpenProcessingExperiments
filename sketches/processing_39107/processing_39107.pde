
void setup(){
  size(600,400);
  background(200);
  smooth();
  println();
};

int dec=8;
boolean bascul1=true;

void draw(){
  frameRate(30);
  stroke(20,50);
  if(mousePressed){
   line(mouseX,mouseY,pmouseX,pmouseY);
   line(mouseX+dec,mouseY+dec,pmouseX+dec,pmouseY+dec);
   line(mouseX-dec,mouseY-dec,pmouseX-dec,pmouseY-dec);
   line(mouseX+dec,mouseY+dec,pmouseX-dec,pmouseY-dec);
   line(mouseX-dec,mouseY-dec,pmouseX+dec,pmouseY+dec);
   line(mouseX+dec,mouseY-dec,pmouseX+dec,pmouseY-dec);
   line(mouseX-dec,mouseY+dec,pmouseX-dec,pmouseY+dec);
   line(mouseX-dec,mouseY+dec,pmouseX+dec,pmouseY+dec);
   line(mouseX+dec,mouseY-dec,pmouseX+dec,pmouseY+dec);
   line(mouseX+dec,mouseY+dec,pmouseX-dec,pmouseY+dec);
   line(mouseX+dec,mouseY+dec,pmouseX+dec,pmouseY-dec);
   line(mouseX-dec,mouseY+dec,pmouseX+dec,pmouseY-dec);
   line(mouseX+dec,mouseY-dec,pmouseX-dec,pmouseY+dec);
   line(mouseX-dec,mouseY-dec,pmouseX-dec,pmouseY+dec);
   line(mouseX+dec,mouseY-dec,pmouseX-dec,pmouseY-dec);
   line(mouseX-dec,mouseY+dec,pmouseX-dec,pmouseY-dec);
   line(mouseX-dec,mouseY-dec,pmouseX+dec,pmouseY-dec);
   if(bascul1==true){dec++;};
   if(bascul1==false){dec--;};
  }
 
 if(dec==20){bascul1=false;};
 if(dec==2){bascul1=true;};
 }
 
 void keyPressed(){
   if(key=='e'){
     background(200);
   }
 }                              

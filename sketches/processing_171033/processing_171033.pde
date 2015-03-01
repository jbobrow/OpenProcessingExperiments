
int x=1;
int z=1;
float r;
float g;
float b;
boolean lapiz=false;
boolean goma=false;
boolean circulo=false;
boolean colors=false;
boolean fondo=false;

void setup(){
  size(600,600);
  background(255);
}

void draw(){
   
  fill(0);
  rect(0,0,50,30);
  
  fill(255);
  rect(50,0,50,30);
  
   r=random(200);
    g=random(55);
    b=random(150);
    fill(r,g,b);
  rect(100,0,50,30);
  
  fill(150);
  ellipse(165,15,20,20);
  
  r=random(200);
    g=random(55);
    b=random(150);
  fill(r,g,b);
  rect(200,0,50,30);
  
    //line(pmouseX,pmouseY,mouseX,mouseY);
    
  if(lapiz==true){
    if(mousePressed){
      stroke(0);
      line(pmouseX,pmouseY,mouseX,mouseY);
     if(keyPressed){
    if(key=='x'){
         strokeWeight(x);
         x=x+2;}
     }
    }
    if(keyPressed){
    if(key=='z'){
         strokeWeight(z);
         x=x-2;}
         }
  }
     
   if(goma==true){
    if(mousePressed){
  background(255);}
  }
  
     if(colors==true){
        if(mousePressed){
          stroke(r,g,b);
        line(pmouseX,pmouseY,mouseX,mouseY);}
      }
      
     if(circulo==true){
        if(mousePressed){
          ellipse(pmouseX,pmouseY,mouseX,mouseY);}
      }
      
    if(fondo==true){
       if(mousePressed){
         background(r,g,b);}
     }
}
void mousePressed(){
  if((mouseX>0 && mouseX<50) && (mouseY>0 && mouseY<30)){
   lapiz=!lapiz;
   goma = false;
   colors = false;
 circulo = false;
 fondo = false;}
   if((mouseX<100 && mouseX>50) && (mouseY>0 && mouseY<30)){
     goma=!goma;}
   if((mouseX<150 && mouseX>100) && (mouseY>0 && mouseY<30)){
   colors=!colors;}
   if((mouseX>150 && mouseX<200) && (mouseY>0 && mouseY<30)){
     circulo=!circulo;}
   if((mouseX>200 && mouseX<250) && (mouseY>0 && mouseY<30)){
     fondo=!fondo;}
}


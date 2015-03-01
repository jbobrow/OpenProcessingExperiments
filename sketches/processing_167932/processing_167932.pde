
float a;
float b;
boolean boton=true;
void setup()
{
  size(400,400);
  background(0);
 
}

void draw()
{
  a= random(60);
  b= random(110);
   fill(#FCFCFA);
  rect(0,0,40,40);
  
 if(boton==true){
 fill(random(0, 255), random(0, 255), random(0, 255));
   ellipse(random(width),random(height),a,b);
    }else{
    fill(random(0, 255), random(0, 255), random(0, 255));
   rect(random(width),random(height),a,b);  
}
}
  
  void mousePressed(){
   if(mouseX>0 && mouseX<40 && mouseY>0 && mouseY<40 && mousePressed){
     background(0);
      rect(0,0,40,40);
     boton=!boton;
    
   }
  } 
   
 


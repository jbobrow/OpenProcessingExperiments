
int t = 0;

void setup(){
  size(260, 260);
  noStroke();
}
void draw(){
  background(#E8E5E7);
  buclepalado ();
  buclepabajo ();
}
  
void mousePressed(){
  if (mouseButton== LEFT){
    t = t+10;
  }if (t > 255){
    t = 255;
  }
  if (mouseButton == RIGHT){
    t = t-10;
  }if ( t < 0){
    t = 0;
  }
}
    
   
void buclepalado (){
  //declaració variables horitzontal
  int ih = 0;
  int ah = mouseX+5;
  color ch = color(255, 0, 0);
  
  //bucle dibuix de quadrats 
  while (ih < 255){
    fill(ch, t);
    rect(ih, 0, 10, height);
    ih = ih + ah;
  }
}  

void buclepabajo (){
  //declaració varibales vertical 
  int iv = 0;
  int av = mouseY+5;
  color cv = color (0, 255, 0);
  
  //bucle dibuix de quadrats 
  while (iv <255){
    fill (cv, t);
    rect (0, iv, width, 10);
    iv = iv + av;
  }
}





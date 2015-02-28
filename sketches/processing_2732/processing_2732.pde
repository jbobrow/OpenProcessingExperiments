
float margen,d,diam,sp;

void setup(){
  sp=9;
  margen=20;
  size(300,300);
  smooth();

}

void draw(){
  background(255);
  for(float y = margen; y<=height-margen;y+=sp){
    for(float x = margen; x <=width-margen;x+=sp){
      d=dist(mouseX,mouseY,x,y);
      fill(90,d);
      diam=map(d,0,width,30,0); 
      ellipse(x,y,d,d);
      fill(156, 80, d, d);
      triangle(x, diam, sp, d, 90, diam);
      fill(diam,360,sp,d);
      triangle(x,y, d,sp,250,sp);
      float d; 
      
           
      
     
    }
  }
}

void keyPressed(){
  println("Wii lo grabamos:D");
  saveFrame("Uuuh xD.jpg");
}


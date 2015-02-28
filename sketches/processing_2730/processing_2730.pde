
float margen,d,diam,sp;

void setup(){
  sp=160;
  margen=20;
  size(300,300);
  smooth();

}

void draw(){
  background(0,d);
  for(float y = margen; y<=height-margen;y+=sp){
    for(float x = margen; x <=width-margen;x+=sp){
      d=dist(mouseX,mouseY,x,y);
      fill(0,149, 46,d);
      float value = d;
      diam=map(d,0,900,50,width); 
      ellipse(x,y,d,d);
      fill(90,diam,100,d);
      rect(d,d,d,d);
      stroke(14,41,142,d);
      fill(81,160,237,d); 
      strokeWeight(2);
      triangle(x,y,250,260,200,y);
      triangle(30,300,250,260,200,100);
      triangle(x,diam,157,228,diam,diam);
      triangle(60,d,x,y,200,d);
      triangle(x,y,sp/2,sp,80,y);
      triangle(260,sp,250,260,200,sp);
      triangle(300,d,250,260,200,y);
      triangle(0,300,d,228,diam,300);
      triangle(300,0,157,d,sp,0);
      strokeWeight(1);
      stroke(0);
      fill(237,7,96,d);
      rect(d,d,d,d);
      float d;        


    }
  }


}

void keyPressed(){
  saveFrame("CamilayPaula.jpg");
  println("Wii lo grabamos :D");
}









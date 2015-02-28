
//Autor: Manel L.
//titulo: cara de alegria-->toma el sol se pone morena
int fondo=(#FFC8A0);
int gafas=(#00CCFF);
int nariz=(#EFE0CD);
void setup (){
size(200,200);
smooth();
stroke(0);
}
void draw(){
background(fondo);
//ojos
fill(gafas);
ellipse(48,48,40,90);
ellipse(148,48,40,90);
fill(0);
ellipse(50,50,10,20);
ellipse(150,50,10,20);
//boca
fill(209,54,84);
arc(100,120,mouseY/1,mouseX/1,0,PI);
//nariz
fill(nariz);
ellipse(100,90,20,50);
ellipse(90,100,10,20);
ellipse(110,100,10,20);
//mejillas
fill(227,0,19);
ellipse(20,100,20,20);
ellipse(180,100,20,20);
if (mousePressed){
fill(0);
rect(65,40,80,10);
line(1,1,50,50);
line(199,1,150,50);
}
}
void mousePressed(){
  gafas=(0);
  fondo=(#CC7722);
  nariz=(#B87351);
}  
void mouseReleased(){
  gafas=(#00CCFF);
  fondo=(#FFC8A0);
  nariz=(#EFE0CD);

}


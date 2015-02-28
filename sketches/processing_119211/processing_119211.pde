
void setup (){
  
 size (500,500);
}
void draw (){
background (255);
fill(0);
pushMatrix();
translate (300,10);
float elippse = map( mouseX, 500,0 ,0 , 250);
fill (#49FAE4);
ellipse ( 100,100, 80,80);
ellipse ( 90, 50+elippse, 80,80);
ellipse( 60-elippse, 90, 80,80);
popMatrix();
resetMatrix();


translate (50,300);
float vier = map( mouseY, 500,0,0,250);
fill (0);
rect ( 0,0, 50,50);
rect ( 70, 0+vier, 50,50);
rect ( 0+vier,70, 50,50);
rect ( 70, 70-vier, 50,50);

}

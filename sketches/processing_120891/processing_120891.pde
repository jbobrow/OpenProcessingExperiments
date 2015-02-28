
int x = 0;

void setup() {
size(400,500);
background(#AFF467);
}
void draw() {
fill(#663300);
ellipse(200,250,230,230);
fill(255,255,255);
ellipse(155,220,50,50);
fill(255,255,255);
ellipse(245,220,50,50); 
//ojos
if(x == 0 && x < 70){
fill(0,0,0);
ellipse(245,220,15,15);
ellipse(155,220,15,15);
}
//boca y lengua
fill(0,0,0);
arc(200,300,120,120,0,PI);
fill(255,0,0);
arc(200,320,60,120,0,PI);

//animacion pelo y ojos
if(x == 0){
fill(#000000);
triangle(105,183,132,156,98,137);
fill(#000000);
triangle(131,157,169,139,140,104);
fill(#000000);
triangle(176,136,228,137,204,95);
fill(#000000);
triangle(241,140,279,161,266,112);
fill(#000000);
triangle(279,163,303,197,324,167);
}else if(x > 70){
fill(#000000);
triangle(random(85,125),random(163,203),random(112,152),random(136,176),random(78,118),random(117,157));
fill(#000000);
triangle(random(111,151),random(137,177),random(149,189),random(119,159),random(120,160),random(84,124));
fill(#000000);
triangle(random(156,196),random(116,156),random(208,248),random(117,157),random(184,224),random(75,115));
fill(#000000);
triangle(random(221,261),random(120,160),random(259,299),random(141,181),random(246,286),random(92,132));
fill(#000000);
triangle(random(259,299),random(143,183),random(283,323),random(177,217),random(304,344),random(147,187));
fill(0,0,0); 
ellipse(245,220,random(5,20),random(5,20));  
fill(0,0,0);
ellipse(155,220,random(5,20),random(5,20)); 
}
if(mousePressed){
x= x+1;
}
fill(#000000);
line(199,241,212,256);
line(212,256,197,264);
noFill();
rect(128, 193, 55, 55);
rect(218, 193, 55, 55);
line(89,222,128,219);
line(182,219,219,219);
line(273,219,312,222);
fill(#000000);
ellipse(268,245,5,10);
ellipse(262,256,5,10);
ellipse(273,259,5,10);

println(mouseX+","+mouseY);
fill(255,255,255);
  if(mousePressed && x < 70){
  ellipse(201,363,20,20); 
  }
  
fill(0,0,0);
text("Presiona la lengua y aguanta hasta que se tome la pastilla",60,430);

}

void mousePressed(){

}
void mouseReleased(){
}




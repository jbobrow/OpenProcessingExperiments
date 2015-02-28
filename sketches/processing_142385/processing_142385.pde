
void setup() 
{
 size(500,500);
 
 noStroke(); 
 smooth(); 
}

 int a; 
float mx;
float my;
float hx;
float easing = 0.05;

void draw() 
{
background(255,255,255);

//mickey mouse
strokeWeight(width*0.002);
ellipseMode(CENTER);
fill(0,0,0);   //orelles
ellipse(width/5.5,height/5.5,width/2.75,height/2.75);
ellipse(width-width/5.5,height/5.5,width/2.75,height/2.75);
ellipse(width/2,height/1.75,width/1.3,height/1.3);
fill(255,223,183);
ellipse(width/2,height/1.75,width/1.4,height/1.4); //cara
rectMode(CORNERS);
fill(0,0,0);
rect(width/2.6,height/4.75,width-width/2.6,height/2);
fill(255,223,183);
noStroke();
ellipse(width/2.5,height/2,width*0.3,height*0.535);    //elipses front
ellipse(width*0.6,height/2,width*0.3,height*0.535);
fill(0,0,0);
rectMode(CORNER);
fill(0,0,0);
ellipse(width/2,height/1.5,width/2.5,height*0.42);
fill(255,223,183);
rect(width/4,height*0.65,width/2,-height/3.5);
fill(0,0,0);
ellipse(width*0.45,height*0.58,width*0.15,height*0.1);   //nas
fill(255,255,255);
ellipse(width*0.45,height*0.6,width*0.06,height*0.03);  //brillo nas
fill(255,0,0);
ellipse(width*0.55,height*0.825,width*0.25,height*0.17);
fill(0,0,0);
ellipse(width*0.65,height/2,width*0.24,height*0.26);
fill(255,255,255);
ellipse(width*0.65,height/2,width/5,height*0.22);  //ull dret
fill(0,0,0);
fill(255,223,183);
rect(width*0.53,height*0.55,width*0.24,height*0.1);
stroke(255,223,183);
noFill();
strokeWeight(width*0.022);
arc(width/2,height/1.55,width*0.44,height*0.44,width*0.0004,PI-height*0.0004,OPEN);
stroke(255,223,183);
strokeWeight(width*0.06);
arc(width/2,height/1.7,width*0.6,height*0.6,width*0.0004,PI-height*0.0004,OPEN);
stroke(0,0,0);
strokeWeight(width*0.02);
arc(width/2,height/1.55,width*0.4,height*0.4,0,PI-height*0.0001,OPEN);
fill(0,0,0);
strokeWeight(0);
rect(width/1.8,height*0.545,width/5.1,height/80);  //rect ull
strokeWeight(width*0.002);
noStroke();
fill(0,0,0);  //ull esquerre
ellipse(width*0.28,height/2,width/5,height*0.26);
fill(255,255,255);
ellipse(width*0.28,height/2,width*0.16,height*0.22);
fill(0,0,0);
fill(255,223,183);
rect(width/6,height*0.55,width*0.206,height*0.1);
fill(0,0,0);
rect(width/5.3,height*0.535,width/5.5,height/60);
triangle(width*0.14,height*0.45,width*0.14,height*0.7,width*0.18,height*0.66);
triangle(width*0.851,height*0.41,width*0.863,height*0.7,width*0.8,height*0.66);
fill(0,0,0);
rect(width/4,height*0.65,width/2.2,height/40);
fill(255,223,183);
rect(width/5,height*0.632,width/1.7,height/50);
rect(width/1.89,height*0.55,width/4,height/50);

//moviment ulls
 if(abs(mouseX - mx) > 0.1) {
   mx = mx + (mouseX - mx) * easing;
 }
 if(abs(mouseY - my) > 0.1) {
   my = my + (mouseY- my) * easing;
 }
  if(abs(mouseX - hx) > 0.1) {
   hx = hx + (mouseX- hx) * easing;
 }
 
 mx = constrain(mx, width*0.61, height*0.69);  
 my = constrain(my, width*0.44, height*0.5);
 fill(0,0,0);  
 noStroke();
 smooth();
 ellipse(mx, my, width*0.08, width*0.08);
 
 hx = constrain(hx, width*0.24, height*0.31); 
 my = constrain(my, width*0.44, height*0.5); 
 fill(0,0,0);  
 noStroke();
 smooth();
 ellipse(hx, my, width*0.08, width*0.08);
 
}


//GREEN LANTERN
void setup() {
  size(700,700);
  noStroke();
}

 int a; 
float mx;
float my;
float hx;
float easing = 0.05;

void draw(){
  background(255);
  //marc de fons
  fill(118,190,91,127);
  ellipse(width/2,height/2,(2*width)/3,(2*height)/3);
  fill(28,100,1,127);
  ellipse(width/2,height/2,(2*width)/3.25,(2*height)/3.25);
  //s'ha dividit el size en una cuadricula de 18x18 on s'ha dibuixat el personatge
  //cabell
  fill(55,31,21);
  rect((6.5*width)/18,(7*height)/18,(5*width)/18,(3*height)/18); 
  //face
  fill(250,214,182);
  rect((7*width)/18,(8*height)/18,(4*width)/18,(3.5*height)/18);  
  //barveta
  fill(221,187,159);
  rect((7*width)/18,(10.5*height)/18,(4*width)/18,height/18);
  rect((8*width)/18,(11*height)/18,(2*width)/18,height/18);
  triangle((11*width)/18,(10*height)/18,(11*width)/18,(11*height)/18,(10*width)/18,(11*height)/18); 
  triangle((7*width)/18,(10*height)/18,(7*width)/18,(10.5*height)/18,(7.5*width)/18,(10.5*height)/18);  
  //mascara
  fill(118,190,91);
  quad((10.5*width)/18,(8.5*height)/18,width/2,height/2,width/2,(10*height)/18,(10.5*width)/18,(9.5*height)/18);
  quad((7.5*width)/18,(8.5*height)/18,width/2,height/2,width/2,(10*height)/18,(7.5*width)/18,(9.5*height)/18);  //mascara
  //tupé
  fill(55,31,21);
  triangle((7*width)/18,(7*height)/18,(11*width)/18,(7*height)/18,(8*width)/18,(6*height)/18);
  quad((8*width)/18,(6*height)/18,(11*width)/18,(6*height)/18,(10.5*width)/18,(6.5*height)/18,(11.5*width)/18,(7.5*height)/18);
  //simbol green lantern
  fill(118,225,91);
  quad(mouseX-(width/18),mouseY+(height/18),mouseX+(width/18),mouseY+(height/18),mouseX-(width/18),mouseY-(height/18),mouseX+(width/18),mouseY-(height/18));
  ellipse(mouseX,mouseY,width/15,height/15);
 
  //ulls en moviment 
    if(abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
    }
    if(abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
    }
    if(abs(mouseX - hx) > 0.1) {
    hx = hx + (mouseX- hx) * easing;    //aquesta part de codi l'he tret i modificat a partir d'un trobat per internet   
    }
 
  mx = constrain(mx,(width/2)-(width/32),(width/2)-(width/64));  
  my = constrain(my,height/2,(height/2)+(height/64));
  fill(255);  
  smooth();
  ellipse(mx, my, width/64, width/64);
 
  hx = constrain(hx,(width/2)+(width/64),(width/2)+(width/32)); 
  my = constrain(my,height/2,(height/2)+(height/64));   
  noStroke();
  smooth();
  ellipse(hx, my, width/64, width/64);
}



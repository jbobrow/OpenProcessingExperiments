
void setup() {
 size(600,600);
 background(240);  
  smooth();
  noLoop();

    float r;
 
}
 void draw (){}

void keyTyped() {
  
   float r=key;
  
   if(keyPressed) {
    if (key == 'a' || key == 'A') {fill(193,39,45,50);r=280;}
    else if  (key == 'q' || key == 'Q')  { fill(237,28,36,50); r= 270;}
    else if  (key == 'a' || key == 'A')  { fill(241,90,36,50); r= 260;}
    else if  (key == 'z' || key == 'Z')  { fill(247,147,30,50); r= 250;}
    else if  (key == 'w' || key == 'W')  { fill(251,176,59,50); r= 240;}
    else if  (key == 's' || key == 'S')  { fill(252,238,33,50); r=230;}
    else if  (key == 'x' || key == 'X')  { fill(217,224,33,50); r= 220;}
    else if  (key == 'e' || key == 'E')  { fill(140,198,63,50);r=200;}
    else if  (key == 'd' || key == 'D')  { fill(57,181,74,50);r=190;}
    else if  (key == 'c' || key == 'C')  { fill(0,146,69,50);r=180;}
    else if  (key == 'r' || key == 'R')  { fill(0,104,55,50);r=170;}
    else if  (key == 'f' || key == 'F')  { fill(34,181,115,50);r=160;}
    else if  (key == 'v' || key == 'V')  { fill(0,169,157,50);r=150;}
    else if  (key == 't' || key == 'T')  { fill(41,171,226,50);r=140;}
    else if  (key == 'g' || key == 'G')  { fill(0,113,188,50);r=130;}
    else if  (key == 'b' || key == 'B')  { fill(46,49,146,50);r=120;}
    else if  (key == 'y' || key == 'Y')  { fill(27,20,100,50);r=110;}
    else if  (key == 'h' || key == 'H')  { fill(102,45,145,50);r=100;}
    else if  (key == 'n' || key == 'N')  { fill(147,39,143,50); r=90;}
    else if  (key == 'u' || key == 'U')  { fill(158,0,93,50);r= 80;}
    else if  (key == 'j' || key == 'J')  { fill(212,20,90,50);r=70;}
    else if  (key == 'm' || key == 'M')  { fill(237,30,121,50);r=60;}
    else if  (key == 'i' || key == 'I')  { fill(0,50);r=50;}
    else if  (key == 'k' || key == 'K')  { fill(50,50);r=40;}
    else if  (key == 'o' || key == 'O')  { fill(100,50);r=30;}
    else if  (key == 'l' || key == 'L')  { fill(150,50);r=20;}
    else if  (key == 'p' || key == 'P')  { fill(255,50); r=10;}
    
    else if (key ==' ') {background (240);}
    
    else if (key=='6') {saveFrame("square");};
 

//coordinate palle
      float a= random(0,600)+r*1.5; 
      float b= random(0,600)+r*2;
      float c= random(0,600)+r*2;
      float d= random(0,600)+r*2;
      float e= random(0,600)+r*2;
      float f= random(0,600)+r*2;

//sistem
stroke(255);
strokeWeight(1);

rectMode(CENTER);

  rect( a, b, r, r);
  rect( b,c, r,r);
  rect( c, d,r,r);
  rect( e, f,r,r);   
     
   fill(255, 50); 
 
strokeWeight(0.5);
beginShape();
vertex(a,b);
vertex(b,c);
vertex(c,d); 
vertex (e,f);
endShape(CLOSE);
  
    
redraw ();

}
}



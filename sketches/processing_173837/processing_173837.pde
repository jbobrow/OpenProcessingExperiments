
boolean mouseIsDown = false;

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;

 
void setup()
{
  size(1000,900, P3D);
   minim = new Minim(this);
    jingle = minim.loadFile("Ylvis - The Fox [Official music video HD].mp3", 1024);
    jingle.loop();
  background(random(0,255),random(0,255),random(0,255));
}
 
void draw()
{
  strokeWeight(abs(pmouseX-mouseX));
  stroke(random(255),random(255),random(255));
  filter(POSTERIZE,6);
  //filter(DILATE);
  if(mouseIsDown == true)
  {
    //size(800,800); 


//background(255,221,219); 


//noStroke(); 


fill(78,79,82); 

noStroke(); 

ellipse(pmouseX, pmouseY,60,60);
ellipse(width-pmouseX,pmouseY,60,60);

//oreja parte grande
ellipse(pmouseX+110, pmouseY-5,60,60); 
ellipse(width-pmouseX+110, pmouseY-5,60,60);
fill(255,221,219); 

//oreja parte pekeña
 


fill(random(255),20,255); 


ellipse(pmouseX+59, pmouseY+59,129,120); 
ellipse(width-pmouseX+59, pmouseY+59,129,120); 
//color del ojo

fill(#FF0808); 


ellipse(pmouseX+39, pmouseY+39,40,40); 
ellipse(width-pmouseX+39, pmouseY+39,40,40);
//ojo derecho
ellipse(pmouseX+79, pmouseY+39,40,40); 
ellipse(width-pmouseX+79, pmouseY+39,40,40); 
//color de adentro
fill(455,255,255); 

//brillo izquierdo
ellipse(pmouseX+39, pmouseY+29,10,10); 
ellipse(width-pmouseX+39, pmouseY+29,10,10); 
//brillo derechp
ellipse(pmouseX+79, pmouseY+29,10,10); 
ellipse(width-pmouseX+79, pmouseY+29,10,10);

fill(255,221,219); 

//nariz
ellipse(pmouseX+59, pmouseY+69,15,15); 
ellipse(width-pmouseX+59, pmouseY+69,15,15);

fill(255,255,255); 
//cuadro izquierdo

//rect(345,225,10,10); 

//cuadro derecho
//rect(475,225,10,10); 


stroke(4); 

//boca
strokeWeight(20); 

//posicion de boca
line(pmouseX+29, pmouseY+89,pmouseX+89, pmouseY+89); 
line(width-pmouseX+29, pmouseY+89,width-pmouseX+89, pmouseY+89);


    //fill(random(0,255),random(0,255),random(0,255),random(0,255));
 //rect(pmouseX, pmouseY, random(0,20), random(0,20));
 //rect(width-pmouseX,pmouseY, random(0,20) ,random(0,20));
  }
}
void mousePressed()
{
mouseIsDown = true;
println("Mouse was pressed");
}
void mouseReleased()
{
  mouseIsDown = false;
  println("Mouse was released");
}




//import processing.pdf.*;
import controlP5.*;
ControlP5 cp5;
float rotY = 0;
float rotX = 0;
float rotZ = 0;
float x = 0;
float y = 0;
float z = 0;
int size = 50;
float rand = 255;
void setup()
{
size(700, 700, P3D); 
//beginRecord(PDF, "cube.pdf");
background(255);
lights();
cp5 = new ControlP5(this);

cp5.addSlider("rotY")
     .setPosition(550,40)
     .setRange(-100,100)
     .setNumberOfTickMarks(11)
     ;
     
cp5.addSlider("rotX")
     .setPosition(550,60)
     .setRange(-100,100)
     .setNumberOfTickMarks(11)
     ;
     
     
cp5.addSlider("rotZ")
     .setPosition(550,20)
     .setRange(-100,100)
     .setNumberOfTickMarks(11)
     ;

     
cp5.addSlider("size")
     .setPosition(550,80)
     .setRange(0,300)
     ;
}

void draw()
{
fill(255);
stroke(0);
pushMatrix();
translate(width/2, height/2 + 50, 0);
rotateY(y);
//rand = random(0,255);
//fill(rand);
rotateX(x);
rotateZ(z);
box(size);
popMatrix();

y = y + rotY/100;
x = x +rotX/100;
z = z + rotZ/100;
delete();

}



void delete()
{
  if (keyPressed== true) 
  {  
  if (key == 'd' || key == 'D') 
    {
      ((Slider) cp5.getController("rotY")).hide(); 
     ((Slider) cp5.getController("rotX")).hide(); 
     ((Slider) cp5.getController("rotZ")).hide(); 
     ((Slider) cp5.getController("size")).hide();
     noStroke();
     fill(255);
     rect(540,10,200,200);  
    }
    if (key == 's' || key == 'S') 
    {
     saveFrame("cube2.jpeg"); 
    }
    
  }
}


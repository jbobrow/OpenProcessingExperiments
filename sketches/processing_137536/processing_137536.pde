
// Cloudgame by www.zanne.nl
/*Mouse-left: Move your monster by dragging it with the mouse. 
  Mouse-right: fire
  key 's': save frame
  */
  
Draagbaar draagbaar;
Barikade[] bar = new Barikade[5];
WolkSchat[] wolkSchat1 = new WolkSchat[5];
WolkSchat[] wolkSchat2 = new WolkSchat[5];
PImage zon;

color []palette = { #FF4A00, #1453CC, #A70054, #7B1BFF};
void setup()  {
size (800,600);
float r = random(0,255);
zon = loadImage("zon.png");


for (int i=0 ; i< bar.length ;i++)  {
 bar[0] = new Barikade (0,random(height),285,100,1);
 bar[1] = new Barikade (100,random(height),285,100,2);
 bar[2] = new Barikade (200,random(height),285,100,3);
 bar[3] = new Barikade (300,random(height),285,100,3);
 bar[4] = new Barikade (400,100,285,100,3);
}

draagbaar = new Draagbaar (400,200,100,100);

for (int i = 0 ; i<wolkSchat1.length ; i++)  {
wolkSchat1[i] = new WolkSchat(color( 200+r,200+r,10+r));
r = random(0,155);
}
for (int i = 0 ; i<wolkSchat1.length ; i++)  {
wolkSchat2[i] = new WolkSchat( #EA1865);
}
}


void draw()  {
  fill(210,220,230);
  background (220,230,240);
  noStroke();
  image (zon,0,0);
  
 // rect (0,0,width,200);
  draagbaar.display();
  draagbaar.drag(mouseX, mouseY);
  
  
  for (int i=0 ; i< bar.length ;i++)  {
  bar[i].display();
  //draagbaar.wolkPunt((bar[i]))
  ;

if (draagbaar.intersect(bar[i]))  {
  draagbaar.getHit();
 //println ("true"); 
 //rect (400,100,110,110);
}

  if (draagbaar.balHit(bar[i])) {
     println ("YES doelpunt!"); 
     //draagbaar.wolkPunt((bar[i]));
     //wolkSchat.display();
     for (int j = 0 ; j<wolkSchat1.length ; j++)  {
     wolkSchat1[i].setPos(bar[i]);
     wolkSchat2[i].setPos(bar[i]);
  } 
  }
      if (draagbaar.wolkBlok2 =true) {
        for (int j = 0 ; j<wolkSchat1.length ; j++)  {
          
  wolkSchat1[i].display();  
  
      }  }
      
 //println (draagbaar.shooting);
  
}

  
  
    if (draagbaar.shooting=true) {
  draagbaar.shoot();  
  }
 //println (draagbaar.shooting);
  
}

void mousePressed() {
  if (mouseButton==LEFT)  {
  draagbaar.clicked(mouseX, mouseY);
  }
  else {
    draagbaar.stopShoot(); 
  }
 }

void mouseReleased()  {
  draagbaar.stopDrag();
}
void keyPressed () {
  if (key=='s')  {
    saveFrame("image1.jpg");
  }}
class Barikade {
  float x;
  float y;
  float b;
  float h;
  float rand1;
  float cur1;
  float rand2;
  float cur2;
  float speed;
  
  boolean draged = false;
  
  Barikade (float tx, float ty, float tb, float th, float ts)  {
    x = tx;
    y = ty;
    b = tb;
    h = th;
    speed = ts;
    //y = random (width);
  }
  
  void display()  {
 x = x +speed;
 rand1 = random(0,1);
 cur1 = cos(rand1)*10;
 
 rand2 = random(0,1);
 cur2 = sin(rand1)*5;
//x=500;
    /////////////////////////////Cloud
    pushMatrix();
  //  scale(random(0.5,0.6));
translate(-220, -240);
beginShape();
strokeWeight(1.2);
stroke(0);
fill(200,200,255);
vertex(245+x, 325+y);
bezierVertex(245+x,325+y, 165+x+cur1, 300+y+cur2, 255+x, 280+y);
bezierVertex(255+x,280+y, 234+x+cur1, 220+y+cur2, 315+x, 240+y);
bezierVertex(315+x,240+y, 340+x+cur1, 190+y+cur2, 370+x, 230+y);
bezierVertex(370+x,230+y, 410+x+cur1, 210+y+cur2, 426+x, 250+y);
bezierVertex(426+x,250+y, 460+x+cur1, 220+y+cur2, 475+x, 274+y);
bezierVertex(475+x,274+y, 515+x+cur1, 270+y+cur2, 500+x, 310+y);
bezierVertex(500+x,310+y, 526+x+cur1, 330+y+cur2, 490+x, 340+y);
bezierVertex(490+x,340+y, 480+x+cur1, 390+y+cur2, 440+x, 340+y);
bezierVertex(440+x,340+y, 430+x+cur1, 380+y+cur2, 390+x, 355+y);
bezierVertex(390+x,355+y, 360+x+cur1, 390+y+cur2, 350+x, 350+y);
bezierVertex(350+x,350+y, 320+x+cur1, 380+y+cur2, 300+x, 340+y);
bezierVertex(300+x,340+y, 270+x+cur1, 370+y+cur2, 245+x, 325+y); 
endShape();

beginShape();
vertex (255+x,280+y);
bezierVertex (255+x, 280+y, 265+x, 290+y, 270+x, 290+y);
endShape();

beginShape();
vertex (315+x,240+y);
bezierVertex (315+x, 240+y, 325+x, 250+y, 315+x, 260+y);
endShape();

beginShape();
vertex (370+x,230+y);
bezierVertex (370+x, 230+y, 355+x, 240+y, 350+x, 250+y);
endShape();

beginShape();
vertex (426+x,250+y);
bezierVertex (426+x, 250+y, 425+x, 260+y, 430+x, 270+y);
endShape();

beginShape();
vertex (475+x,274+y);
bezierVertex (475+x, 274+y, 470+x, 280+y, 470+x, 290+y);
endShape();

beginShape();
vertex (500+x,310+y);
bezierVertex (500+x, 310+y, 495+x, 305+y, 490+x, 310+y);
endShape();

beginShape();
vertex (490+x,340+y);
bezierVertex (490+x, 340+y, 490+x, 330+y, 475+x, 330+y);
endShape();

beginShape();
vertex (440+x,340+y);
bezierVertex (440+x, 340+y, 445+x, 325+y, 420+x, 320+y);
endShape();

beginShape();
vertex (390+x,355+y);
bezierVertex (390+x, 355+y, 395+x, 330+y, 380+x, 330+y);
endShape();

beginShape();
vertex (350+x,350+y);
bezierVertex (350+x, 350+y, 360+x, 340+y, 360+x, 330+y);
endShape();

beginShape();
vertex (300+x,340+y);
bezierVertex (300+x, 340+y, 300+x, 320+y, 310+x, 320+y);
endShape();

beginShape();
vertex (245+x,325+y);
bezierVertex (245+x, 325+y, 260+x, 325+y, 260+x, 315+y);
endShape();

popMatrix();
    
    ////////////////////////////////
        fill(0);
  // rect (x, y, b, h);
   
    if (x == width+10) x=-300;
    if (y == height+10) y=0;
  }


}
   
class Draagbaar  {
  float x;
  float y;
  float hoogte;
  float breedte;
  float kogel;
  float offsetx;
  float offsety;
  float random;
  color c = color (240,60,50);
  float bulokx;
  float buloky;
  boolean shooting =false;
  boolean draging =false;
  boolean wolkBlok=false;
  boolean wolkBlok2=false;

float kSize =60;
  
  Draagbaar ( float tx, float ty, float tb ,float th)  {
   x=tx;
  y=ty; 
 breedte=tb;
 hoogte=th;
 offsetx=0;
 offsety=0;
 wolkBlok =false;
  }
 
 void display ()  {
 
   wolkBlok =false;
    if (draging) fill (50);
    else fill (c);
  
  ///////////////////////////////////////////Monster
  pushMatrix();
translate(0, -122);

beginShape();
strokeWeight(1.5);
stroke(0);
vertex(0+x, 220+y);
bezierVertex(0+x,220+y, 110+x, 0+y, 100+x, 220+y);
bezierVertex(100+x,220+y, 100+x, 230+y, 00+x, 220+y);
endShape();

beginShape();    //Upperlip
fill(240,100,100);
vertex(100+x,190+y);
bezierVertex(100+x,190+y, 30+x, 190+y, 100+x, 180+y);

endShape();

beginShape();    //Lowerlip
fill(255,80,80);
vertex(100+x,190+y);
bezierVertex(100+x,200+y, 30+x, 190+y, 100+x, 190+y);
endShape();

fill (250);      //eyewhite
ellipse (75+x, 160+y,15,15);

fill (0);        //pupil
ellipse (75+x+random, 160+y+random,5,5);

popMatrix();
 //////////////////////////////////////////// 
 noFill();
 noStroke();
 rect (x , y, breedte, hoogte); //////invisable dragging aid
y++;
    if (y>height) {
    y=0; x=x-100; shooting=false; kogel =0;
  c = color (140,160,250);
}
    //if (kogel>300) kogel =0;
 }
 void clicked(int mx, int my)  {
      if ( mx > x && mx < x + breedte && my > y && my < y + hoogte )   {
        draging = true; 
      
        
     /*   if (my>200)  {         ///////////////////////the user is not allowed to drag under horizon
          draging = false;  
        my=0;
      shooting =true;  }   */
        offsetx = x-mx;
        offsety = y-my;
        
 } }
 void shoot()  {
  //kogel = kogel + random (0,10);
  kogel = kogel +10;
    pushMatrix();
    fill(20,250,0);
translate(0, -122);
beginShape();
   fill (0);  
//ellipse (75+x+random, 160+y+random,5,5);   
ellipse (75+x+kogel, 160+y+kogel,kSize,kSize); ////////////////////////bullit
bulokx =  75+x+kogel;
buloky = 160+y+kogel;
shooting =false;


popMatrix();
 }
 void stopShoot()  {
   kogel =0; 
 }
 
 void drag(int mx, int my)  {
if (draging)  {
 // kogel =0;
          x=mx+offsetx;
          y=my+offsety;   
          random = random(0,3);
   }
 }
 void stopDrag()  {
   draging = false;
 }
 
 ///////////////////////////////inspect if the draagbaar intersects with the cloud.
 boolean intersect(Barikade d)  {
   if (x>d.x && x< d.x+d.h && y>d.y && y< d.y+d.b)  {
    return true;
   

  }
    
    else  {
      return false;
    }
  }
  
   boolean balHit (Barikade d)  {
 if (bulokx>d.x && bulokx< d.x+d.h && buloky>d.y && buloky< d.y+d.b)  {
         //println ("kogel raakt wolk");
     wolkBlok2 = true;

        return true;
       
      }
    
    else  { 
       wolkBlok2 = false;
      return false;
      
    }
  }
  
  void getHit ()  {  /////////////////draagbaar hits a cloud
     fill(#EA1865);
     ellipse(200+x,y,10,10);
     ellipse(x,y+200,10,10);
     ellipse(50+x,y+200,10,10);
     ellipse(90+x,y+200,10,10);
     ellipse(x+200,y+200,10,10);
     ellipse(150+x,y+240,10,10);
     
     c = color (240,60,50);
  // x-=10; //y-=10;
  }
  
  void wolkPunt (Barikade d)  {
    
   
 
    
     rect (d.x+100, d.y, 100,20);

 } 
 
}
class WolkSchat {
  float x;
  float y;
  float speed;
  color c;
  
  WolkSchat (color tc) {
  c = tc;  
  }
  
  void setPos ( Barikade d) {
    x = d.x;
    y = d.y;
    speed = d.speed;
  }
    void display() {
    fill (c);
    ellipse (x,y,100,100);
    // x = constrain (x, x +speed,0.1);
    x=x+ speed/5;
  }
}
    



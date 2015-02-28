
//tan angle
float dx,dx1,dx2;
float dy,dy1,dy2;
// arc and ellispe center
int x1 =120, x2 =300,x3=470;
int y1=500,y2=500,y3=500;
// strating point of elllipse
float h1=-PI,h2=-PI,h3=-PI;
//text position
int tx1 =100,tx2 =250,tx3=400;
int ty1=400,ty2=400,ty3=400;
//fill color
int color1, color2, color3;
 
 
Circular_slider slider1,slider2,slider3;
 
void setup()
{
  size(600,600);
  smooth();
  color1 =220;
  color2 =55;
  color3 =0;
}
 
void draw()
{  
   
  background(255,0,136);
  slider1 = new Circular_slider(x1,y1,h1,tx1,ty1,color1);
  slider2 = new Circular_slider(x2,y2,h2,tx2,ty2,color2);
  slider3 = new Circular_slider(x3,y3,h3,tx3,ty3,color3);
  if(mousePressed && dist(x1,y1,mouseX,mouseY)< 100 ){
     dx = mouseX - x1;
     dy = mouseY - y1;
     h1 = atan2(dy,dx); 
    }
  if(mousePressed && dist(x2,y2,mouseX,mouseY)< 100 ){
     dx1 = mouseX - x2;
     dy1 = mouseY - y2;
     h2 = atan2(dy1,dx1);
  }
  if(mousePressed && dist(x3,y3,mouseX,mouseY)< 100 ){
     dx2 = mouseX - x3;
     dy2 = mouseY - y3;
     h3 = atan2(dy2,dx2);
  }
    slider1.display();
    slider1.messages();
    slider2.display();
    slider2.messages();  
    slider3.display();
    slider3.messages();
     
    /*----------accessing the valu from class element-----------------*/
    int lost = slider1.t;
    text(lost,20,20);
    int lost2 = slider2.t;
    text(lost2,80,20);
    int lost3 = slider3.t;
    text(lost3,120,20);
    /*-----------------important----------*/
}
class Circular_slider{
  //Gloabl variable
  int x,y,t,k,fillcolor;
  float angle;
  int textx,texty;
  //Constructor
  Circular_slider(int a/*X cordiante*/, int b/*Y cordiante*/, float c/*anglee*/, int tx, int ty, int xcolor){
     x = a;
     y = b;
     angle = c;
     textx =tx;
     texty =ty;
     fillcolor = xcolor;
  }
  //Function
   
  void display()
  {
    noStroke();
    fill(fillcolor);
    arc(x,y, 110, 110 ,-PI,angle);
    println(angle);
    fill(135,255,0);
    ellipse(x,y,90,90);
  }
   
  void messages()
  {
    k = int(map(degrees(angle),-180,+180,0,100));
    fill(255);
    textSize(10);
    text( "Level = "+k, textx,texty);
    text("Degrees = " + degrees(angle),textx,texty+20);
    t = int(map(k,0,100,0,255));
    text( "Brightness = " + t, textx,texty+40);
  } 
 
}

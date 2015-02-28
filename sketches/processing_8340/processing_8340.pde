
XMLElement xml;
XMLElement gpx;
XMLElement trkseg;
ArrayList zigzag;
ArrayList spine;
float biglat;
float smalllat;
float biglon;
float smalllon;

//render adjustment values
import controlP5.*;
ControlP5 controlP5;
int xoff;  //X offset
int yoff;  //Y offset
int xscale;
int yscale;
boolean lines;

void setup() {
  size(900, 900);
  smooth();
    zigzag = new ArrayList();
  import_gpx("zigzag.gpx",zigzag);
  spine = new ArrayList();
  import_gpx("spine.gpx",spine);
  
  
   biglat = 0;
   smalllat = 100;
   biglon = -100;
   smalllon = 0;
   set_trail_minmax(zigzag);
   set_trail_minmax(spine);

          println("Lat "+biglat+":"+smalllat);
          println("Lon "+biglon+":"+smalllon);
          
  xoff = 400;
  yoff = 400;
  xscale = 50;
  yscale = 50;
  lines=false;
  controlP5 = new ControlP5(this);
  controlP5.addButton("lines",0,10,130,80,19);
  
  //navigation buttons
    controlP5.addButton("up",    0,50,  30,30,19);
    controlP5.addButton("down",  0,50,  70,30,19);
    controlP5.addButton("left",  0,20,  50,30,19);
    controlP5.addButton("right", 0,80,  50,30,19);
  //zoom buttons
  
    controlP5.addButton("in",0,50,10,18,19);
    controlP5.addButton("out",0,70,10,18,19);
    
}
void draw()
{
  background(10,200,10);
  
  draw_trail(zigzag,color(20,20,100));
  draw_trail(spine,color(100,20,20));
  

 }

void set_trail_minmax(ArrayList points)
{
     for(int j = 0; j<points.size(); j++)
     {
       Point P = (Point) points.get(j);
       if(biglat<P.lat)
       {biglat=P.lat;}
       if(biglon<P.lon)
       {biglon=P.lon;}
       if(smalllat>P.lat)
       {smalllat=P.lat;}
       if(smalllon>P.lon)
       {smalllon=P.lon;}
     }
}
  

//button functions
public void lines(int theValue) {
  lines = !lines;
}
public void up(int theValue) {
  yoff += 10;
}
public void down(int theValue) {
  yoff -= 10;
}
public void left(int theValue) {
  xoff +=10;
}
public void right(int theValue) {
  xoff -= 10;
}
public void in(int theValue) {
  xscale += 10;
  yscale += 10;
}
public void out(int theValue) {
  xscale -= 10;
  yscale -= 10;
}


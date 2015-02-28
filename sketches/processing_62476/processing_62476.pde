
//******************************************************
//Class building
//******************************************************
class building{
int lotGLI;
int lotMT;
int lotTele;
float lat;
float long;
String name;
String street;
String streetNum;
String city;
String zipcode;
String country="Belgique";
float scale; // transformation of coordinates into pixels --to be determined
private int point_size=1;
private int delta=1;
//-----------------------------------
//Method drawGLI
//-----------------------------------
void drawGLI(Boolean glow){
if (glow){
fill(255,0,0,128);
stroke(255,0,0,128);
ellipseMode=CENTER;
ellipse(mapscale(lat,scale),mapscale(long,scale),point_size,point_size);
point_size=point_size+delta;
if (point_size==10) delta=-1;
if (point_size==1) delta=1;

}
else point_size=10;
}

}
//******************************************************
//End Class building
//******************************************************

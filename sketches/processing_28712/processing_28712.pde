
//Original source snippets in C
//http://www.codeproject.com/KB/graphics/Sphere_mapping.aspx
//Converted to Processing by Owaun Scantlebury
// Check this out : http://www.youtube.com/watch?v=qgErv6M19yY
// How Globes are made
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
String fn = "http://www.codeproject.com/KB/graphics/Sphere_mapping/worldmap4.gif";
PImage pick;
PImage karl;
float  MapCoordinate(float i1, float i2, float w1,
float w2, float p)
{
  return ((p - i1) / (i2 - i1)) * (w2 - w1) + w1;
}
PImage imgBitmap;
float  phi0 = 0.0;
float phi1 = PI;
float theta0 = 0.0;
float theta1 = 2.0*PI;
float radius = 100.0;
int hm;
int wm;
void keyPressed(){
  if (keyCode == UP){
    // theta0+=1;
    xaxis+=1;
  }
  if (keyCode == DOWN){
    // theta0-=1;
    xaxis -=1;
  }

  if (keyCode ==LEFT){
    // phi0 -=1;
    yaxis -=1;
  }

  if (keyCode ==RIGHT){
    //phi0 +=1;
    yaxis +=1;
  }

  if (key=='u')umbrella=!umbrella;
  if(key=='a')animate=!animate;
}
boolean firstpass= true;
int im = 0;
int em=0;

float [] _ix;
float [] _iy;
int ix;
int iy;
float theta;
float [] _theta;
float phi;
float [] _phi;
float x;
float [] _x;
float y;
float [] _y;
float z;
float [] _z;
PImage beat;
boolean umbrella = false;
boolean animate = false;
int dmode = 0;
int stepw;
int steph;
int by =7;
void setup(){
  fn = "http://www.google.com/images/logos/ps_logo2.png";
  if (online)animate=true;

  imgBitmap=createImage(48,48,ARGB);
  im=imgBitmap.width/2;
  em=imgBitmap.height/2;
  karl= new PImage(imgBitmap.width,imgBitmap.height);
  _ix = new float [imgBitmap.width*imgBitmap.height];
  _iy = new float [imgBitmap.width*imgBitmap.height];
  _theta = new float [imgBitmap.width*imgBitmap.height];
  _phi = new float [imgBitmap.width*imgBitmap.height];
  _x= new float [imgBitmap.width*imgBitmap.height];
  _y= new float [imgBitmap.width*imgBitmap.height];
  _z= new float [imgBitmap.width*imgBitmap.height];
  beat = createImage(imgBitmap.width,imgBitmap.height*2,ARGB);
  pick = new PImage(imgBitmap.width,imgBitmap.height);
  karl.filter(INVERT);
  size(255,255,P3D);

  lights();
  wm = int(width/4);
  hm = int(height/4);
  cam = new PeasyCam (this,width);

}

void draw()
{
  background(-1); 
  int res =1;
  stepw ++;
  steph++;
  //stepw =imgBitmap.width;

  //steph=imgBitmap.height;
  if (stepw>im)stepw = 1;
  if (steph>em)steph = 1;

  if (!animate){
    stepw=im;
    steph=em; 
  }
  for (int i = 0; i < imgBitmap.width; i+=res)
  {
    beginShape(QUAD_STRIP);
    for (int j = 0; j < steph; j+=res)
    {
      int pos = i +imgBitmap.width*j;

      // map the angles from image coordinates
      if (firstpass){

        theta = MapCoordinate(0.0, imgBitmap.width - 1,
        theta1, theta0, i);
        _theta[pos]=theta;
        phi = MapCoordinate( 0.0, imgBitmap.height - 1,phi0,
        phi1, j);

        _phi[pos]=phi;

      }
      // find the cartesian coordinates
      if (firstpass){
        x = radius * sin(phi) * cos(theta);
        _x[pos]=x;
        y = radius * sin(phi) * sin(theta);
        _y[pos]=y;
        z = radius * cos(phi);
        _z[pos]=z;

      }

      // apply rotation around X and Y axis to reposition the sphere

      RotX(xaxis,  _y[pos],  _z[pos]);
      RotY(yaxis, _x[pos],  _z[pos]);


      // plot only positive points
      if (_z[pos] > 0)
      {
        //color c = imgBitmap.pixels[pos];
        color c = imgBitmap.get(i, j);

        if (firstpass){
          // ix = (int)x + 10;//100
          // iy = (int)y + 10;//100

          ix = int(_x[pos])+10;
          iy = int(_y[pos])+10;

          _ix[pos]=ix;
          _iy[pos]=iy;
        }

        color paw = parse(_ix[pos],_iy[pos],_z[pos]);
        beat.set(i,j,paw);
        karl.set(i,j,paw);

        color paw2 = parse(_ix[pos],_iy[pos],-_z[pos]);
        beat.set(i,j+(beat.height/2),paw2);


        fill(paw);
        noStroke();

        strokeWeight(1);

        if (pos>res){
          vertexi(_ix[pos],_iy[pos],_z[pos]);


          vertexi(_ix[pos-res],_iy[pos-res],_z[pos-res]);

        }

      }


    }
    endShape(CLOSE);

    hh=0;

    if (!umbrella){
      translate(0,0,by);
      if(dmode==0)beginShape(QUAD_STRIP);
      if(dmode==1)beginShape(POINTS);
      for (int j = 0; j < steph; j+=res)
      {
        int pos = i +imgBitmap.width*j;
        // map the angles from image coordinates
        if (firstpass){
          theta = MapCoordinate(0.0, imgBitmap.width - 1,
          theta1, theta0, i);
          _theta[pos]=theta;
          phi = MapCoordinate( 0.0, imgBitmap.height - 1,phi0,
          phi1, j);

          _phi[pos]=phi;

        }
        // find the cartesian coordinates
        if (firstpass){
          x = radius * sin(phi) * cos(theta);
          _x[pos]=x;
          y = radius * sin(phi) * sin(theta);
          _y[pos]=y;
          z = radius * cos(phi);
          _z[pos]=z;

        }

        // apply rotation around X and Y axis to reposition the sphere

        RotX(xaxis,  _y[pos],  _z[pos]);
        RotY(yaxis, _x[pos],  _z[pos]);


        // plot only positive points
        if (_z[pos] > 0)
        {

          color c = imgBitmap.get(i, j);

          if (firstpass){
            // ix = (int)x + 10;//100
            // iy = (int)y + 10;//100

            ix = int(_x[pos])+10;
            iy = int(_y[pos])+10;

            _ix[pos]=ix;
            _iy[pos]=iy;
          }

          if(dmode==0)noStroke();
          if(dmode==1)stroke(c);

          color paw = parse(_ix[pos],_iy[pos],_z[pos]);

          if(dmode==0)fill(paw);
          if(dmode==1)stroke(1);

          strokeWeight(1);

          if (pos>res){
            vertexi(_ix[pos],_iy[pos],-_z[pos]);
            if (dmode==0) vertexi(_ix[pos-res],_iy[pos-res],-_z[pos-res]);
          }

        }


      }
      endShape();
      translate(0,0,-by);
    }//umbrella 
    hh++;
  }

  boolean saveone=false;
  if(saveone && runs >2){

    //pgsave(karl,"pick1.png","c:\\data\\");
    exit();
  }
  runs++;
  //  firstpass=false;
}

int runs=0;
void vertexi(float a,float b,float c){
  if(!get_tex) fill(a,b,c);
  vertex(a,b,c); 
  karl.pixels[hh]=color(a,b,c);
}
int hh;
boolean get_tex=false;
color parse(float a,float b,float c){
  color retval = 0;
  float _a=(a%255)+int(a/255);
  float _b=(b%255)+int(b/255);
  float _c=(c%255)+int(c/255);
  if(c<0)  retval = color(_a,_b,-_c);
  if(c>=0)  retval = color(_a,_b,_c);
  if(get_tex)retval = imgBitmap.get(int(a),int(b));
  return retval;
}

void RotX(float angle,  float y,  float z)
{
  float  y1 = y * cos(angle) - z * sin(angle);
  float z1 = y * sin(angle) + z * cos(angle);
  y = y1;
  z = z1;
}
void RotY(float angle, float  x, float  z)
{
  float x1 = x * cos(angle) - z * sin(angle);
  float z1 = x * sin(angle) + z * cos(angle);
  x = x1;
  z = z1;
}
void RotZ(float angle, float x, float y)
{
  float x1 = x * cos(angle) - y * sin(angle);
  float y1 = x * sin(angle) + y * cos(angle);
  x = x1;
  y = y1;
}
float xaxis=1.5;
float yaxis = -2.5;

//Draw something
int ca(color col){

  return col >> 24 & 0xff;
}

int cr(color col){

  return col >> 16 & 0xff;
}

int cg(color col){
  return  col >> 8 & 0xff;
}

int cb(color col){
  return col  & 0xff;
}



void pgsave(PImage file,String savename,String where){


  PGraphics ret = createGraphics(file.width,file.height,P3D);
  ret.loadPixels();
  ret.beginDraw();
  ret.image(file,0,0,file.width,file.height);
  ret.updatePixels();
  ret.endDraw();
  ret.save(where+savename);

}




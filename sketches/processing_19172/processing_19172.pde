
//import processing.opengl.*;
int tam=80,x=0,y=0,tamx=1200,tamy=1200,e,r=0,contador=0,opc=0;
boolean flash=false;
float[] t=new float[4];
float[] t1=new float[4];
float[] te = new float[4];
float[] te1 = new float[4];
float[] dista = new float[4];
float[] dista1 = new float[4];
float temp;
PVector[] a = new PVector[tam];
PVector[] b = new PVector[tam];
PVector[] c = new PVector[tam];
PVector[] d = new PVector[tam];
PVector[] a1 = new PVector[tam];
PVector[] b1 = new PVector[tam];
PVector[] c1 = new PVector[tam];
PVector[] d1 = new PVector[tam];
color col,col1;
void setup()
{
  size(450,450);
  background(0);
  //smooth();
  for(int e=0;e<tam;e++)
  {
    a[e] = new PVector(0,0);
    b[e] = new PVector(0,0);
    c[e] = new PVector(0,0);
    d[e] = new PVector(0,0);
    a1[e] = new PVector(0,0);
    b1[e] = new PVector(0,0);
    c1[e] = new PVector(0,0);
    d1[e] = new PVector(0,0);
  }
  col = color(255);
}
void draw()
{
  if(opc==6)
  opc=0;
  if(opc==-1)
  opc=5;
  if(flash==false)
  fill(0);
  else
  fill(random(0,255),random(0,255),random(0,255),70);
  rect(0,0,tamx,tamy);
  if(mousePressed){
  col = color(random(0,255),random(0,255),random(0,255));
  contador++;
  }
//if((x!=mouseX)||(y!=mouseY))

  dista[0]=dist(width/2,0,mouseX,mouseY);
  dista[1]=dist(width,height/2,mouseX,mouseY);
  dista[2]=dist(width/2,height,mouseX,mouseY);
  dista[3]=dist(0,height/2,mouseX,mouseY);
  dista1[0]=dist(0,0,mouseX,mouseY);
  dista1[1]=dist(width,0,mouseX,mouseY);
  dista1[2]=dist(width,height,mouseX,mouseY);
  dista1[3]=dist(0,height,mouseX,mouseY);
  for(e=0;e<4;e++)
  {
    t[e]=dista[e]/tam;
    t1[e]=dista1[e]/tam;
  }
stroke(col);  
  for(e=0;e<tam;e++)
  {
//primera linea auxiliar a1
    te1[0]=acos(mouseX/dista1[0]);
    a1[e].x=t1[0]*e*cos(te1[0]);
    a1[e].y= t1[0]*e*sin(te1[0]);  
//segunda linea auxiliar b1  
    te1[1]=acos((width-mouseX)/dista1[1]);
    b1[e].x=width-t1[1]*e*cos(te1[1]);
    b1[e].y=t1[1]*e*sin(te1[1]);
//tercera linea auxiliar c1
    te1[2]=acos((height-mouseY)/dista1[2]);
    c1[e].x=width-t1[2]*e*sin(te1[2]);
    c1[e].y=height-t1[2]*e*cos(te1[2]);
//Cuarta linea auxiliar d1
    te1[3]=acos((height-mouseY)/dista1[3]);
    d1[e].x=t1[3]*e*sin(te1[3]);
    d1[e].y=height-t1[3]*e*cos(te1[3]);

    if(mouseX<=width/2)
    {
      te[0]=acos((width/2-mouseX)/dista[0]);
      a[e].x= width/2-t[0]*e*cos(te[0]);
      a[e].y= t[0]*e*sin(te[0]);
      te[2]=acos((width/2-mouseX)/dista[2]);
      c[e].x=width/2-t[2]*e*cos(te[2]);
      c[e].y=height-t[2]*e*sin(te[2]);
    }
    else{
      te[0]=asin(mouseY/dista[0]);
      a[e].x= t[0]*e*cos(te[0])+width/2;
      a[e].y= t[0]*e*sin(te[0]);
      te[2]=acos((mouseX-width/2)/dista[2]);
      c[e].x=width/2+t[2]*e*cos(te[2]);
      c[e].y=height-t[2]*e*sin(te[2]);    
    }
    if(mouseY<=height/2)
    {
      te[1]= acos((width-mouseX)/dista[1]);
      b[e].x=width-t[1]*e*cos(te[1]);
      b[e].y=height/2-t[1]*e*sin(te[1]);
      te[3]=acos(mouseX/dista[3]);
      d[e].x=t[3]*e*cos(te[3]);
      d[e].y=height/2-t[3]*e*sin(te[3]);
    }
    else
    {
      te[1]= asin((mouseY-height/2)/dista[1]);
      b[e].x=width-t[1]*e*cos(te[1]);
      b[e].y=height/2+t[1]*e*sin(te[1]);
      te[3]=asin((mouseY-height/2)/dista[3]);
      d[e].x=t[3]*e*cos(te[3]);
      d[e].y=height/2+t[3]*e*sin(te[3]);    
    }
  }
switch(opc)
{
  case 0:
  stroke(col);
  for(e=tam-1;e>0-1;e--)
  {
   line(a[r].x,a[r].y,b[e].x,b[e].y);
   line(b[r].x,b[r].y,c[e].x,c[e].y);
   line(c[r].x,c[r].y,d[e].x,d[e].y);
   line(d[r].x,d[r].y,a[e].x,a[e].y);
  r++;
  }
  r=0;
  break;
  case 1:
    temp=(width/2)/tam;
    for(e=0;e<tam;e++)
    {
      fill(col);
      line(temp*e,0,a[e].x,a[e].y);
      line(width-temp*e,0,a[e].x,a[e].y);
      line(width,temp*e,b[e].x,b[e].y);
      line(width,height-temp*e,b[e].x,b[e].y);
      line(width-temp*e,height,c[e].x,c[e].y);
      line(temp*e,height,c[e].x,c[e].y);
      line(0,height-temp*e,d[e].x,d[e].y);
      line(0,temp*e,d[e].x,d[e].y);
    }
  break;
  case 2:
    fill(col1);
    for(e=tam-1;e>0-1;e--)
    {
     line(a1[r].x,a1[r].y,a[e].x,a[e].y);
     line(b1[r].x,b1[r].y,a[e].x,a[e].y);
     line(b1[r].x,b1[r].y,b[e].x,b[e].y);
     line(c1[r].x,c1[r].y,c[e].x,c[e].y);
     line(c1[r].x,c1[r].y,b[e].x,b[e].y);
     line(d1[r].x,d1[r].y,c[e].x,c[e].y);
     line(d1[r].x,d1[r].y,d[e].x,d[e].y);
     line(a1[r].x,a1[r].y,d[e].x,d[e].y);
    r++;
    }
    r=0;
  break;
  case 3:
    for(e=tam-1;e>0-1;e--)
    {
     line(a[r].x,a[r].y,b[e].x,b[e].y);
     line(b[r].x,b[r].y,c[e].x,c[e].y);
     line(c[r].x,c[r].y,d[e].x,d[e].y);
     line(d[r].x,d[r].y,a[e].x,a[e].y);
    r++;
    }
    r=0;
    temp=(width/2)/tam;
    fill(col);
    for(e=0;e<tam;e++)
    {
      line(temp*e,0,a[e].x,a[e].y);
      line(width-temp*e,0,a[e].x,a[e].y);
      line(width,temp*e,b[e].x,b[e].y);
      line(width,height-temp*e,b[e].x,b[e].y);
      line(width-temp*e,height,c[e].x,c[e].y);
      line(temp*e,height,c[e].x,c[e].y);
      line(0,height-temp*e,d[e].x,d[e].y);
      line(0,temp*e,d[e].x,d[e].y);
    }
  break;
  case 4:
    for(e=0;e<tam-1;e++)
    {
     line(a[r].x,a[r].y,b[e].x,b[e].y);
     line(b[r].x,b[r].y,c[e].x,c[e].y);
     line(c[r].x,c[r].y,d[e].x,d[e].y);
     line(d[r].x,d[r].y,a[e].x,a[e].y);
    r++;
    }
    r=0;
  break;
  case 5:
    for(e=0;e<tam-1;e++)
    {
      line(a1[r].x,a1[r].y,b1[e].x,b1[e].y);
      line(b1[r].x,b1[r].y,c1[e].x,c1[e].y);
      line(c1[r].x,c1[r].y,d1[e].x,d1[e].y);
      line(d1[r].x,d1[r].y,a1[e].x,a1[e].y);
      r++;
    }
    r=0;
  break;
}


x=mouseX;
y=mouseY;

}
void keyPressed()
{
    if(keyCode==38)
    opc++;;
    if(keyCode==40)
    opc--;
    if(keyCode==37)
    col = color(random(0,255),random(0,255),random(0,255));


}


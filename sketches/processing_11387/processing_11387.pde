
float xi, x, xf, yi, y, yf;
float dxi, dyi, dxf, dyf;
float a, b;
float xu, yu, xv, yv, normeu, normev;
float t;
float pas = 5;
int red = 255, green = 255, blue = 255;          //couleur
int Alpha = 255; //or Alpha = 100 & stroke(255)  //transparence
int o = 1; //taille pinceau

void setup()
{
  size(500,500);
  background(0);
  stroke(red, green, blue,Alpha);
  smooth();
  t = PI/4;
  
  xi = width/2;
  yi = height/2;
  
  dxi = random(-pas,pas);
  dyi = random(-pas,pas);
  
  x = xi+dxi;
  y = yi+dyi;
}

void draw()
{
  //beginShape();
  
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width, height);
  smooth();
  
  xu = dxi*cos(t)+dyi*sin(t);
  yu = dyi*cos(t)-dxi*sin(t);
  xv = dxi*cos(t)+dyi*sin(-t); //xv = -yu;
  yv = dyi*cos(t)-dxi*sin(-t); //yv = xu;
  normeu = sqrt(sq(xu)+sq(yu));
  normev = sqrt(sq(xv)+sq(yv));
  xu = xu/normeu;
  yu = yu/normeu;
  xv = xv/normev;
  yv = yv/normev;
  
  a = random(0,pas);
  b = random(0,pas);
  
  dxf = a*xu+b*xv;
  dyf = a*yu+b*yv;
  
  xf = x+dxf; yf = y+dyf;
    
  stroke(red, green, blue, Alpha);
  strokeWeight(o);
  line(x,y,xf,yf);
  
  xi = x;     yi = y;
  x = xf;     y = yf;
  
  dxf = xf-x;  dyf = yf-y;
  dxi = x-xi;  dyi = y-yi;
  
  //point(x,y);
  //line(xi,yi,x,y);
  //fill(255,0,0);
  //ellipse(xf,yf,10,10);
  
  if(x<0){x=width;}
  if(x>width){x=0;}
  if(y<0){y=height;}
  if(y>height){y=0;}
  
println(dxf+"   "+dyf);
println(dxi+"   "+dyi);
  //endShape();
}

void mousePressed()
{
  if(mousePressed==true)
  {if(o<5){strokeWeight(1);}
   else{strokeWeight(o);}
   ellipse(x,y,10,10);
   strokeWeight(o);
   red = int(random(0,256));
   green = int(random(0,256));
   blue = int(random(0,256));
   //x = mouseX;
   //y = mouseY;
  }
}

void keyPressed()
{
  if ((keyCode == DOWN)&&(o>0)){o-=1;}
  if ((keyCode == UP)&&(o<50)){o+=1;}
}


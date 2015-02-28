
import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in,in2;


//En vez de pelos, bolas en el extremo del pelo, que aumenten de tamaño

int cuantos = 500;
float grosor,z,t,xp,xq,yp,yq,xcor,ycor,zcor,xdif,ydif,zdif;
float x=0;
float x2=2;
float x3=1;
pelo[] lista ;
float[] zz = new float[cuantos]; 
float[] phi = new float[cuantos]; 
float[] largos = new float[cuantos]; 
float radio = 30;
float rx = 0;
float ry =0;
float bass;
float numbola=0;
float sensibilidad=50;
//BeatDetect beat;

void setup() {
  size(1024, 768, OPENGL);
 
  lista = new pelo[cuantos];
  for (int i=0; i<cuantos; i++){
    lista[i] = new pelo();
  }
  smooth();
  noiseDetail(3);

  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.MONO, 512);
  in2 = in;
lights();

//bpf filter helps beatDetection algo when bass beat detection is only //wanted
  LowPassSP bpf = new LowPassSP(150, in2.sampleRate());
  in2.addEffect(bpf);
//beat = new BeatDetect();
//beat.setSensitivity(275);
//beat.detect(in.mix);
//if ( beat.isOnset() )
//{
//sphere(10);
//}

}

void draw() {
  float mic=in.left.get(0)*sensibilidad;
  background(0); //Aqui el background se refresca cada iteracion
  

  
  float off = in.left.get(0)*2;
  float radioff=radio+off*150;
  float offf = in2.left.get(0)*2;
  float radiofff=radio+offf*150;

  translate(width/2,height/2);
    rotateX(noise(5*t+3));
    rotateY(noise(5*t+20));
    rotateZ(noise(5*t+50));
 for (int i = 1; i < 15; i = i+1) {
   fill(1+10*i,20+20*i,50+30*i);
   if (i==1){  translate(-25,-25,-25);}
   if (i==2){  translate(50,0,0);     }
   if (i==3){  translate(0,50,0);     }
   if (i==4){  translate(-50,0,0);    }
   if (i==5){  translate(0,0,50);     }
   if (i==6){  translate(50,0,0);     }
   if (i==7){  translate(0,-50,0);    }
   if (i==8){  translate(-50,0,0);    }
   if (i==9){  translate(-10,25,-25); }
   if (i==10){ translate(70,0,0);     }
   if (i==11){ translate(-35,35,0);   }
   if (i==12){ translate(0,-70,0);    }
   if (i==13){ translate(0,35,35);    }
   if (i==14){ translate(0,0,-70);    }
   rotate(0);   
   noStroke();
   sphereDetail(12);
  sphere(radiofff);
  sphereDetail(10);
 }
 translate(0,0,35);
  noStroke();
  rotateY(noise(t)*2);
  rotateX(noise(t+5)*2);
  for (int i=0;i<cuantos;i++){
    lista[i].dibujar();

  }  
  rotateY(-noise(t)*2);
  rotateX(-noise(t+5)*2);
  translate(-width/2,-height/2);
  
  for (int i = 1; i < 3; i = i+3) {
  t = t + 0.005; //Eje de tiempos para PerlNoise
  x = x + 0.05;

  xcor = width/2 + cos(x)*200 - noise(t+i)*150;
  ycor = height/2 + cos(x)*200 + noise(5*t+i)*150;
  zcor = sin(x)*250 + noise(t+i)*30;

  xdif=xcor - (width/2 + cos(x-0.04)*200 - noise(t+i-0.01)*150);
  ydif=ycor - (height/2 + cos(x-0.04)*200 + noise(5*t+i-0.01)*150);
  zdif=zcor - (sin(x-0.04)*250 + noise(t+i-0.01)*30);

  float R=100;
  float G=50;
  float B=0;
  // Dibujo de Esferas.
  fill(R,G,B);
  stroke(R,G,B);
  translate(xcor, ycor, zcor);
  sphere(1 + mic*3);
  
  fill(R+50,G+50,B);
  stroke(R+50,G+50,B);
  translate(xdif, ydif,zdif);
  sphere(3 + mic*6);
 
  fill(R+90,G+110,B+20);
  stroke(R+90,G+110,B+20);
  translate(xdif, ydif,zdif);
  sphere(5 + mic*8);
  
  fill(R+120,G+170,B+50);
  stroke(R+120,G+170,B+50);
  translate(xdif, ydif,zdif);
  sphere(7 + mic*10);
  
  translate(-3*xdif-xcor,-3*ydif-ycor,-3*zdif-zcor);  
  x2 = x2 + 0.06;

  xcor = width/2 + cos(x2)*200 - noise(t+2+i)*150;
  ycor = height/2 -cos(x2)*150 + noise(5*t+2+i)*150;
  zcor = sin(x2)*250 - noise(2*t+2+i)*30;

  xdif=xcor - (width/2 + cos(x2-0.04)*200 - noise(t+2+i-0.01)*150);
  ydif=ycor - (height/2 - cos(x2-0.04)*150 + noise(5*t+2+i-0.01)*150);
  zdif=zcor - (sin(x2-0.04)*250 - noise(2*t+2+i-0.01)*30);

   R=100;
   G=50;
   B=0;
  // Dibujo de Esferas.
  fill(R,G,B);
  stroke(R,G,B);
  translate(xcor, ycor, zcor);
  sphere(1 + mic*3);
  
  fill(R+50,G+50,B);
  stroke(R+50,G+50,B);
  translate(xdif, ydif,zdif);
  sphere(3 + mic*6);
 
  fill(R+90,G+110,B+20);
  stroke(R+90,G+110,B+20);
  translate(xdif, ydif,zdif);
  sphere(5 + mic*8);
  
  fill(R+120,G+170,B+50);
  stroke(R+120,G+170,B+50);
  translate(xdif, ydif,zdif);
  sphere(7 + mic*10);
  
  
  translate(-3*xdif-xcor,-3*ydif-ycor,-3*zdif-zcor);  
  x3 = x3 + 0.05;

  xcor = width/2 - cos(x3)*200 + noise(t+2+i)*150;
  ycor = height/2 - noise(5*t+2+i)*150;
  zcor = +sin(x3)*250 - noise(t+2+i)*30;

  xdif=xcor - (width/2 - cos(x3-0.05)*200 + noise(t+2+i-0.01)*150);
  ydif=ycor - (height/2 - noise(5*t+2+i-0.01)*150);
  zdif=zcor - (sin(x3-0.05)*250 - noise(t+2+i-0.01)*30);

   R=100;
   G=50;
   B=0;
  // Dibujo de Esferas.
  fill(R,G,B);
  stroke(R,G,B);
  translate(xcor, ycor, zcor);
  sphere(1 + mic*3);
  
  fill(R+50,G+50,B);
  stroke(R+50,G+50,B);
  translate(xdif, ydif,zdif);
  sphere(3 + mic*6);
 
  fill(R+90,G+110,B+20);
  stroke(R+90,G+110,B+20);
  translate(xdif, ydif,zdif);
  sphere(5 + mic*8);
  
  fill(R+120,G+170,B+50);
  stroke(R+120,G+170,B+50);
  translate(xdif, ydif,zdif);
  sphere(7 + mic*10);
  
  }
}
  
  class pelo{
  float radio2=130;
  float zz = random(-radio2,radio2);
  float phi = random(TWO_PI);
  float largo = random(1.15,1.2);
  float theta = asin(zz/(radio2));

    void dibujar(){
    float mic=in.left.get(0)*sensibilidad;
    float mic2=in.left.get(1)*sensibilidad;

    float off = (noise(millis() * 0.0005,sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0007,sin(zz) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float radioff2=(radio2+off*70);
    float xx = radioff2 * cos(theta) * cos(phi);
    float yy = radioff2 * cos(theta) * sin(phi);
    float zz = radioff2 * sin(theta);
    float msx= screenX(xx,yy,zz);
    float msy= screenY(xx,yy,zz);

    float xo = radioff2 * cos(thetaff) * cos(phff);
    float yo = radioff2 * cos(thetaff) * sin(phff);
    float zo = radioff2 * sin(thetaff);

    float xb = xo * (largo + mic*1);
    float yb = yo * (largo + mic*1);
    float zb = zo * (largo + mic*1);
    float xb2 = xo * (largo + mic2*1);
    float yb2 = yo * (largo + mic2*1);
    float zb2 = zo * (largo + mic2*1);
    
    numbola=numbola+1;
    beginShape(LINES);
    stroke(0);
    vertex(xx,yy,zz);
    stroke(67-mic*250,135-mic*250,175-mic*250);
    fill(67-mic*250,135-mic*250,175-mic*250);
    vertex(xb-xb2,yb-yb2,zb-zb2);
    translate(xb-2*xb2,yb-2*yb2,zb-2*zb2);
    sphereDetail(5);
    sphere(4);
    sphereDetail(10);
    translate(-xb+2*xb2,-yb+2*yb2,-zb+2*zb2);
    endShape();  
    
//        stroke(180,120,1);
  }
  }
 



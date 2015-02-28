
PImage swing;
PImage jellyfish;
PImage skull1;
PImage skull2;
PImage skull3;
PImage skull4;
PImage skull5;
PImage skull6;
PImage skull7;
PImage skull8;
PImage skull9;
float m = 50;
float n = 50;
int threshold;
int prevMillis=0;
float t = 0.0;
float angle = 0.0;




void setup() {
  size(760, 760);
  smooth();

  swing = loadImage( "swing.png" ); 
  jellyfish = loadImage("jellyfish.png");
  skull1= loadImage("skull1.png");
  skull2= loadImage("skull2.png");
  skull3= loadImage("skull3.png");
  skull4= loadImage("skull4.png");
  skull5= loadImage("skull5.png");
  skull6= loadImage("skull6.png");
  skull7= loadImage("skull7.png");
  skull8= loadImage("skull8.png");
  skull9= loadImage("skull9.png");

  imageMode(CENTER);
  shapeMode(CENTER);

  threshold =10;
}
//background
int w=768, c, i, x, y, k;
void draw() {
  background(0);
  stroke(-1, 120);
  for (int t,a,b,j,i=0,x=64,s=1+mouseY/x;i<2*x;i++)
    for (j=t=0,a=b=256;j<8*x/s;j++) {
      t=j|mouseX;
      line(a, b, a+=s*int(2*cos(PI*(i^t)/x)), b+=s*int(2*sin(PI*(i^t)/x)));
    }

  ////////
  angle+=0.02;//the speed will change by this integer

  translate(width/2, height/2);
  ///////////

  if (millis() - prevMillis >= threshold)
  {

    float d = dist(width/2, height/2, mouseX, mouseY);

    float sinVal = sin(angle)*d;
    float cosVal = cos(angle)*d;

    //images collage start
    image(jellyfish, sinVal, cosVal);
    image(swing, sinVal+d, cosVal+d);
    image(skull1, sinVal+d, cosVal);
    image(skull7, sinVal, cosVal+d);
    image(skull9, sinVal-d, cosVal-d);
    image(skull5, sinVal-d, cosVal);
    image(skull3, sinVal, cosVal-d);
    image(skull4, sinVal, cosVal*(d*0.02));
    image(skull3, sinVal, cosVal*(d*0.03));
    image(skull4,sinVal*(d*0.03), cosVal);


    image(skull4,cosVal, sinVal);
    image(skull5,cosVal+d, sinVal, random(400), random(400));
   



    /*images collage start
     tint(255,255,255);
     image(jellyfish, width/2, height/2-265);
     image(swing,width/2+42,height/2-155);
     image(skull1,width/2+340,height/2+240);
     image(skull9,width/2,height/2+270);
     image(skull7,width/2-320,height/2+278);
     image(skull2,width/2-320,height/2+160);
     image(skull3,width/2-270,height/2+200);
     image(skull5,width/2+210,height/2+320);
     image(skull4,width/2+250,height/2+250);
     tint(234,0,0,255);
     image(skull3,width/2+340,height/2+290); */
  }
}




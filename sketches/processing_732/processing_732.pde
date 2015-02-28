
float x,y,t,d,m=50, b, h,v,fa=0.024,fb=0.008,aa=12,ab=16, sat=1.0;
color colour;
color colours[]=new color[257];
//float angle[][]=new float[300][300];
float sinArray[]=new float[721];
int flipper=1;
float triHeight=4, triWidth=6;
int xPos, yPos, c, i;
float ta,tb,tc,td;
float va=0.1,vb=0.1,vc=0.1,vd=0.1;

PImage img;  // Declare variable "a" of type PImage


void setup() { 
  size(300, 300, P3D); 
  colorMode(HSB, 1.0);
  //stroke(0.5,0.7,1,0.2);
  img = loadImage("autumn.jpg");  // Load the image into the program  
  noStroke();
  frameRate(24); 
  x=0;
/*  while (x<width){
    y=0;
    while (y<height){
      angle[(int)x][(int)y]=atan2(x-m, y-m);
      y++;
    }
    x++;
  }*/
  i=0;
  while (i<720){
    sinArray[i]=sin((float)i*PI/360.0);
    i++;
  }
  i=0;
  while (i<256){
    colours[i]=color(i,i,i);
    i++;
  }
  /*PFont font = loadFont("CourierNew36.vlw"); 
   textFont(font, 12);   */
} 

float sine(float ang){
  while (ang<0) ang+=PI*2;
  return sinArray[(int)((ang*360/PI))%720];
} 

float cosine(float ang){
  while (ang<0) ang+=PI*2;
  return sinArray[(int)((ang*360/PI)+540)%720];
} 

void draw(){
  ta+=va;
  tb+=vb;
  tc+=va;
  td+=vb;

  //if(t<-10.0 && t>-10.2) println ("fps: " + t*10000/millis());
  x=0;
  background(0);
  while (x<300){
    y=0;
    while (y<300){
      h=x+aa* (cosine (((y+x)*fa-ta)))+ab* (cosine (((y+x)*fb+tb)));
      v=y+ab* (sine (((x-y)*fb+tc)))+aa* (sine (((y+x)*fa-td)));
      //xPos=(int)(h-v+150);
      //yPos=(int)(h+v+50);
      /*c=(int)(brightness(get(xPos,yPos)))+8;
       if (c<0) c=0;
       if (c>255) c=255;
       colour=colours[c];
       	set(xPos,yPos,colour);*/
      //fill(y/100,sat,1,0.2);
      //noFill();
      //stroke(y/100,0.0,1,0.2);
      //triangle (xPos, yPos, xPos+triWidth/2, yPos+triHeight*flipper, xPos+triWidth, yPos);
      //ellipse (xPos, yPos, triWidth, triWidth);
      //text ("O",xPos, yPos);
      y+=1;
      set((int)x,(int)y,img.get(abs((int)h)%img.width,abs((int)v)%img.width));
    }
    x+=1;
    flipper=-flipper;
  }

}
void mouseDragged(){

  if (mouseButton==LEFT && keyCode==SHIFT && keyPressed==true){
    va+=((mouseX-pmouseX)*0.002);
    vb+=((mouseY-pmouseY)*0.002);
    if (va<0) va=0;
    if (vb<0) vb=0;
  }

  else if (mouseButton==LEFT){
    fa+=(mouseX-pmouseX)*0.001;
    aa-=(mouseY-pmouseY)*0.1;    
  }
  else if (mouseButton==RIGHT | (keyPressed == true && keyCode == CONTROL)){
    fb+=(mouseX-pmouseX)*0.001;
    ab-=(mouseY-pmouseY)*0.1;    
  }        
}

void keyPressed(){
  if (key=='s') saveFrame ("zoobie-###.tga");
  else if (key=='p') {
    if (sat==0) sat=0.75;
    else if (sat==1.0) sat=0.0;
    else sat=1.0;
  }
}



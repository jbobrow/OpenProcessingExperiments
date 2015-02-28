
import sojamo.drop.*;
SDrop drop;
public String mUrl;
PImage img;
int ancreX;
int ancreY;
int px;
int py;
int larg=100;
int [] M;
int loc;
float distSouris;
boolean homot=false;
boolean homotEnCours=false;
boolean deplac=true;
boolean premierClic=false;
boolean afficheRond=true;
boolean mouseDragged=false;
PGraphics tampon;

void setup() {

  colorMode(RGB);
  img = loadImage("neha.jpg");
  if(img.width>img.height) {
    img.resize(800,800*img.height/img.width);
  }
  else {
    img.resize(800*img.width/img.height,800);
  }
  size(800, 800);
  ancreX=(width-img.width)/2;
  ancreY=(height-img.height)/2;
  img.loadPixels();
  tampon=createGraphics(larg,larg,P2D);
  M= new int [img.width*img.height];
  drop = new SDrop(this);
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
    }
  }
  );
}

void draw() {
  if(mUrl!=null) {
    img=loadImage(mUrl);
    if(img.width>img.height) {
      img.resize(800,800*img.height/img.width);
    }
    else {
      img.resize(800*img.width/img.height,800);
    }
    ancreX=(width-img.width)/2;
    ancreY=(height-img.height)/2;
    img.loadPixels();
    mUrl=null;
  }
  background(0);
  image(img,ancreX,ancreY);
  noStroke();
  fill(0x33FF0000);
  if ((afficheRond)&&(deplac)) {
    ellipse(mouseX,mouseY,larg,larg);
  }
  if ((afficheRond)&&(homot)&&(!mouseDragged)) {
    ellipse(mouseX+larg/2,mouseY+larg/2,larg,larg);
  }
  if ((afficheRond)&&(homot)&&(mouseDragged)) {
    ellipse(px+larg/2,py+larg/2,1.5*dist(mouseX,mouseY,px+larg/2,py+larg/2),1.5*dist(mouseX,mouseY,px+larg/2,py+larg/2));
  }
}

void mousePressed() {

  if (premierClic==false)
  {
    premierClic=true;
    if (mouseButton == LEFT)
    { 
      homot=false;
      deplac=true;
      px=mouseX;
      py=mouseY;
      for (int i=0;i<larg;i++) {
        for (int j=0;j<larg;j++) {
          if((mouseX-ancreX+i-larg/2<img.width)&&(mouseY-ancreY+j-larg/2<(img.height))&&(mouseY-ancreY+j-larg/2>0)&&(mouseX-ancreX+i-larg/2>0))
          {
            M[i+j*larg]=img.pixels[mouseX-ancreX+i-larg/2+(mouseY-ancreY+j-larg/2)*img.width];
          }
          else
          {
            M[i+j*larg]=-1;
          }
        }
      }
    }
    if(mouseButton==CENTER) {
      for (int i=0;i<larg;i++) {
        for (int j=0;j<larg;j++) {
          float rayon=dist(0,0,i-larg/2,j-larg/2);
          int X=int(i-larg/2+mouseX-ancreX);
          int Y=int(j-larg/2+mouseY-ancreY);
          if ((rayon<larg/2)&&(X<img.width)&&(Y<(img.height))&&(X>0)&&(Y>0)&&M[i+j*larg]!=-1)
          {//tampon.pixels[i+j*larg]=M[i+j*larg];
            float coeff=5*(-rayon+larg/2)/(larg/2);
            float r=red(M[i+j*larg]);
            float ri=red(img.pixels[X+Y*img.width]);
            float g=green(M[i+j*larg]);
            float gi=green(img.pixels[X+Y*img.width]);
            float b=blue(M[i+j*larg]);
            float bi=blue(img.pixels[X+Y*img.width]);
            img.pixels[X+Y*img.width]=color((ri+coeff*r)/(1+coeff),(gi+coeff*g)/(1+coeff),(bi+coeff*b)/(1+coeff));
          }
        }
      }
      img.updatePixels();
    }
    if (mouseButton==RIGHT) {
      homot=true;
      deplac=false;
      px=mouseX;
      py=mouseY;
      for (int i=0;i<larg;i++) {
        for (int j=0;j<larg;j++) {
          if((mouseX-ancreX+i<img.width)&&(mouseY-ancreY+j<(img.height))&&(mouseY-ancreY+j>0)&&(mouseX-ancreX+i>0))
          {
            M[i+j*larg]=img.pixels[mouseX-ancreX+i+(mouseY-ancreY+j)*img.width];
          }
          else
          {
            M[i+j*larg]=-1;
          }
        }
      }
      //if(distSouris>larg/2){interpolate(img,px,py,int(distSouris));}
    }
  }
}

void mouseDragged() {
  mouseDragged=true;

  for (int i=0;i<larg;i++) {
    for (int j=0;j<larg;j++) {
      float rayon=dist(0,0,i-larg/2,j-larg/2);
      if(mouseButton==LEFT) {
        if(dist(mouseX,mouseY,px,py)<larg/2)
        {

          int X=int(px+i-larg/2+(mouseX-px)*(larg-2*rayon)/larg/(0.1/rayon+1));
          int Y=int(py+j-larg/2+(mouseY-py)*(larg-2*rayon)/larg/(0.1/rayon+1));
          if ((rayon<larg/2)&&(X-ancreX<img.width)&&(Y-ancreY<(img.height))&&(X-ancreX>0)&&(Y-ancreY>0)&&M[i+j*larg]!=-1)
          {
            img.pixels[X-ancreX+(Y-ancreY)*img.width]=M[i+j*larg];
          }
        }
      }

      if(mouseButton==RIGHT) {
        homotEnCours=true;
        distSouris=dist(mouseX,mouseY,px+larg/2,py+larg/2);
        int X=round((px+i)-((i-larg/2)*((1.4*larg/2-distSouris)/larg)));
        int Y=round((py+j)-((j-larg/2)*((1.4*larg/2-distSouris)/larg)));
        if ((distSouris>1)&&//(dist(mouseX,mouseY,px+larg/2,py+larg/2)<0.7*larg)&&
        (rayon<larg/2)&&(X-ancreX<img.width)&&(Y-ancreY<img.height)&&(X-ancreX>0)&&(Y-ancreY>0)&&M[i+j*larg]!=-1)
        { 
          img.pixels[X-ancreX+(Y-ancreY)*img.width]=M[i+j*larg];
        }
      }
    }
  }
  img.updatePixels();
  //interpolate(img,mouseX,mouseY,int(1.4*distSouris));
}
void mouseReleased() {
  //if((mouseDragged)&&(!homotEnCours)){interpolate(img,px-larg/2,py-larg/2,larg);}
  if((homotEnCours)&&(distSouris>1.4*larg/2)) {
    interpolate(img,px-ancreX+larg/2-round(0.71*distSouris),py-ancreY+larg/2-round(0.71*distSouris),int(1.4*distSouris));
  }
  //if((homotEnCours)&&(distSouris<=1.4*larg/2)){interpolate(img,px,py,larg);}
  distSouris=0;
  homotEnCours=false;
  premierClic=false;
  mouseDragged=false;
}  
void mouseWheel(int delta) {
  if(larg-10*delta>10)
  {
    larg-=10*delta;
  }
}
void keyPressed() {

  afficheRond=!afficheRond;
}  
void interpolate(PImage img,int coinX,int coinY,int larg) {
  int denombre=0;
  for (int u=coinX;u<=coinX+larg;u++) {
    for (int v=coinY;v<=coinY+larg;v++) { 
      int loc=u+v*img.width;
      if(((u-coinX-larg/2)*(u-coinX-larg/2)+(v-coinY-larg/2)*(v-coinY-larg/2)<=(larg*larg)/4)&&(loc>0)&&(loc<img.pixels.length)) {//(copie.pixels[loc]!=0)&&
        int comptPoids=0;     
        float r=0;
        float g=0;
        float b=0;
        int etendue=1;
        for(int k=-etendue;k<etendue+1;k++) {
          for(int l=-etendue;l<etendue+1;l++) {
            if(((k!=0)||(l!=0))&&(u+k+(v+l)*img.width<img.pixels.length)&&(u+k+(v+l)*img.width>0)) {//(copie.pixels[u+k+(v+l)*img.width]==0)&&
              r+=(2*etendue+1-abs(k)-abs(l))*red(img.pixels[u+k+(v+l)*img.width]);
              g+=(2*etendue+1-abs(k)-abs(l))*green(img.pixels[u+k+(v+l)*img.width]);
              b+=(2*etendue+1-abs(k)-abs(l))*blue(img.pixels[u+k+(v+l)*img.width]);
              comptPoids+=(2*etendue+1-abs(k)-abs(l));
              denombre++;
            }
          }
        }
        img.pixels[loc]=color(int(r/comptPoids),int(g/comptPoids),int(b/comptPoids));//color(0xFF,0,0);//
      }
    }
  }  
  // print(denombre+" "+(larg*larg*35)+" ");
  img.updatePixels();
} 
void dropEvent(DropEvent theDropEvent) {

  // si le drop est une image jpg
  // on charge l'adresse dans  mUrl.
  if(theDropEvent.isFile()) {
    mUrl = theDropEvent.filePath();
  }
  if(theDropEvent.isURL()==true) {
    if (theDropEvent.url().trim().substring(theDropEvent.url().trim().length()-3,theDropEvent.url().trim().length())=="jpg") {
      mUrl = theDropEvent.url().trim();
    }
  }
}




// samuel bravo silva, santiago, chile. 2008. http://terreno.wordpress.com

PImage ii;
PFont font;

float px,pr,pl;
int i=1;//intervalo de análisis
int pp=1;
/*intervalo de puntos por rayo. si es igual al anterior solo veremos líneas,
 pero eso ayuda a tener un análisis homogeneo.. 
 este es el espesor mínimo de elementos detectables*/
int xb=0;
int yb=0;
int yy=0;
int p=0;

int ma, mi; //máximo y mínimo
boolean dos;
boolean ff; // saveframe
boolean mm=true;//switch para calcular máximo y mínimo SÓLO UNA VEZ

float  y;//coordenada del haz de rayos
float rr=PI/20;//*2=cantidad de rayos

void setup(){
  ii = loadImage("compostela.gif");
  size(ii.width,ii.height);
  image(ii, 0, 0);
  frameRate(300);
  font = loadFont("DIN-Regular-14.vlw"); 
}

int trvx [][]= new int [1200][1200];

void draw(){
  smooth();
  if(key==' ')ff=true;
  if(key=='p')ff=false;
  if(ff){
    saveFrame("o4_####.png");
    ff=false;  
  }

  if(yy<width){
    image(ii, 0, 0);
    yy++;

    for(int xx=0;xx<width;xx+=i){
      pr=brightness(get(xx,yy)); 
      if(pr!=0){
        for (float r=-PI/4;r<PI/4;r+=rr){
          for (float x=pp;x<width/4;x+=pp){
            y=x*tan(r);
            pl=brightness(get(int(x+xx),int(y+yy)));
            if(pl==0)break;
            //  point(x+xx,y+yy);
            trvx[int(x+xx)][int(y+yy)]+=1;
          }
        }
        for (float r=PI/4;r>-PI/4;r-=rr){
          for (float x=pp;x<width/4;x+=pp){
            y=x*tan(r);
            pl=brightness(get(int(x+xx),int(y+yy)));
            if(pl==0)break;
            //  point(x+xx,y+yy);
            trvx[int(x+xx)][int(y+yy)]+=1;
          }
        }
        for (float r=-PI/4;r<PI/4;r+=rr){
          for (float x=pp;x<width/4;x+=pp){
            y=x*tan(r);
            pl=brightness(get(int(-x+xx),int(-y+yy)));
            if(pl==0)break;
            //  point(-x+xx,-y+yy);
            trvx[int(-x+xx)][int(-y+yy)]+=1;
          }
        }
        for (float r=PI/4;r>-PI/4;r-=rr){
          for (float x=pp;x<width/4;x+=pp){
            y=x*tan(r);
            pl=brightness(get(int(-x+xx),int(-y+yy)));
            if(pl==0)break;
            // point(-x+xx,-y+yy);
            trvx[int(-x+xx)][int(-y+yy)]+=1;
          }
        }
      }  
    }       
    progreso(yy);
  }  

  if(yy>=width){ 
    //situar rango
    if(mm){  //hace que esto se lea solo una vez
      for(int xx=0;xx<width;xx+=1){
        for(int yy=0;yy<height;yy+=1){
          if(ma<trvx[xx][yy])ma=trvx[xx][yy];
          if(mi>trvx[xx][yy]&&0<trvx[xx][yy])mi=trvx[xx][yy];
          mm=false;
        }
      }
    }

    //recolectar valores en cuadrados
    if(yb<height){
      println(mi);
      println(ma);
      yb++;  
      loadPixels();
      for(xb=0;xb<width;xb++){
        int cc=0;
        cc=250*(trvx[xb][yb]-mi)/ma;
        color aa=color(0,0,0);
        aa=color (cc+40,2*cc-200,130-cc);
        //aa=color (cc,cc,cc);
        if(cc==0) aa=color (0);
        pixels[p]=aa;
        p++;
      }
      updatePixels();
    }
    if(yb==height) {
      yb++; 
      escala(ma);
    }  
  }
}

void escala(int ma){
  int i=ma/200;
  println(i);
  fill(180,120);
  textFont(font); 
  text("0%", width-65, 36); 
  text("100%", width-82, 20+ma/i); 
  for (int a=0;a<ma;a+=i){
    float dd=a*200/ma;
    stroke(dd+40,2*dd-200,130-dd,230);
    line (width-40,20+a/i,width-20,20+a/i);
  }
  noFill();
  stroke(180,120);
  quad(width-40,20,width-20,20,width-20,20+ma/i,width-40,20+ma/i);  
}

void progreso(int cc){
  noStroke();
  fill(180,80);
  quad(20,20,20+width/4,20,20+width/4,40,20,40);
  noFill();
  stroke(180,120);
  quad(20,20,20+cc/4,20,20+cc/4,40,20,40);
  textFont(font); 
  fill(180,120);
  text("sight cast", 20, 16); 
}





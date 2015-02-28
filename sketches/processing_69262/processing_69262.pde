
PFont tipo_letra;
char[] mi_nombre={'I','v','o','n','n','e'};
void setup(){
  size(500,500);
}
void draw(){
  float x1=int(random(0,400));
  float y1=int(random(0,400));
  float x2=int(random(0,400));
  float y2=int(random(0,400));
  float x3=int(random(0,400));
  float y3=int(random(0,400));
  float x4=int(random(0,400));
  float y4=int(random(0,400));
  float x5=int(random(0,400));
  float y5=int(random(0,400));
  float x6=int(random(0,400));
  float y6=int(random(0,400));
  background(0);
  tipo_letra=loadFont("AngsanaUPC-BoldItalic-48.vlw");
  textFont(tipo_letra,50);
  if((x1!=100) && (y1!=250)){
    text(mi_nombre[0],x1,y1);
    if((x2!=150) && (y2!=250)){
      text(mi_nombre[1],x2,y2);
      if((x3!=200) && (y3!=250)){
        text(mi_nombre[2],x3,y3);
        if((x4!=250) && (y4!=250)){
          text(mi_nombre[3],x4,y4);
          if((x5!=300) && (y5!=250)){
            text(mi_nombre[4],x5,y5);
            if((x6!=350) && (y6!=250)){
              text(mi_nombre[5],x6,y6);
            }
          }
        }
      }
    }
  }    
  else{
    text(mi_nombre[0],100,250);  
    text(mi_nombre[1],150,250);
    text(mi_nombre[2],200,250);
    text(mi_nombre[3],250,250);
    text(mi_nombre[4],300,250);
    text(mi_nombre[5],350,250);
    noLoop();
  }
}

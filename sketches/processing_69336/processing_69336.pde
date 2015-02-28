
int inicio=0;
int a, b;

void setup(){
  size(800,400);
  background(0);
  frameRate(1);
}

void draw(){
  
  background(0);
  PFont tipo_letra;
  int  i;
  float x=0.0, y=0.0;
  tipo_letra = loadFont("SansSerif.bolditalic-48.vlw");
  textFont(tipo_letra, 72);
  char[] mi_nombre={'a', 'l', 'e', 'x'};
  //text("hola mundo", 10,200);
  
  //float x= random(400);
  //float y= random(200);
  /*
  for(i=0; i<4; i++){
    x=random(400);
    y=random(200);
    text(mi_nombre[i], 200+x, 100+y);
  }
  */
  
  
  if(inicio==0){
    x=random(400);
    y=random(200);
    text(mi_nombre[0],x,y);
    inicio++;
  }
  else if(inicio==1){
    x=random(400);
    y=random(200);
    text(mi_nombre[0],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[1],x,y);
    inicio++;
  }
  else if(inicio==2){
    x=random(400);
    y=random(200);
    text(mi_nombre[0],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[1],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[2],x,y);
    inicio++;
  }
  else if(inicio==3){
    x=random(400);
    y=random(200);
    text(mi_nombre[0],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[1],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[2],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[3],x,y);
    inicio++;
  } 
  else if(inicio==4){
    text(mi_nombre[0],300,300);
    x=random(400);
    y=random(200);
    text(mi_nombre[1],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[2],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[3],x,y);
    inicio++;
  }
  else if(inicio==5){
    text(mi_nombre[0],300,300);
    text(mi_nombre[1],340,300);
    x=random(400);
    y=random(200);
    text(mi_nombre[2],x,y);
    x=random(400);
    y=random(200);
    text(mi_nombre[3],x,y);
    inicio++;
  }
  else if(inicio==6){
    text(mi_nombre[0],300,300);
    text(mi_nombre[1],340,300);
    text(mi_nombre[2],360,300);
    x=random(400);
    y=random(200);
    text(mi_nombre[3],x,y);
    inicio++;
  }
    else if(inicio==7){
    text(mi_nombre[0],300,300);
    text(mi_nombre[1],340,300);
    text(mi_nombre[2],360,300);
    text(mi_nombre[3],400,300);
    inicio++;
  }
  else{
    delay(5000);
    inicio=0;
  }
}


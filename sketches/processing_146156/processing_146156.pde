
int a = 10;
int b = 18;
int Patos = 20;
int i;

//Matriu de posicions x i y de "Patos" elements:
float[] posX = new float[Patos];
float[] posY = new float[Patos];
//Matriu de velocitats x i y de "Patos" elements:
float[] velX = new float[Patos];
float[] velY = new float[Patos];
//Matriu de colors de "Patos" elements pel cos, el bec i les ales:
color[] colorPatos = new color[Patos];
color[] colorBec = new color[Patos];
color[] colorUll = new color[Patos];


void setup(){
  size(500,500);
  //Determinar posicions i velocitats inicials i els colors:
  for(int i=0; i<Patos; i++){ //Si "i" es mes petit que "Patos", se li suma 1.
    posX[i] = width/2; //Posicio X inicial
    posY[i] = height/2; //Posicio Y inicial.
    velX[i] = random(5); //Velocitat X inicial.
    velY[i] = random(10); //Velocitat Y inicial.
    colorPatos[i] = color(random(251),random(188),random(0)); //Color del cos random per a cada Pato.
    colorBec[i] = color(random(233),random(96),random(15)); //Color del bec random per a cada Pato.
    colorUll[i] = color(0); //Color de l'ull random per a cada Pato.
  }
}

void draw(){
  background(132,207,posY[i]);

  //Determinar el bucle perque repeteixi les accions a tots els valors de les matrius:
  for(int i=0; i<Patos; i++){
    //Redeterminar les posicions inicials:
    posX[i] += velX[i];
    posY[i] += velY[i];

    //Determinar els rebots amb els limits:
    if((posX[i]<0+2*a)||(posX[i]>width-9*a/2)){
      velX[i] = -velX[i];
    } 
    if((posY[i]<2*a)||(posY[i]>height-2*a)){
      velY[i] = -velY[i];
    } 
  
   //DIBUIX PATO:
    //bec:
    stroke(0);
    strokeWeight(2);
    fill(colorBec[i]);
    triangle(posX[i]+3*a/2,posY[i]-a/2,posX[i]+5*a/2,posY[i],posX[i]+3*a/2,posY[i]+a/2);
    //cos:
    fill(colorPatos[i]);
    ellipse(posX[i],posY[i],4*a,4*a);
    //ala:
    ellipse(posX[i],posY[i]+a,2*a,a);
    //ull;
    fill(colorUll[i]);
    ellipse(posX[i]+a,posY[i]-a/2,a/3,a/3);
  }
}


void mousePressed(){
  //Determinar les noves posicions inicials dels Patos al clicar el mouse:
  for(int i = 0; i<Patos; i++){
    posX[i] = mouseX;
    posY[i] = mouseY;
    }
   
  //Definir que fins a certes mides els Patos es facin grans a cada 'click'.
   if(a<b){
     a = a+1; 
   }
   if(a>=b){ //els Patos tornen a la mida original quan a=20.
     a = 10;
   }
} 



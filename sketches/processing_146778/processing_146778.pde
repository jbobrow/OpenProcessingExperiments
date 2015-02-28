
String[] texto1= {"EU", "SO"};
String[] texto2= {"SON","ERA", "SEREI"};              
String[] texto3= {"TI", "SO"};
String[] texto4= {"SERAS", "ERES", "ERAS"};       
String[] texto5= {"ANOS","MESES","SEMANAS","HORAS"};              
String[] texto6= {"SOMOS", "SEREMOS", "ERAMOS"};       
String[] texto7= {"INSTANTES", "SEGUNDOS"};      
String[] texto8= {"MAIS", "+"};    
String[] texto12= {"NOS"}; 

int[] back={1,255,150};

PFont font1;
int i,j;
void setup() {
  size(450,450);
  font1 = loadFont("Helvetica-Bold-50.vlw");
  frameRate(1);
  smooth();
}

void draw() {
  background(255);
  for (int m = 0; m < width; m = m + 2){
    for (int n = 0; n < height; n = n + 2){
      point(m,n);
    }
  }
  textAlign(CENTER);
  fill(1);
  textFont(font1,30);
  i = round(random(1));
  text(texto1[i],3*width/6,height/6);
  i = round(random(2));
  text(texto2[i],3.5*width/6,1.5*height/6);
  i = round(random(1));
  text(texto3[i],4*width/6,2*height/6);
  i = round(random(2));
  text(texto4[i],4.5*width/6,2.5*height/6);
  i = round(random(3));
  text(texto5[i],5*width/6,3*height/6);
  
  i = round(random(1));
  text(texto3[i],width/6,3*height/6);
  i = round(random(2));
  text(texto4[i],1.5*width/6,3.5*height/6);
  i = round(random(1));
  text(texto1[i],2*width/6,4*height/6);
  i = round(random(2));
  text(texto2[i],2.5*width/6,4.5*height/6);
  i = round(random(3));
  text(texto5[i],3*width/6,5*height/6);
  
  i = round(random(2));
  text(texto6[i],2*width/6,2*height/6);
  i = round(random(2));
  text(texto6[i],4.5*width/6,4.5*height/6);
  
  i = round(random(1));
  text(texto7[i],4*width/6,4*height/6);
  i = round(random(1));
  text(texto7[i],1.5*width/6,1.5*height/6);
  
  i = round(random(1));
  text(texto8[i],4.5*width/6,3.5*height/6);
  i = round(random(1));
  text(texto8[i],1.5*width/6,2.5*height/6);
  
  
  fill(255);
  i = 0; 
  text(texto12[i],3*width/6,3*height/6);
}





String[] texto1= {"EU"};
String[] texto2= {"EU","TI"};              
String[] texto3= {"EU","TI", "DOUS"};
String[] texto4= {"EU","TI"};       
String[] texto5= {"TI"};              
String[] texto6= {"NOS"};       
String[] texto7= {"UN", "+"};       
String[] texto8= {"UN", "DE", "NOS"};              
String[] texto9= {"UN", "+"};
String[] texto10={"NOS"};

PFont font1;
int i,j;
void setup() {
  size(350,350);
  font1 = loadFont("HelveticaNeue-CondensedBold-48.vlw");
  frameRate(1);
  smooth();
}

void draw() {
  background(255);
  for (int m = 0; m < width; m = m + 2){
    for (int n = 0; n < height; n = n+ 2){
 
      point(m,n);
    }
  }
  textAlign(CENTER);
  fill(1);
  textFont(font1,30);
  i = 0;
  text(texto1[i],width/3,height/6);
  i = round(random(1));
  text(texto2[i],width/3,2*height/6);
  i = round(random(2));
  text(texto3[i],width/3,3*height/6);
  i = round(random(1));
  text(texto4[i],width/3,4*height/6);
  i = 0;
  text(texto5[i],width/3,5*height/6);
  i = 0;
  fill(255);
  text(texto6[i],2*width/3,height/6);
  i = round(random(1));
  text(texto7[i],2*width/3,2*height/6);
  i = round(random(2));
  text(texto8[i],2*width/3,3*height/6);
  i = round(random(1));
  text(texto9[i],2*width/3,4*height/6);
  i = 0;
  text(texto10[i],2*width/3,5*height/6);
}




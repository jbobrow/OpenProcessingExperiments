
String[] texto1= {"O"};
String[] texto2= {"SO","O"};              
String[] texto3= {"SO","O","SON"};
String[] texto4= {"SO","O", "SON", "SONOS"};       
String[] texto5= {"SO","O","SON","SONOS","O SON SO"};              
String[] texto6= {"NON SOÑO SO", "NON O SON SO" };            
String[] texto7= {"OS","O","NOS","SOÑOS","SOÑO SO"};   
String[] texto8= {"OS","O","NOS","SOÑOS",};    
String[] texto9= {"OS","O","NOS"};
String[] texto10={"OS","O"};      
String[] texto11={"O"};    


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
  i = 0;
  text(texto1[i],width/2,0.75*height/6);
  i = round(random(1));
  text(texto2[i],width/2,1.25*height/6);
  i = round(random(2));
  text(texto3[i],width/2,1.75*height/6);
  i = round(random(3));
  text(texto4[i],width/2,2.25*height/6);
  i = round(random(4));
  text(texto5[i],width/2,2.75*height/6);
  i = round(random(1));
  text(texto6[i],width/2,3.25*height/6);
  i = round(random(4));
  text(texto7[i],width/2,3.75*height/6);
  i = round(random(3));
  text(texto8[i],width/2,4.25*height/6);
  i = round(random(2));
  text(texto9[i],width/2,4.75*height/6);
  i = round(random(1));
  text(texto10[i],width/2,5.25*height/6);
  i = 0;
  text(texto11[i],width/2,5.75*height/6);
}




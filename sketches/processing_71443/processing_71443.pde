
//**Grajales Jiménez Angelica**//

int i=65,z=97;
float a=10, b=50;

PFont tipo_letra;
PFont tipo_dos;
int s = second(); 

void setup()
{
  background(0);
  size (900,500);
  
}

void draw()
{
  tipo_letra=createFont("SansSerif",48);
  textFont(tipo_letra);
  

 if(i<=90)
 {
    println(char(i)); 
    text(char(i),a,50);
    a=a + textWidth(char(i));
    i++;
    
  }
  
  tipo_dos=createFont("Curlz MT" ,48);
  textFont(tipo_dos);
  if(z<=122)
 {
    println(char(z)); 
    text(char(z),b,100);
    b=b + textWidth(char(z));
    z++;
    
  }
  
  
}

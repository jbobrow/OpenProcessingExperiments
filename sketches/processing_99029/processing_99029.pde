
/*@pjs font=Symphony_demo.ttf*/
PFont font6;
String[] words = {"basquet","turing","cobol","disjktra","floyd","c++","fly","acm-icpc","qwerty","gnu","linux","LoL","Show","Nerd","Geek","Rock","Trova","funk","mamastroficos","multimedia"};
float opacidad=0.0;
float size = 0.0;
int posiciones []= new int [20];
int posiciones2 []= new int [20];
float z =0;
void setup()
{
  size(1000,500,P3D);

  font6 = createFont("Symphony_demo.ttf", 40);
  coordenadas();
}

public void coordenadas(){
for (int i=0;i<20;i++){
posiciones [i]=(int)random(400, 700);
posiciones2 [i]=(int)random(200, 300);
}
}

void draw()
{
  background(100,202,180);
  opacidad +=1;
   
   
   for(int i =0; i<20; i++){

  
    textFont(font6,10);
    fill(0,opacidad);
    if (z==0){
    pushMatrix();
    translate(posiciones[i],posiciones2[i]);
    text(words[i],0,0,0);
    popMatrix();
    z++;
  }
   z+=.05;
    text(words[i],posiciones[i],posiciones2[i],z);
}

}



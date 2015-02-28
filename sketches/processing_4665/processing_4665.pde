
bande[] bandes;

void setup(){
  size(500,500);
  bandes  =new bande[25];
  for(int a=0;a<25;a++){
  bandes[a] = new bande(a*20);
  }
}

void draw(){
  for(int a=0;a<bandes.length;a++){
    bandes[a].dessine();
  }
  
}

class bande{
  int x;composant r1,r2,g1,g2,b1,b2;
  bande(int a){
    x=a;
    r1=new composant();
    r2=new composant();
    g1=new composant();
    g2=new composant();
    b1=new composant();
    b2=new composant();
  }
  void dessine(){
    float r_1 =r1.getCoul(); 
    float r = (r2.getCoul()-r_1)/500;
    float g_1=g1.getCoul(); 
    float g = (g2.getCoul()-g_1)/500;
    float b_1=b1.getCoul(); 
    float b = (b2.getCoul()-b_1)/500;
    for(int a=0;a<500;a++){
      stroke(r_1+r*a,g_1+g*a,b_1+b*a);
      line(x,a,x+25,a);
    }
    //rect(x,0,25,500);
  }
}

class composant{
  float ang,vit;
  composant(){
    ang=random(360)/(180.0/PI);
    vit=random(0.4,0.8)/(180.0/PI);
  }
  float getCoul(){
    ang+=vit;
    return(cos(ang)*128+128);
  }
 }



int f= 60; //largura do predio
float red=70;
float green=35;
float blue=35;
float t;
float w;


void setup() {
  size(700,600);
  frameRate(30);
}


void draw() {
  
  background(red,green,blue);
   if(blue<255)blue+=2;                         //céu mudando de cor
   if(green<150)green++;
   if(red<50)red++;
  
  noStroke();
  fill(255,255,0);
  ellipse(80,t,60,60);                        //sol se mexendo
   t=t-5;
   if(t<0){
   t=height;}

  fill(255,70);
  ellipse(w-70,100,120,30);
  ellipse(w-30,80,150,40);          //nuvem 1 se mexendo           
  ellipse(w,90,90,50);
  
  ellipse(w+50,200,200,40);
  ellipse(w+90,210,120,70);          //nuvem 2 se mexendo
  ellipse(w+150,180,90,30);
   w+=6;
   if(w<0){
   w=width;
   }
   if (t<50) {
   noLoop();}
    
    
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect(580,470,10,30);                        //ponte
  rect(580,450,200,20); 
  fill(30,150);  
  
   for(int e=580; e<width; e+=8){
   rect(e,452,5,5);                         //janelas da ponte
    }

  {
  float a = map(mouseX,0,width,200,350);      //faz mecher
  fill(255);    //cor dos predios
  
    
  {
    strokeWeight(1);
    rect(a,100,f,150);    //bloco 1
    quad(a-15,108,a,100,a,250,a-15,258);   //sombra
    quad(a,250,a+f,250,320,350,260,350);    //bloco 2                      //predio 1
    quad(a-15,258,a,250,260,350,245,358);  //sombra
    rect(260,350,f,150);   //bloco 3
    quad(245,358,260,350,260,500,245,500);   //sombra
    fill(30,150);
    strokeWeight(3);
    rect(280,470,20,30);    //porta
    strokeWeight(1);
    for(float x=105; x<240; x+=10)
    for(float y=a; y<(a+50); y+=10){       //janelas
     rect(y,x,10,10);}
  }
  {
    fill(255);
    float g=a+30+f;
    rect(a+90,120,f,180);         //bloco 1
    quad(a+80,128,a+90,120,a+90,300,a+80,308);    //sombra
    quad(a+90,300,g+f,300,420,400,360,400);        //bloco 2                  //predio 2
    quad(a+80,308,a+90,300,360,400,350,408);    //sombra
    rect(360,400,f,100);      //bloco 3
    quad(350,408,360,400,360,500,350,500);     //sombra
    fill(30,150);
    strokeWeight(3);
    rect(380,470,20,30);      //porta
    strokeWeight(1); 
    for(float l=360; l<410; l+=10)
    for(float m=400; m<460; m+=10){        //janelas
      rect(l,m,10,10);}
  }

  {
    strokeWeight(1);
    fill(255);
    quad(a+170,110,a+230,110,a+260,350,a+200,350); //bloco 1       //predio 3
    quad(a+160,118,a+170,110,a+200,350,a+190,358); //sombra
    quad(a+200,350,a+260,350,560,500,500,500); //bloco 2
    quad(a+190,358,a+200,350,500,500,490,500); //sombra
    fill(30,150);
    strokeWeight(3);
    rect(515,470,20,30);        //porta
  }    
  }
  
  float h = 0.0;
  float inc = TWO_PI/25.0;

  for (int i = 0; i < 700; i=i+1) {
    stroke(random(0,25),random(50,96),random(200,245));           //mar se mexendo
    line(i, 510+sin(h)*5.0 , i, 600);
    h = h + inc;
  }
 
 
  stroke(0);
  fill(0);                      
  rect(230,500,370,20);             //chao
  
  
}

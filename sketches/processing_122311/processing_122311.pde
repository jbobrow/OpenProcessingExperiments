
int x, y;    
int r, g, b; 
 
void setup() {
  size(600, 600);
  background(0);
  noStroke();
  smooth();
  fill(0);

r=0;
g=0;
b=0;

}
 
void draw() {
  //ellipse(mouseX, mouseY, 10, 10);
}

void mouseDragged(){
  fill(r, g, b);
  ellipse(mouseX, mouseY, 10, 10);    
}

void keyPressed(){
 switch(key){
   case 'd':  //d=Delite
  background(0);     
      break;
  case 'r':  //r=Red
   r=255;
   g=0;
   b=0;
      break;
  case 'o':  //O=Orange 
   r=255;
   g=130;
   b=0;
      break;
  case 'y':  //y=Yerrow
   r=255;
   g=255;
   b=0;
      break;      
  case 'l':  //l=Limegreen
   r=150;
   g=255;
   b=0;
      break;
  case 'g':  //g=Green
   r=0;
   g=255;
   b=0;
      break;
  case 'f':  //f=Forestgreen 
   r=0;
   g=120;
   b=0;
      break;
  case 'e':  //e=Emelard 
   r=0;
   g=255;
   b=150;
      break;
  case 's':  //s=Skyblue
   r=0;
   g=200;
   b=255;
      break;
  case 'b': //b=Blue
   r=0;
   g=0;
   b=255;
      break;
  case 'p': //p=Purple 
   r=150;
   g=0;
   b=255;
      break;
  case 'v': //v=Valentinespink
   r=255;
   g=139;
   b=230;
      break;
  case 'c': //c=Chocobrown
   r=115;
   g=50;
   b=0;
      break;
  case 'w': //w=White
   r=255;
   g=255;
   b=255;
      break;
  case '1': //1=1stGold?
   r=229;
   g=197;
   b=67;
      break;
  case '2': //2=2stSilver?
   r=200;
   g=200;
   b=200;
      break;
  case '3': //3=3stBronze?
   r=211;
   g=103;
   b=73;
      break;
  case 'x': //x=Eraseblack 
   r=0;
   g=0;
   b=0;
      break;
}
}



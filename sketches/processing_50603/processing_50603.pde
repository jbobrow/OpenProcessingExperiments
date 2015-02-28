
int boteX; 
int posteX;
int velaX;
int vela2X;


void setup() {
  size(500,500);
  boteX=50;
  posteX=135;
  velaX=130;
  vela2X=140;
  
}

void draw() {
  //diseño
   noStroke();
  background(205,225,255);
  
    fill(202,225,235);
      rect(0,0,699,499);
    fill(255,255,0);


    fill(0,120,208);
        rect(0,300,700,400);
        //bote
     fill(140,70,35);
       quad(boteX,250,boteX+170,250,boteX+150,300,boteX+20,300);
       //poste
        fill(240);
        stroke(0);
          strokeWeight(3);
        line(posteX,150,posteX,250);
     //velas
       triangle(velaX,150,velaX,220,velaX-50,220);
       triangle(vela2X,150,vela2X,220,vela2X+53,220);
         
      

  boteX=boteX+1; 
  posteX=posteX+1;
  velaX=velaX+1;
  vela2X=vela2X+1;
 
}


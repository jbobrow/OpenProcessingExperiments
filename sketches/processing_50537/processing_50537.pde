
int barcoX; 
int lineaX;
int triX;
int tri2X;
float sol;

void setup() {
  size(700,500);
  barcoX=50;
  lineaX=135;
  triX=130;
  tri2X=140;
  sol=550;
}

void draw() {
  //diseño
   noStroke();
  background(255,255,255);
 
    fill(202,225,255);
      rect(0,0,699,499);
    fill(255,255,0);
    //sol
      ellipse(sol,100,100,100);
    fill(67,110,238);
        rect(0,300,700,400);
        //barco
     fill(139,69,19);
       quad(barcoX,250,barcoX+170,250,barcoX+150,300,barcoX+20,300);
       //linea
        fill(0);
        stroke(#CC6600);
          strokeWeight(2);
        line(lineaX,150,lineaX,250);
     //triangulos
     stroke(#ffffff);
     fill(#ffffff);
       triangle(triX,150,triX,220,triX-50,220);
       triangle(tri2X,150,tri2X,220,tri2X+53,220);
         
      

  barcoX=barcoX+1; 
  lineaX=lineaX+1;
  triX=triX+1;
  tri2X=tri2X+1;
  sol=sol-0.2;
  
}


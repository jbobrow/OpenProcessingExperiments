
void setup(){
  
  size (1000, 800);
  frameRate(1);


  p = 1 - q;
  
  float l, s;
  boolean wide = true;
  if (width > height){
    l = width;
    s = height;
  }
  else{
    l = height;
    s = width;
    wide = false;
  }
  
  xIni =  wide ? (l / 2) - (5 * s / 12) : s/12 ;
  yIni =  wide ? s/12 : (l / 2) - (5 * s / 12);
  tamTotal = 5 * s / 6;
  tamCuadro = 5 * s / (6*n);
  
  reset();
}

int n = 10; //cuantos cuadros
int k = 7;
float q = 0.48;
float p;
float xIni, yIni, tamTotal, tamCuadro;
int a=0,b=0, i=0;
Point p1,p2,p3,p4;
boolean par=true;
float pax,pay,pbx,pby,pcx,pcy,pdx,pdy;
Point temp1,temp2,temp3,temp4;
float tpax,tpay,tpbx,tpby,tpcx,tpcy,tpdx,tpdy;
Point tp1,tp2,tp3,tp4;

void reset(){
  background(208);
  fill(255);
  //rect( xIni, yIni, tamTotal , tamTotal); 
  
  //  println(tamCuadro);
  //  println(xIni + ", " + yIni);
  //  println((xIni + tamTotal) + ", " + (yIni + tamTotal));
  
  p1 = new Point(xIni + (b* tamCuadro),yIni + (a * tamCuadro));
  p2 = new Point(xIni + (b* tamCuadro) + tamCuadro,yIni + (a * tamCuadro));
  p3 = new Point(xIni + (b* tamCuadro) + tamCuadro,yIni + (a * tamCuadro) + tamCuadro);
  p4 = new Point(xIni + (b* tamCuadro),yIni + (a * tamCuadro) + tamCuadro);
  tp1 = new Point(p1.x, p1.y);
  tp2 = new Point(p2.x, p2.y);
  tp3 = new Point(p3.x, p3.y);
  tp4 = new Point(p4.x, p4.y);
  i = 0;
  
}

void draw(){

  if (i < k)
  {
      println(i);
      for(int a = 0; a<n; a++)
      {
        for(int b = 0; b < n; b++)
        {            
          //println("b:" + b + " - " +p1.x + ", " + p1.y);   
         
          if ( (a+b) % 2 == 0)
          {
            temp1 = new Point(p1.x + (b*tamCuadro), p1.y + (a*tamCuadro));
            temp2 = new Point(p2.x + (b*tamCuadro), p2.y + (a*tamCuadro));
            temp3 = new Point(p3.x + (b*tamCuadro), p3.y + (a*tamCuadro));
            temp4 = new Point(p4.x + (b*tamCuadro), p4.y + (a*tamCuadro));    
          }
          else
          {
            temp1 = new Point(tp1.x + (b*tamCuadro), tp1.y + (a*tamCuadro));
            temp2 = new Point(tp2.x + (b*tamCuadro), tp2.y + (a*tamCuadro));
            temp3 = new Point(tp3.x + (b*tamCuadro), tp3.y + (a*tamCuadro));
            temp4 = new Point(tp4.x + (b*tamCuadro), tp4.y + (a*tamCuadro)); 
          }
          //fill(0, 0, 255 - (i * 255 / k) , (i+400) * 255 / (k*120));        
          
          fill(random(255),random(255),random(255), random(255));
          beginShape();
          vertex(temp1.x,temp1.y);
          vertex(temp2.x,temp2.y);
          vertex(temp3.x,temp3.y);
          vertex(temp4.x,temp4.y);
          endShape(CLOSE);
//          line(temp1.x,temp1.y, temp2.x,temp2.y);
//          line(temp2.x,temp2.y, temp3.x,temp3.y);
//          line(temp3.x,temp3.y, temp4.x,temp4.y);
//          line(temp4.x,temp4.y, temp1.x,temp1.y);
        }        
      }
      
      pax= (p2.x * p) + (p1.x * q);
      pay= (p2.y * p) + (p1.y * q);
    
      pbx= (p3.x * p) + (p2.x * q);
      pby= (p3.y * p) + (p2.y * q);
    
      pcx= (p4.x * p) + (p3.x * q);
      pcy= (p4.y * p) + (p3.y * q);
    
      pdx= (p1.x * p) + (p4.x * q);
      pdy= (p1.y * p) + (p4.y * q);
      
      tpax= (tp1.x * p) + (tp2.x * q);
      tpay= (tp1.y * p) + (tp2.y * q);
    
      tpbx= (tp2.x * p) + (tp3.x * q);
      tpby= (tp2.y * p) + (tp3.y * q);
    
      tpcx= (tp3.x * p) + (tp4.x * q);
      tpcy= (tp3.y * p) + (tp4.y * q);
    
      tpdx= (tp4.x * p) + (tp1.x * q);
      tpdy= (tp4.y * p) + (tp1.y * q);

      p1.x = round(pax);
      p1.y = round(pay);
      p2.x = round(pbx);
      p2.y = round(pby);
      p3.x = round(pcx);
      p3.y = round(pcy);
      p4.x = round(pdx);
      p4.y = round(pdy);
      
      tp1.x = round(tpax);
      tp1.y = round(tpay);
      tp2.x = round(tpbx);
      tp2.y = round(tpby);
      tp3.x = round(tpcx);
      tp3.y = round(tpcy);
      tp4.x = round(tpdx);
      tp4.y = round(tpdy);
      
      i++;
  }
  else{
   // reset();
  }
 
}

void mousePressed(){
  reset();

}

class Point
{ 
  int x;
  int y;
   
  Point(int x, int y)
  {
    this.x = x;
    this.y = y; 
  }
  
  Point(float x, float y){
    this.x = round(x);
    this.y = round(y);
  }
}





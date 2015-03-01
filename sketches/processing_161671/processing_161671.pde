
int y=50, c=50, d=240, m=50, n=150, p=250, q=350, r=450, mov=1;


void setup(){
  size(500, 500);
  frameRate(30);
}

void draw(){
  background(255);
  
 //creacion de circunferencias 
  fill(200, 0, 0);
  ellipse(m, y, 25, 25);
  ellipse( n, y, 25, 25);
  ellipse (p, y, 25, 25);
  ellipse(q, y, 25, 25);
  ellipse(r, y, 25, 25);
  
  
  //creacion de rectangulos
  fill(50, 500, 0);
  rect(c, 300, 120, 20);
  rect(d, 300, 120, 20);



//deinicion de movimientos

if(mov==1){
 y=y+2;

 
}

if(y>=500){
y=50;
}


//atrapadas
if(m==290){
  if(abs(c-50)<60){
  m=290;
  m=m-2;
}
}
if(n==290){
  if(abs(c-150)<60){
   n=290;
   n=n-2;
  }
}
if(p==290){
  if(abs((c+260)-250)<60){
  p=290;
  p=p-2;
}
}
if(q==290){
  if(abs((c+260)-350)<60){
  q=290;
  q=q-2;
}
}
if(r==290){
  if(abs((c+260)-450)<60){
  r=290;
  r=r-2;
}
}

}

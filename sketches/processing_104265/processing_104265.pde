
void setup () {
  size(500, 500);
  background(250);//cor do fundo
}
 int m=-1;
 int n=501;
void draw () {
  if (mouseY< 250)
  {
  //caixas coloridas
  noStroke();
  fill(0,0,195);//caixas azuis
  rect(40,20,40,80);
  rect(140,390,70,100);
  rect(280,120,100,100);
  rect(440,m,61,20);
  fill(210,0,0);//caixas vermelhas
  rect(40,120,40,100);
  rect(110,270,30,60);
  rect(140,20,70,80);
  rect(280,390,100,100);
  fill(240,230,80);//caixas amarelas
  rect(80,100,30,20);
  rect(210,120,70,100);
  rect(380,330,475-380,60);
  
  //linhas horizontais
  stroke(0);
  strokeWeight(6);
  line(m,20,n,20);
  line(m,100,439,100);
  line(m,120,n,120);
  line(m,220,n,220);
  line(m,270,430,270);
  line(m+81,330,n,330);
  line(m,390,n,390);
  line(m,490,430,490);
 
  //linhas verticais
  line(40,m,40,n);
  line(80,m,80,n);
  line(110,100,110,n);
  line(140,m,140,n);
  line(210,m,210,n);
  line(280,m,280,n);
  line(380,100,380,n);
  line(440,m,440,119);
  line(475,330,475,n);
 
  }
  else {
//caixas coloridas
  noStroke();
  fill(240,230,80);//caixas amarelas
  rect(40,20,40,80);
  rect(140,390,70,100);
  rect(280,120,100,100);
  rect(440,m,61,20);
  fill(0,0,195);//caixas azuis
  rect(40,120,40,100);
  rect(110,270,30,60);
  rect(140,20,70,80);
  rect(280,390,100,100);
  fill(210,0,0);//caixas vermelhas
  rect(80,100,30,20);
  rect(210,120,70,100);
  rect(380,330,475-380,60);
  
  //linhas horizontais
  stroke(0);
  strokeWeight(6);
  line(m,20,n,20);
  line(m,100,439,100);
  line(m,120,n,120);
  line(m,220,n,220);
  line(m,270,430,270);
  line(m+81,330,n,330);
  line(m,390,n,390);
  line(m,490,430,490);
 
  //linhas verticais
  line(40,m,40,n);
  line(80,m,80,n);
  line(110,100,110,n);
  line(140,m,140,n);
  line(210,m,210,n);
  line(280,m,280,n);
  line(380,100,380,n);
  line(440,m,440,119);
  line(475,330,475,n);
  }
}

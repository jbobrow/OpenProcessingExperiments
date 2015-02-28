
void setup () {
  janelas=new int [7] [20];
  size(700, 500);
  background(153, 217, 234);


for (int c=1; c<550; c+=1){ 
  stroke(c/2,100,140); 
line(0,c,1000,c);} // Degradê: Céu

//montanhas
fill(0,85,0);
stroke(0,85,0);
quad(0,350,0,170,250,220,280,350); 
triangle(80,350,700,100,700,350);

  
  //chão
  fill(100);
  stroke(100);
  line(0, 350, 700, 350);
  rect(0, 350, 700, 150);

  //telhado
  fill(208, 177, 136);
  rect(90, 235, 530, 10);
  rect(90, 220, 530, 10);
  fill(100);
  quad(80, 220, 83, 215, 627, 215, 630, 220);

  ellipse(80, 220, 2, 2);


  }

//nichos

int[][]janelas;


void draw() { 
  stroke(0);  //linhas verticais
  int d = 30; 
  int h = 15;
  
  fill(239, 228, 176);


  for ( int i = 100; i<width-100; i=i+d) {
    for (int j = 245; j<height-150; j=j+h) {
      rect(i, j, d, h);

      for ( int l = 82; l<630;l=l+5) { 
        ellipse(l, 220, 2, 2);

        for ( int m =93; m<632; m=m+20) {
          rect(m, 229, 4, 5);
        }
      }
    }
  }
  if (mousePressed) {

  
  fill(0,100);
  for ( int f =100; f<632; f=f+90) {
  rect(f,245,30,15);
  }
  for ( int g =130; g<602; g=g+60) {
  rect(g,260,30,15);
  }
  for ( int w =100; w<632; w=w+60) {
  rect(w,275,30,15);
  }
  for ( int q =160; q<572; q=q+120) {
  rect(q,290,30,15);
  }
  
  for ( int v =100; v<632; v=v+90) {
  rect(v,305,30,15);
  }
  for ( int k =130; k<602; k=k+60) {
  rect(k,320,30,15);
  }
  for ( int x =100; x<632; x=x+60) {
  rect(x,335,30,15);
  }
  }
  else{
    fill(0,100);
  for ( int f =100; f<632; f=f+60) {
  rect(f,245,30,15);
  }
  for ( int g =130; g<602; g=g+90) {
  rect(g,260,30,15);
  }
  for ( int w =100; w<632; w=w+90) {
  rect(w,275,30,15);
  }
  for ( int q =160; q<572; q=q+60) {
  rect(q,290,30,15);
  }
  
  for ( int v =100; v<632; v=v+90) {
  rect(v,305,30,15);
  }
  for ( int k =130; k<602; k=k+60) {
  rect(k,320,30,15);
  }
  for ( int x =100; x<632; x=x+120) {
  rect(x,335,30,15);
  }
  }
}

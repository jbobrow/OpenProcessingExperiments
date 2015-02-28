
int x=348;
int xt=348;
int y=177;
int yt=177;
int p=18;
int t=255;

void setup (){
  size(545,406);}

void draw(){
  PImage img;
  img = loadImage("Bilbao_corte.jpg");
  image(img,0,0,545,406);
// tapo el invader original como si hubiese habido un crimen
//hide the original invader as if it was a crime
  fill(180,250);
  stroke(255,250);
  strokeWeight(5);
  beginShape();
  vertex(xt,yt); //1
  vertex(xt+3*p,yt); //2
  vertex(xt+3*p,yt+p);//3
  vertex(xt+4*p,yt+p);//4
  vertex(xt+4*p,yt+2*p); //5
  vertex(xt+5*p,yt+2*p); //6
  vertex(xt+5*p,yt+4*p); //7
  vertex(xt+4*p,yt+4*p); //8
  vertex(xt+4*p,yt+5*(p+1)); //9
  vertex(xt+5*(p+1),yt+5*(p+1)); //10
  vertex(xt+5*(p+1),yt+6*(p+1)); //11
  vertex(xt+6*(p+1),yt+6*(p+1)); //12
  vertex(xt+6*(p+1),yt+7*(p+1)); //13
  vertex(xt-3*(p+1),yt+7*(p+1)); //14
  vertex(xt-3*(p+1),yt+6*(p+1)); //15
  vertex(xt-2*(p+1),yt+6*(p+1)); //16
  vertex(xt-2*(p+1),yt+5*(p+1)); //17
  vertex(xt-1*(p+1),yt+5*(p+1)); //18
  vertex(xt-1*(p+1),yt+4*p); //19
  vertex(xt-2*p,yt+4*p); //20
  vertex(xt-2*p,yt+2*p); //21
  vertex(xt-1*p,yt+2*p); //22
  vertex(xt-1*p,yt+p); //23
  vertex(xt,yt+p); //24
  vertex(xt,yt); //25
  endShape();

//cuerpo (body)
  fill(105,142,148,t);
  stroke(100,t);
  strokeWeight(1);
  pix(0,3,1,p);
  pix(-1,5,2,p);
  pix(-2,7,3,p);
  pix(-2,7,4,p);
  pix(-1,5,5,p);
  //patas (legs)
  for (int xi=x-2*p;xi<=x+4*p;xi+=p*2){
    rect(xi,y+(6-1)*p,p,p);}
  for (int xi=x-3*p;xi<=x+5*p;xi+=p*2){
    rect(xi,y+(7-1)*p,p,p);}
  //ojos (eyes)
  fill(255,t);
  rect(x,y+2*p,p,p);
  rect(x+2*p,y+2*p,p,p);
  rect(x,y+3*p,p,p);
  rect(x+2*p,y+3*p,p,p);
  //pupila (pupil)
  noStroke();
  fill(0,t);
  rect(x,y+3*p,p,p);
  rect(x+2*p,y+3*p,p,p);
  t-=4;
  x-=4; y-=3;
  if (y<=-20){x=348;y=177;t=255;}
  }
  
//funcion para dibujar el invader
//function to draw the invader
void pix(int pos,int cant, int fila, int p){
  for (int c=0;c<=cant-1;c++){
  rect(x+pos*p+p*c,y+(fila-1)*p,p,p);}}


// basado en SpaceInvaders (inspired by Space Invaders) http://www.flickr.com/photos/50ftw/5345483408/
//picture by Tucu 
  


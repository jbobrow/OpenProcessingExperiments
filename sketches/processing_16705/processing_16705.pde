
//el invader festeja cuando se libera de los pixeles que lo tienen atrapado
//the invader celebrates when it gets free from the pixels that have it caught 

int p=20;
int v=1;
int f=1;
int y=0;
color r=color(250,40,40);
color b=color(8,8,129);
void setup(){
size(400,340);
frameRate(3);
}

void draw(){
  background(255);
  noStroke();
  int ve=v%2; //variable para fill (define variable for fill conditions)
  
//3er línea de pixeles (3rd line of pixels)
  if (v==4){fill(255);} else if (ve==0){fill(b);} else {fill(r);}
  rect(p*3,0,p,p);
  rect(16*p,0,p,p);
  rect(p*2,p,p,p);
  rect(17*p,p,p,p);
  rect(p,2*p,p,3*p);
  rect(18*p,2*p,p,3*p);
  rect(0,4*p,p,p);
  rect(19*p,4*p,p,p);
  rect(0,15*p,6*p,p);
  rect(14*p,15*p,6*p,p);
  rect(6*p,16*p,8*p,p);
  
//2nda línea de pixeles (2nd line of pixels)
  if (v==1){fill(b);} else if (v==2) {fill(r);} else {fill(255);}
  rect(6*p,p,8*p,p);
  rect(4*p,2*p,2*p,p);
  rect(14*p,2*p,2*p,p);
  rect(3*p,3*p,p,3*p);
  rect(16*p,3*p,p,3*p);
  rect(p,6*p,2*p,p);
  rect(17*p,6*p,2*p,p); 
  rect(p,7*p,p,6*p);
  rect(18*p,7*p,p,6*p);  
  rect(p,13*p,6*p,p);
  rect(13*p,13*p,6*p,p);
  rect(p+6*p,14*p,6*p,p);
 
//1ra línea de pixeles (1st line of pixels)
  if (v==1){fill(r);} else {fill(255);}
  rect(7*p,3*p,6*p,p);
  rect(5*p,4*p,2*p,p);
  rect(13*p,4*p,2*p,p);
  rect(5*p,5*p,p,2*p);
  rect(14*p,5*p,p,2*p);
  rect(4*p,7*p,p,p);
  rect(15*p,7*p,p,p);
  rect(3*p,8*p,p,3*p);
  rect(16*p,8*p,p,3*p);
  rect(3*p,11*p,5*p,p);
  rect(12*p,11*p,5*p,p);
  rect(8*p,12*p,4*p,p);

// invader
  pushMatrix();
  translate(0,y);
  //cuerpo constante (body not changing)
  fill(b);
  rect(8*p,5*p,p,p);
  rect(11*p,5*p,p,p);
  rect(7*p,6*p,6*p,2*p);
  rect(6*p,8*p,8*p,p);
  rect(8*p,9*p,p,p);  
  rect(11*p,9*p,p,p);  
  
  //festejo (celebration)
    //brazos y boca (arms and mouth)
    if(v==4){
      rect(5*p,7*p,p,2*p);
      rect(14*p,7*p,p,2*p);
      rect(8*p,10*p,p,p);  
      rect(11*p,10*p,p,p);
      fill(r);
      rect(9*p,10*p,2*p,p);
      fill(b);
      rect(9*p,11*p,2*p,p);}    
    else{  
    rect(9*p,10*p,2*p,p); 
    rect(5*p,9*p,2*p,p); 
    rect(13*p,9*p,2*p,p);} 
      
    //ojitos (eyes)
    if (v==4){
      stroke(40);
      strokeWeight(7);
      noFill();
      arc(8*p+10,8*p,1.5*p,1.5*p,radians(180),radians(360));
      arc(11*p+10,8*p,1.5*p,1.5*p,radians(180),radians(360));}
    else {
      fill(40);
      rect(8*p,7*p,p,p);
      rect(11*p,7*p,p,p); }
    popMatrix();

// lineas para pixelar (lines to simulate pixels)
  strokeWeight(1); 
  stroke(200);
  for (int l=0;l<=width;l+=p){
    line(l,0,l,height);}
  for (int l=0;l<=height;l+=p){
    line(0,l,width,l);}
  v++;
  f++;
  if (v==5){v=4;if(f<5){y=0;}else if (f%2==0){y=20;} else {y=-20;}} //saltitos (jumping)
  if (f==11){v=1;f=1;y=0;}  //reinicio (restarts)
}

//inspirado en Invader de Londres http://www.flickr.com/photos/50ftw/5255193277/ foto por mi prima
//serie space-invaders http://www.space-invaders.com/som.html



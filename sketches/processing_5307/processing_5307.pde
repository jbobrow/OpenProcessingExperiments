
void setup (){ 
  size (500,250);
  background (0);
}
void draw () {
int i=10;
while (i < width/2){
  noStroke ();
 fill (255);
  rect  (i,15,10,110);
  i=i+20;
  
  int a=20;
while (a < width/2){
  noStroke ();
 fill (194);
  rect  (a,15,10,110);
  a=a+20;
  
int h=15;
while (h < height/2){
   noStroke ();
 fill (245,184,0);
  rect  (260,h,230,10);
  h=h+20;
 
 int q=25;
while (q < height/2){
   noStroke ();
 fill (255,255,255);
  rect  (260,q,230,10);
  q=q+20;
  
 // fondos blancos de las diagonales
 
 noStroke();
fill (255);
  rect (10,135,230,110);

noStroke();
fill (255);
  rect (260,135,230,110);
  
//lienas diagonal rosadas
  
stroke (255,10,133);
strokeWeight (10);

line (25,135,10,150);
line (55,135,10,180);   
line (85,135,10,210);
line (115,135,10,240);   
line (145,135,10,270);
line (175,135,10,300);   
line (205,135,10,330);
line (235,135,10,360);   
line (250,150,10,390);   
line (250,180,10,420);
line (250,210,10,450);  



//lineas diagonales azules

stroke(71,163,255); 
line (475,135,490,150);
line (445,135,490,180);
line (415,135,490,210);
line (385,135,490,240);  
line (355,135,490,270);
line (325,135,490,300);  
line (295,135,490,330);  
line (260,130,490,360);
line (260,160,490,390);   
line (260,190,490,420);
line (260,220,490,450);  


//lineas negras

stroke (0);
strokeWeight (20);
line (0,0,0,250);
line (0,125,500,125);
line (250,0,250,250);
line (0,250,500,250);
line (500,0,500,250);

}}}}}



int horizontal;
int vertical;
int mano;
void setup(){
size(500,500);

smooth();
horizontal=0;
vertical=0;
mano=0;
noStroke();

fill(random(255),random(255),random(255));

}
void draw(){
  background(255);
  rect(horizontal,vertical,100,100);
 
 if (mano==0){
   vertical=vertical+1;
   
   
 }
 
 if (vertical==400){
   mano=1;
   fill(random(50),(100),(150));
 }
 
 if (mano==1){
 horizontal=horizontal+1;
 }
 
 if (horizontal==400){
   mano=5;
   fill((255),random(50),(255));
 }
 
 if (mano==5){
   vertical=vertical-1;
 }
 
 if (vertical==0){
   mano=10;
   fill((255),(255),random(50));
 }
 
 if (mano==10){
   horizontal=horizontal-1;
 }
 
 if (horizontal==0){
 mano=0;
 fill((250),random(50),50);
 }
}



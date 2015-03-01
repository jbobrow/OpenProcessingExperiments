
float luna=2;
float gato=0;
void setup(){
size (600,600);

} 
void draw(){
 gato=gato+2;
 luna=luna*1.2;
 background (gato);

 fill (15,26,156);
ellipse(gato,luna,50,50); 


}

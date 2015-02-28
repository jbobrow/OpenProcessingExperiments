
void setup(){
size(200,200);
}
void draw(){
background( 0 );
fill(255);
if( !(mousePressed) ){ //se cumple si NO es mayor a 100
rect( 50 , 50 , 100 , 100 );
}
fill(255,110,0,145);
rect(0,0,100,200);

}

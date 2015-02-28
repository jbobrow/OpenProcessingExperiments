
void setup(){

size(200,200);

} 
void draw(){

background( 0 ); 
fill(255);
if( mouseX > 100 ){

rect( 50 , 50 , 100 , 100 );

}else if( mouseX > 50 ){

ellipse( 100 , 100 , 100 , 100 );

}else{

triangle(50,150,100,50,150,150);

}
fill(255,300,0,70);
rect(100,0,100,200);
rect(50,0,150,200);

}

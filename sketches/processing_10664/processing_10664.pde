
void setup () {
size( 200, 200 );
smooth();
noStroke();
colorMode( RGB );
frameRate(5);
}

void draw (){
color rgb_farbe;  
if (mousePressed){
 // wenn maus gedrückt, ändere farbe
rgb_farbe = color(random(255),random(255),random(255)); // violett
}else{
 // wenn nicht gedrückt diese farbe
rgb_farbe = color(150,130,220); // violett 
}
color rgb_farbe1 = color(250,249,0); // gelb
color rgb_farbe2 = color(0,250,70); // grün
color rgb_farbe3 = color(250,249,0); // schuhe gelb

noStroke();

// flächen für gesicht und augen
fill( rgb_farbe3 );    
ellipse( 50, 50, 60, 60 );    
ellipse( 140, 50, 60, 60 );    
rect( 60, 10,  70, 90 );

// pupillen und nasenrücken
fill( rgb_farbe ); 
ellipse( 50, 50, 20, 60 );    
ellipse( 140, 50, 20, 60 );
rect( 60, 10,  70, 90 );

// nasenlöcher
fill( rgb_farbe1 );  
rect(100, 70,  20, 20 );
rect(70, 70,  20, 20 );

// bauch und beine
fill(250,0,0);
rect(70, 110,  10, 60 );
rect(110, 110, 10, 60 );
fill( rgb_farbe2 ); 
ellipse( 95, 134, 70, 70 ); 

// schuhe
fill( rgb_farbe3 ); 
stroke(250,0,0);
ellipse( 50, 170, 50, 10 ); 
stroke(250,0,0);
ellipse( 140, 170, 50, 10 );


}





LineworkDrawer ld = new LineworkDrawer();
float in_r, out_r, max_span;
PVector center_loc;

void setup(){
   size( 800, 500 );
   smooth();
   frameRate( 15 );
   fill( 13,131,14);
   

   in_r = width / 5;
   out_r = sqrt( pow( width, 2 ) + pow( height, 2 ) );
   max_span = TWO_PI / 80;
   
   center_loc = new PVector( width / 2, height / 2 );
}

void draw(){
   background(255,0,0 );
   ld.saturation( center_loc );


for(int b=50;b<700;b=b+400){  // repetição da parte amarela
for(int a= 80;a<450;a=a+80) {
rect(50,a,300,80);
rect(b,a,300,80);
}fill(234,216,156);
}

for( int b=50; b<750; b=b+500) {  //repetição rect marrom. onde planta flor
for(int a=140; a<500 ; a=a+80){
  rect(50,a,200,20);
  rect(b,a,200,20);
}fill(175,141,104);
}
rect(350,320,100,80);
 rect(350,320,100,10);//lance
 
  fill(56,118,59);
  rect(-2,430,800,100);
  
  fill(255);
 rect(345,405,110,10); //escadas
 rect(342,415,117,10);

fill(255);
 quad(340,425,461,425,500,480,300,480);
 fill(200);
 quad(354,400,446,400,455,405,345,405);
 fill(147,133,80);
 rect(350,330,100,70);
 line(354,330,354,400);
 line(446,330,446,400);
 fill(131,103,56);
 rect(375,330,50,70);
 fill(118,104,49);
 quad(350,80,362,150,362,320,350,320);
 quad(438,150,450,80,450,320,438,320);
rect(362,150,76,170);
fill(45,60,100);
for(int b=560; b<800; b=b+500){
for(int a=80; a<400 ;a=a+80) {
 rect(60,a,80,60);
rect(160,a,80,60);
 rect(b,a,80,60);
rect(b+100,a,80,60);

}
}
fill(175,141,104);
for(int a=50; a<751 ; a=a+500) {
  rect(a,60,200,30);
}


fill(45,60,100);

 for(int b=480; b<550; b=b+1000){
 for(int a=90; a<400; a=a+80){
  rect(250,a,70,50); 
  rect(b,a,70,50);
 }
 }
 fill(59,147,40);
 rect(0,460,800,100);
 


  

}



class LineworkDrawer{
   LineworkDrawer(){
   }

   public void saturation( PVector loc ){
       float wid = 0;
       float tremor;
       for( float theta = 0 ; theta < TWO_PI; theta += wid ){
           wid = random( max_span );
           if( theta + wid <= TWO_PI ){
             tremor = random(0.8, 1.2);
             triangle( loc.x + cos( theta + wid / 2 ) * ( in_r * tremor ),
                       loc.y + sin( theta + wid / 2 ) * ( in_r * tremor ),
                       loc.x + cos( theta ) * out_r,
                       loc.y + sin( theta ) * out_r,
                       loc.x + cos( theta + wid ) * out_r,
                       loc.y + sin( theta + wid ) * out_r
                      );
             theta += wid;
           }
       }
   }
}
//usei como base a animação de nome "bokuhitsu", publicada no link: http://tinytintoto.tumblr.com/post/53599333566



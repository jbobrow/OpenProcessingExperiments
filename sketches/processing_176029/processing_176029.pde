
color gris,blanco=color(255),negro=0;
gris=color(128);
grisFuerte=60;
size(202,202);
for(int j=0 ; j<8 ; j++){  
    for(int i=0 ; i<8 ; i++){
        if( (i+j)% 2 == 0 ){
           fill (0)
        }
        else{
            fill( 0,128 );
        }
        rect( i * 25 , j * 25 , 25 , 25 );
    }
}

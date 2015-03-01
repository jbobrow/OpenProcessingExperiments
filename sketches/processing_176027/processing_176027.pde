
size(200,200);
for(int j=0 ; j<8 ; j++){  
    for(int j=0 ; j<8 ; j++){
        if( (i+j)% 2 == 0 ){
           fill (0)
        }
        else{
            fill( 255 );
        }
        rect( i * 25 , j * 25 , 25 , 25 );
    }
}

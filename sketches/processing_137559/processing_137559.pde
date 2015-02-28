
size(500,500);
for(int j=0 ; j<20 ; j++){
for(int i=0 ; i<20 ; i++){
if( (i+j) % 2 == 0 ){ 
fill( random(255) );
}else{fill( random(255) );
}rect( i * 25 , j * 25 , 25 , 25 );
}
}

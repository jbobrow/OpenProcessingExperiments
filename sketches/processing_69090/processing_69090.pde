
int counter;

size (400,400);
fill (120,0,8);
for( int i=20; i <width-7; i = i + 30){
 for(int j=20; j <height-7;j=j+45){
 quad( i,j,i+50,j+50,i-43,j-43,i+200,j-200);
} 
}
